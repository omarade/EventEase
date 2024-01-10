using System.ComponentModel.DataAnnotations;

namespace EventService.Models.Dtos
{
    public class EventUpdateDto
    {
        [Required]
        [StringLength(50, ErrorMessage = "Name length cannot be more than 50")]
        [RegularExpression(@"^[a-zA-Z0-9 ]+$", ErrorMessage = "Event name is not valid")]
        public string Name { get; set; }

        [Required] 
        [StringLength(30)]
        public string Type { get; set;}

        [Required]
        [StringLength(50)]
        public string Artist { get; set; }

        [StringLength(200)]
        public string Description { get; set; }

        public DateTime DateTime { get; set; }

        public string ImgPath { get; set; }
    }
}