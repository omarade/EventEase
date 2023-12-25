using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace EventService.Models
{
    public class ClientEvent
    {
        [Key]
        [Required]
        public int Id { get; set; }

        [Required]
        public int ClientId { get; set; }

        [Required]
        public int EventId { get; set; }

        [Required]
        public int TicketsNum { get; set; }

        [JsonIgnore]
        public Event Event { get; set; }
        
        [JsonIgnore]
        public Client Client { get; set; }
    }
}