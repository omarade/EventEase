using Microsoft.Extensions.Options;
using MongoDB.Driver;
using SearchService.Models;

namespace SearchService.Data
{
    public class EventRepo : IEventRepo
    {
        public readonly IMongoCollection<Event> _eventsCollection;

        public EventRepo(IOptions<DatabaseSettings> databaseSettings)
        {   
            var mongoClientSettings = MongoClientSettings.FromConnectionString(databaseSettings.Value.ConnectionString);
            mongoClientSettings.MaxConnectionPoolSize = 500; // Adjust this value based on your requirements

            var mongoClient = new MongoClient(mongoClientSettings);
            Console.WriteLine(databaseSettings.Value.ConnectionString);

            var mongoDatabase = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
            Console.WriteLine(databaseSettings.Value.DatabaseName);

            _eventsCollection = mongoDatabase.GetCollection<Event>(databaseSettings.Value.EventsCollectionName);
            Console.WriteLine(databaseSettings.Value.EventsCollectionName);
        }

        public async Task CreateEvent(Event newEvent)
        {
            await _eventsCollection.InsertOneAsync(newEvent);
        }

        public async Task DeleteEvent(Event deletedEvent)
        {
            await _eventsCollection.DeleteOneAsync(e => e.Id == deletedEvent.Id);
        }

        public async Task DeleteEventsByVenue(string venueId)
        {
            await _eventsCollection.DeleteManyAsync(e => e.Venue.ExternalId == venueId);
        }

        public async Task UpdateVenue(Venue venue)
        {
            var filter = Builders<Event>.Filter
                .Eq(e => e.Venue.ExternalId, venue.ExternalId);
            var update = Builders<Event>.Update
                .Set(e => e.Venue, venue);
                           
            await _eventsCollection.UpdateManyAsync(filter, update);
        }

        public async Task<IEnumerable<Event>> GetEventsByArtist(string artist, int pageSize, int pageNumber)
        {
            if(pageSize > 20) {
                pageSize = 20;
            }

            return await _eventsCollection.Find(e => e.Artist == artist)
                .SortBy(e => e.DateTime)
                .Skip((pageNumber - 1) * pageSize)
                .Limit(pageSize)
                .ToListAsync();
        }

        public async Task<IEnumerable<Event>> GetEventsByDate(DateTime date, int pageSize, int pageNumber)
        {
            if(pageSize > 20) {
                pageSize = 20;
            }

            return await _eventsCollection.Find(e => e.DateTime.Year == date.Year && e.DateTime.Month == date.Month && e.DateTime.Day == date.Day)
                .Skip((pageNumber - 1) * pageSize)
                .Limit(pageSize)
                .ToListAsync();
        }

        public async Task<IEnumerable<Event>> GetEventsByType(string type, int pageSize, int pageNumber)
        {
            if(pageSize > 20) {
                pageSize = 20;
            }

            return await _eventsCollection.Find(e => e.Type == type)
                .Skip((pageNumber - 1) * pageSize)
                .Limit(pageSize)
                .ToListAsync();
        }

        public async Task<Event> GetEventByExternalId(int id)
        {
            return await _eventsCollection.Find(e => e.ExternalId == id)
                .FirstAsync();
        }

        public async Task<IEnumerable<Event>> GetUpcomingEvents(int pageSize, int pageNumber)
        {
            if(pageSize > 20) {
                pageSize = 20;
            }

            // get current date
            var currentDateTime = DateTime.Now;

            return await _eventsCollection.Find(e => e.DateTime.Date >= currentDateTime.Date)
                .Skip((pageNumber - 1) * pageSize)
                .Limit(pageSize)
                .ToListAsync();
        }

        public async Task UpdateEvent(Event updatedEvent)
        {
            await _eventsCollection.ReplaceOneAsync(e => e.Id == updatedEvent.Id, updatedEvent);
        }
    }
}