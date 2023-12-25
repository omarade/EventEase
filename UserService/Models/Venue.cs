namespace UserService.Models
{
    public class Venue : UserBase
    {
        public string PhoneNumber { get; set; }

        public string Address { get; set; }
        
        public string City { get; set; }
    }
}