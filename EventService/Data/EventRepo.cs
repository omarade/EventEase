using EventService.Models;
using Microsoft.EntityFrameworkCore;

namespace EventService.Data
{
    public class EventRepo : IEventRepo
    {
        private readonly AppDbContext _context;

        public EventRepo(AppDbContext context)
        {
            _context = context;
        }

        public void CreateEvent(Event createdEvent)
        {
            if(createdEvent is null)
            {
                throw new ArgumentNullException(nameof(createdEvent));
            }

            _context.Events.Add(createdEvent);
        }

        public IEnumerable<Event> GetAllEvents()
        {
            return _context.Events
                .Include(e => e.Venue)
                .Include(e => e.Clients)
                .ToList();
        }

        public Event GetEventById(int id)
        {
            // return _context.Events.FirstOrDefault(e => e.Id == id);
            return _context.Events
                .Where(e => e.Id == id)
                .Include(e => e.Venue)
                .Include(e => e.Clients)
                .FirstOrDefault();
        }

        public bool SaveChanges()
        {
            return (_context.SaveChanges() >= 0);
        }

        public void UpdateEvent(Event updatedEvent)
        {
            _context.Events.Update(updatedEvent);
        }
       
        public void DeleteEvent(Event deletedEvent)
        {
            _context.Events.Remove(deletedEvent);
        }

        public void ReserveTickets(ClientEvent clientEvent)
        {
            _context.ClientEvents.Add(clientEvent);
        }
    }
}