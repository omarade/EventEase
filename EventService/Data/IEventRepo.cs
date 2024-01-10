using EventService.Models;

namespace EventService.Data
{
    public interface IEventRepo
    {
        Task<bool> SaveChanges();

        Task<IEnumerable<Event>> GetAllEvents(int pageSize, int pageNumber);

        Task<Event> GetEventById(int id);

        void CreateEvent(Event eventt);

        void UpdateEvent(Event eventt);

        void DeleteEvent(Event eventt);

        void ReserveTickets(ClientEvent clientEvent);
    }
}