using AutoMapper;
using EventService.Data;
using EventService.Models;
using MassTransit;
using MessageBusEvents;

namespace EventService.Consumers
{
    public class VenueUpdatedConsumer: IConsumer<VenueUpdated>
    {
        private readonly ILogger<VenueUpdated> _logger;

        private readonly IVenueRepo _venueRepo;

        private readonly IMapper _mapper;

        public VenueUpdatedConsumer(ILogger<VenueUpdated> logger, IVenueRepo venueRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _venueRepo = venueRepo;
        }

        public async Task Consume(ConsumeContext<VenueUpdated> context)
        {
            // extract venue
            var venueUpdated = context.Message;

            _logger.LogInformation($"----> Got new message {venueUpdated.Name}");

            // update venue
            var venueModel = _venueRepo.GetVenueByExternalId(venueUpdated.Id);

            venueModel.Name = venueUpdated.Name;

            _venueRepo.UpdateVenue(venueModel);

            _venueRepo.SaveChanges();
        }
    }
}
