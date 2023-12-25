using System.ComponentModel.DataAnnotations;

namespace UserService.Models.Dtos
{
    public class VenueUpdateDto
    {
        [Required]
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
    }
}