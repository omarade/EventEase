using EventService.Models;

namespace EventService.Data
{
    public interface IVenueRepo
    {
        Task<bool> SaveChanges();

        Task<IEnumerable<Venue>> GetAllVenues();

        Task<Venue> GetVenueById(int id);

        Task<Venue> GetVenueByExternalId(string id);

        void CreateVenue(Venue venue);

        void UpdateVenue(Venue venue);

        void DeleteVenue(Venue venue);
    }
}