namespace MessageBusEvents.Models
{
    public class EventUpdated
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Type { get; set;}

        public string Artist { get; set; }

        public string Description { get; set; }

        public DateTime DateTime { get; set; }

        public string ImgPath { get; set; }

        public int RemainingTickets { get; set; }
    }
}