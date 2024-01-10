using System.ComponentModel.DataAnnotations;

namespace UserService.Models.Dtos
{
    public class ClientUpdateDto
    {
        [Required]
        [StringLength(70)]
        [RegularExpression(@"^[a-zA-Z ]+$")]
        public string Name { get; set; }
    }
}