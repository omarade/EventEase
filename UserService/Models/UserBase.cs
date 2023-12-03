using System.ComponentModel.DataAnnotations;

namespace UserService.Models
{
    public class UserBase
    {
        [Key]
        [Required]
        public int Id { get; set; }

        [Required]
        public string? Name { get; set; }

        [Required]
        public string? Email { get; set; }

        
    }
}