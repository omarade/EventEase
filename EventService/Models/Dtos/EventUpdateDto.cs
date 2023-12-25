using System.ComponentModel.DataAnnotations;

namespace EventService.Models.Dtos
{
    public class EventUpdateDto
    {
        [Required]
        public string? Name { get; set; }

        [Required] 
        public string? Type { get; set;}

        [Required]
        public string? Artist { get; set; }

        [Required]
        public string? Description { get; set; }

        // [Required]
        // public DateTime Time { get; set; }

        // [Required]
        // public string ImgPath { get; set; }
    }
}