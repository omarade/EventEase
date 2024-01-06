using SearchService.Models;

namespace SearchService.Data
{
    public interface IEventRepo
    {
        Task<Event> GetEventByExternalId(int id);
        
        Task<IEnumerable<Event>> GetUpcomingEvents(int pageSize, int pageNumber);

        Task<IEnumerable<Event>> GetEventsByDate(DateTime date, int pageSize, int pageNumber);

        Task<IEnumerable<Event>> GetEventsByType(string type, int pageSize, int pageNumber);

        Task<IEnumerable<Event>> GetEventsByArtist(string artist, int pageSize, int pageNumber);

        Task CreateEvent(Event newEvent);

        Task UpdateEvent(Event updatedEvent);

        Task DeleteEvent(Event deletedEvent);

        Task DeleteEventsByVenue(string venueId);

        Task UpdateVenue(Venue venue);
    }
}