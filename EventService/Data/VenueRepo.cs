using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EventService.Models;
using Microsoft.EntityFrameworkCore;

namespace EventService.Data
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
            if (venue is null)
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
            return await _context.Venues
                .Where(v => v.Id == id)
                .Include(v => v.Events)
                .FirstOrDefaultAsync();
        }

        public async Task<Venue> GetVenueByExternalId(string id)
        {
            return await _context.Venues.FirstOrDefaultAsync(v => v.ExternalId == id);
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