using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using AuthService.Configurations;
using AuthService.Dtos;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace AuthService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly ILogger<AuthController> _logger;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly JwtConfig _jwtConfig;

        public AuthController(ILogger<AuthController> logger, UserManager<IdentityUser> userManager, IOptionsMonitor<JwtConfig> _optionsMonitor)
        {
            _logger = logger;
            _userManager = userManager;
            _jwtConfig = _optionsMonitor.CurrentValue;
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] UserLoginReqDto loginReqDto)
        {
            if(ModelState.IsValid){
                var existingUser = await _userManager.FindByEmailAsync(loginReqDto.Email);

                if(existingUser == null){
                    return BadRequest("Invalid authentication");
                }

                var isPasswordValid = await _userManager.CheckPasswordAsync(existingUser, loginReqDto.Password);

                if(isPasswordValid)
                {
                    var token = GenerateJwtToken(existingUser);

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
        public async Task<IActionResult> Register([FromBody] UserRegisterReqDto registerReqDto)
        {
            if(ModelState.IsValid)
            {
                //check if email exists in db
                var emailExists = await _userManager.FindByEmailAsync(registerReqDto.Email);

                if(emailExists != null)
                {
                    return BadRequest("Provided email already has an account");
                }

                var user = new IdentityUser()
                {
                    Email = registerReqDto.Email,
                    UserName = "test"

                };

                var isCreated = await _userManager.CreateAsync(user, registerReqDto.Password);

                if(isCreated.Succeeded)
                {
                    //Generate token
                    var token = GenerateJwtToken(user);
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

        private string GenerateJwtToken(IdentityUser user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.ASCII.GetBytes(_jwtConfig.Secret);

            var tokenDescriptor = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(new [] 
                {
                    new Claim("Id", user.Id),
                    new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                    new Claim(JwtRegisteredClaimNames.Email, user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                }),
                Expires = DateTime.UtcNow.AddHours(4),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key),
                    SecurityAlgorithms.HmacSha512)

            };

            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            var jwtToken = jwtTokenHandler.WriteToken(token);
            return jwtToken;
        }
    }
}