using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace SearchService.Models
{
    public class Event
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        public int ExternalId { get; set; }

        public string Name { get; set; }

        public string Type { get; set;}

        public string Artist { get; set; }
   
        public string Description { get; set; }

        public DateTime DateTime { get; set; }

        public string ImgPath { get; set; }

        public int TotalTickets { get; set; }

        public int RemainingTickets { get; set; }

        public Venue Venue { get; set; }
    }
}