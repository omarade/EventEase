using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace EventService.Models
{
    public class Client
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

        [JsonIgnore]
        public ICollection<Event> Events { get; set; }
    }
}