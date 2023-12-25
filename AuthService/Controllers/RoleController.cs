using AuthService.Data;
using AuthService.Dtos;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace AuthService.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RoleController : ControllerBase
    {
        private readonly AppDbContext _apiDbContext;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ILogger<RoleController> _logger;

        public RoleController(AppDbContext apiDbContext, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, ILogger<RoleController> logger)
        {
            _apiDbContext = apiDbContext;
            _userManager = userManager;
            _roleManager = roleManager;
            _logger = logger;
        }

        [HttpGet]
        public IActionResult GetAllRoles()
        {
            var roles = _roleManager.Roles.ToList();
            return Ok(roles);
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> CreateRole(RoleCreateDto roleCreateDto)
        {
            //Check if role already exsits
            var roleExists = await _roleManager.RoleExistsAsync(roleCreateDto.Name);

            //Check if role has been added successfully 
            if (roleExists)
            {
                return Conflict($"Role type '{roleCreateDto.Name}' already exists");
            }

            var roleResult = await _roleManager.CreateAsync(new IdentityRole(roleCreateDto.Name));

            if (roleResult.Succeeded)
            {
                _logger.LogInformation($"New Role Type '{roleCreateDto.Name}' has been created");
                return Ok($"New Role Type '{roleCreateDto.Name}' has been created!");
            }
            _logger.LogInformation($"New Role Type '{roleCreateDto.Name}' has not been created");
            return BadRequest($"New Role Type '{roleCreateDto.Name}' has not been created");        
        }

        [HttpPost]
        [Route("AssignRoleToUser")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> AssignRoleToUser(UserRoleDto userRoleDto)
        {
            //Check if user exists
            var user = await _userManager.FindByEmailAsync(userRoleDto.Email);
            if (user is null)
            {
                _logger.LogInformation($"User with email '{userRoleDto.Email}' does not exist");
                return BadRequest("User does not exist");
            }
            
            //Check if role exists
            var roleExists = await _roleManager.RoleExistsAsync(userRoleDto.Role);
            if (!roleExists)
            {
                _logger.LogInformation($"Role type '{userRoleDto.Role}' does not exist");
                return BadRequest($"Role type '{userRoleDto.Role}' does not exist");
            }

            //Assign role to user
            var result = await _userManager.AddToRoleAsync(user, userRoleDto.Role);

            //Check if role is assigned to user successfully
            if (result.Succeeded)
            {
                _logger.LogInformation($"New role has been assigned successfully to user with email: '{user.Email}'");
                return Ok($"New role has been assigned successfully to user with email: '{user.Email}'");
            }

            _logger.LogInformation($"Failed to assign new role to user with email: '{user.Email}'");
            return BadRequest($"Failed to assign new role to user with email: '{user.Email}'"); 
        }

        [HttpGet]
        [Route("GetUserRoles")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> GetUserRoles(string email)
        {
            //Check if the user exists
            var user = await _userManager.FindByEmailAsync(email);

            if (user is null)
            {
                _logger.LogInformation($"User with email '{email}' does not exist");
                return BadRequest("User does not exist");
            }

            //Get user roles
            var roles = await _userManager.GetRolesAsync(user);

            return Ok(roles);
        }

        [HttpPost]
        [Route("UnassignUserRole")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> UnassignUserRole(UserRoleDto userRoleDto)
        {           
            //Check if user exists
            var user = await _userManager.FindByEmailAsync(userRoleDto.Email);
            if (user is null)
            {
                _logger.LogInformation($"User with email '{userRoleDto.Email}' does not exist");
                return BadRequest("User does not exist");
            }
            //Check if role exists
            var roleExists = await _roleManager.RoleExistsAsync(userRoleDto.Role);
            if (!roleExists)
            {
                _logger.LogInformation($"Role type '{userRoleDto.Role}' does not exist");
                return BadRequest($"Role type '{userRoleDto.Role}' does not exist");
            }

            var result = await _userManager.RemoveFromRoleAsync(user, userRoleDto.Role);

            if (result.Succeeded)
            {
                return Ok($"Role '{userRoleDto.Role}' has been removed for user with email: '{user.Email}'");
            }

            return BadRequest($"Unable to remove role '{userRoleDto.Role}' for user with email: '{user.Email}'");
        }
    }
}