using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace EventService.Models
{
    public class Event
    {
        [Key]
        [Required]
        public int Id { get; set; }

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

        [Required]
        public DateTime DateTime { get; set; }

        public string ImgPath { get; set; }

        [Required]
        public int TotalTickets { get; set; }

        [Required]
        public int RemainingTickets { get; set; }

        [Required]
        public Venue Venue { get; set; }

        [JsonIgnore]
        public ICollection<Client> Clients { get; set; }
    }
}