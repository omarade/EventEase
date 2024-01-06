using Microsoft.EntityFrameworkCore;
using UserService.Models;

namespace UserService.Data
{
    public class VenueRepo : IVenueRepo
    {
        private readonly AppDbContext _context;

        public VenueRepo(AppDbContext context)
        {
            _context = context;
        }

        public void CreateVenue(Venue venue)
        {
            if(venue is null)
            {
                throw new ArgumentNullException(nameof(venue));
            }
            _context.Venues.Add(venue);
        }


        public async Task<IEnumerable<Venue>> GetAllVenues()
        {
            return await _context.Venues.ToListAsync();
        }

        public async Task<Venue> GetVenueById(int id)
        {
            return await _context.Venues.FirstOrDefaultAsync(v => v.Id == id);
        }

        public async Task<bool> SaveChanges()
        {
            return (await _context.SaveChangesAsync() >= 0);
        }

        public void UpdateVenue(Venue venue)
        {
            _context.Venues.Update(venue);
        }

        public void DeleteVenue(Venue venue)
        {
            _context.Venues.Remove(venue);
        }
    }
}