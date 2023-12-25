using EventService.Models;

namespace EventService.Data
{
    public interface IEventRepo
    {
        bool SaveChanges();

        IEnumerable<Event> GetAllEvents();

        Event GetEventById(int id);

        void CreateEvent(Event eventt);

        void UpdateEvent(Event eventt);

        void DeleteEvent(Event eventt);

        void ReserveTickets(ClientEvent clientEvent);
    }
}