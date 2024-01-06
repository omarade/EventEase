using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace SearchService.Models
{
    public class Venue
    {
        public string ExternalId { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }
                   
        public string City { get; set; }
    }
}