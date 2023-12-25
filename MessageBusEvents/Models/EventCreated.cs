namespace MessageBusEvents.Models
{
    public class EventCreated
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Type { get; set;}

        public string Artist { get; set; }

        public string Description { get; set; }

        public DateTime DateTime { get; set; }

        public string ImgPath { get; set; }

        public int TotalTickets { get; set; }

        public string VenueId { get; set; }
    }
}