using UserService.Models;

namespace UserService.Data
{
    public interface IVenueRepo
    {
        bool SaveChanges();

        IEnumerable<Venue> GetAllVenues();

        Venue GetVenueById(int id);

        void CreateVenue(Venue venue);

        void UpdateVenue(Venue venue);

        void DeleteVenue(Venue venue);

    }
}