using System.ComponentModel.DataAnnotations;

namespace UserService.Models
{
    public class Venue : UserBase
    {
        [Required]
        public string? PhoneNumber { get; set; }

        [Required]
        public string? Location { get; set; }
    }
}