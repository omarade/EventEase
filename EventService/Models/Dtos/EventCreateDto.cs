using System.ComponentModel.DataAnnotations;

namespace EventService.Models.Dtos
{
    public class EventCreateDto
    {
        [Required]
        public int VenueId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required] 
        public string Type { get; set;}

        [Required]
        public string Artist { get; set; }

        [Required]
        public string Description { get; set; }

        // [Required]
        // public DateTime Time { get; set; }

        // [Required]
        // public string ImgPath { get; set; }

        [Required]
        public int TotalTickets { get; set; }

        [Required]
        public int RemainingTickets { get; set; }
    }
}