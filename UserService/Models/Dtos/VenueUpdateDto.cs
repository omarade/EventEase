using System.ComponentModel.DataAnnotations;

namespace UserService.Models.Dtos
{
    public class VenueUpdateDto
    {
        [Required]
        [StringLength(70, ErrorMessage = "Name length cannot be more than 70")]
        [RegularExpression(@"^[a-zA-Z0-9 ]+$", ErrorMessage = "Name is not valid")]
        public string Name { get; set; }

        [StringLength(20, ErrorMessage = "Phone number length cannot be more than 20")]
        [Phone]
        public string PhoneNumber { get; set; }

        [StringLength(50, ErrorMessage = "Address length cannot be more than 50")]
        [RegularExpression(@"^[a-zA-Z0-9 ]+ \d+$", ErrorMessage = "Address is not valid")]
        public string Address { get; set; }

        [StringLength(30, ErrorMessage = "City length cannot be more than 30")]
        [RegularExpression(@"^[a-zA-Z ]+$", ErrorMessage = "City is not valid")]
        public string City { get; set; }
    }
}