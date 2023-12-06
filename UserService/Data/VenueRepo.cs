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


        public IEnumerable<Venue> GetAllVenues()
        {
            return _context.Venues.ToList();
        }

        public Venue GetVenueById(int id)
        {
            return _context.Venues.FirstOrDefault(v => v.Id == id);
        }

        public bool SaveChanges()
        {
            return (_context.SaveChanges() >= 0);
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