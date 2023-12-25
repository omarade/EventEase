using System.ComponentModel.DataAnnotations;

namespace EventService.Models.Dtos
{
    public class ClientEventCreateDto
    {
        [Required]
        public int TicketsNum { get; set; }
    }
}