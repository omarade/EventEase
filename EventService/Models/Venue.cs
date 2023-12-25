using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace EventService.Models
{
    public class Venue
    {
        [Key]
        [Required]
        public int Id { get; set; }

        [Required]
        public string ExternalId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Email { get; set; }

        public string PhoneNumber { get; set; }
     
        public string Address { get; set; }
              
        public string City { get; set; }

        [JsonIgnore]
        public ICollection<Event> Events { get; set; }
    }
}