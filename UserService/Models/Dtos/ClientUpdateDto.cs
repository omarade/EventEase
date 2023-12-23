using System.ComponentModel.DataAnnotations;

namespace UserService.Models.Dtos
{
    public class ClientUpdateDto
    {
        [Required]
        public string Name { get; set; }
    }
}