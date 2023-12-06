using System.ComponentModel.DataAnnotations;

namespace AuthService.Dtos
{
    public class UserRegisterDto
    {
        [Required]
        public string Name { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        public string Role { get; set; }
    }
}