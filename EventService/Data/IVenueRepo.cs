using EventService.Models;

namespace EventService.Data
{
    public interface IVenueRepo
    {
        bool SaveChanges();

        IEnumerable<Venue> GetAllVenues();

        Venue GetVenueById(int id);

        Venue GetVenueByExternalId(string id);

        void CreateVenue(Venue venue);

        void UpdateVenue(Venue venue);

        void DeleteVenue(Venue venue);
    }
}