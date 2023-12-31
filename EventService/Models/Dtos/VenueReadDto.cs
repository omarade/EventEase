namespace EventService.Models.Dtos
{
    public class VenueReadDto
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public string PhoneNumber { get; set; }
     
        public string Address { get; set; }
              
        public string City { get; set; }
        
        public ICollection<Event> Events { get; set; }
    }
}