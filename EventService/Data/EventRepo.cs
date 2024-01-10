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

        public async Task<IEnumerable<Event>> GetAllEvents(int pageSize, int pageNumber)
        {
            if(pageSize > 20) {
                pageSize = 20;
            }
            
            return await _context.Events
                .Include(e => e.Venue)
                .Include(e => e.Clients)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<Event> GetEventById(int id)
        {
            return await _context.Events
                .Where(e => e.Id == id)
                .Include(e => e.Venue)
                .Include(e => e.Clients)
                .FirstOrDefaultAsync();
        }

        public async Task<bool> SaveChanges()
        {
            return (await _context.SaveChangesAsync() >= 0);
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