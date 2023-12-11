using AuthService.Configurations;
using AuthService.Dtos;
using AuthService.Helpers;
using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace AuthService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly ILogger<AuthController> _logger;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IMapper _mapper;
        private readonly JwtConfig _jwtConfig;
        private readonly IPublishEndpoint _publishEndpoint;

        public AuthController(ILogger<AuthController> logger, 
            UserManager<IdentityUser> userManager,
            RoleManager<IdentityRole> roleManager, 
            IOptionsMonitor<JwtConfig> optionsMonitor,
            IMapper mapper,
            IPublishEndpoint publishEndpoint)
        {
            _logger = logger;
            _userManager = userManager;
            _jwtConfig = optionsMonitor.CurrentValue;
            _roleManager = roleManager;
            _mapper = mapper;
            _publishEndpoint = publishEndpoint;
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] LoginDto loginDto)
        {
            if(ModelState.IsValid){
                var user = await _userManager.FindByEmailAsync(loginDto.Email);

                if(user == null){
                    return BadRequest("Invalid authentication");
                }

                var isPasswordValid = await _userManager.CheckPasswordAsync(user, loginDto.Password);

                if(isPasswordValid)
                {
                    var userClaims = await _userManager.GetClaimsAsync(user);
                    var userRoles = await _userManager.GetRolesAsync(user);
                    
                    var token = await JWTHelper.GenerateJwtToken(user, _jwtConfig, userClaims, userRoles);

                    return Ok(new UserLoginResDto() 
                    {
                        Token = token,
                        Result = true
                    });
                }

                return BadRequest("Invalid authentication");
            }

            return BadRequest("Invalid request payload");
        }

        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register([FromBody] UserRegisterDto registerDto)
        {
            if(ModelState.IsValid)
            {
                //check if email exists in db
                var emailExists = await _userManager.FindByEmailAsync(registerDto.Email);

                if(emailExists != null)
                {
                    return BadRequest("Provided email already has an account");
                }

                var user = new IdentityUser()
                {
                    Email = registerDto.Email,
                    UserName = registerDto.Email
                };

                var isCreated = await _userManager.CreateAsync(user, registerDto.Password);

                if(isCreated.Succeeded)
                {
                    //Check if role exists
                    var roleExists = await _roleManager.RoleExistsAsync(registerDto.Role);
                    if (!roleExists)
                    {
                        _logger.LogInformation($"Role type '{registerDto.Role}' does not exist");
                        return BadRequest($"Role type '{registerDto.Role}' does not exist");
                    }

                    //Assign role to user
                    var result = await _userManager.AddToRoleAsync(user, registerDto.Role);

                    if (result.Succeeded)
                    {
                        _logger.LogInformation($"New role has been assigned successfully to user with email: '{user.Email}'");
                    }

                    //Publish UserCreated event
                    //var userCreated = _mapper.Map<UserCreated>(user);
                    var userCreated = new UserCreated() {
                        Id = user.Id,
                        Name = registerDto.Name,
                        Email = user.Email,
                        Role = registerDto.Role
                    };
                    Console.WriteLine($"----> Writing message to RabbitMQ {userCreated.Id}");
                    await _publishEndpoint.Publish<UserCreated>(userCreated);

                    //Generate token
                    var userClaims = await _userManager.GetClaimsAsync(user);
                    var userRoles = await _userManager.GetRolesAsync(user);

                    var token = await JWTHelper.GenerateJwtToken(user, _jwtConfig, userClaims, userRoles);
                    return Ok(new UserRegisterResDto()
                    {
                        Result = true,
                        Token = token
                    });
                }

                return BadRequest(isCreated.Errors.Select(x => x.Description).ToList());
            }

            return BadRequest("Invalid request payload");
        }

        
    }
}