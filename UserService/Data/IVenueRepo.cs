using UserService.Models;

namespace UserService.Data
{
    public interface IVenueRepo
    {
        Task<bool> SaveChanges();

        Task<IEnumerable<Venue>> GetAllVenues(int pageSize, int pageNumber);

        Task<Venue> GetVenueById(int id);

        void CreateVenue(Venue venue);

        void UpdateVenue(Venue venue);

        void DeleteVenue(Venue venue);

    }
}