namespace EventService.Models.Dtos
{
    public class EventReadDto
    {
    
        public int Id { get; set; }

        public string Name { get; set; }

        public string Type { get; set;}

        public string Artist { get; set; }

        public string Description { get; set; }

        public DateTime Time { get; set; }

        public string ImgPath { get; set; }

        public int TotalTickets { get; set; }

        public int RemainingTickets { get; set; }

        public Venue Venue { get; set; }

        public ICollection<Client> Clients { get; set; }
    }
}