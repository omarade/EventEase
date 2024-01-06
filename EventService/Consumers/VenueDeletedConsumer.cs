using AutoMapper;
using EventService.Data;
using MassTransit;
using MessageBusEvents.Models;

namespace EventService.Consumers
{
    public class VenueDeletedConsumer : IConsumer<VenueDeleted>
    {
        private readonly ILogger<VenueDeleted> _logger;

        private readonly IVenueRepo _venueRepo;

        private readonly IMapper _mapper;

        public VenueDeletedConsumer(ILogger<VenueDeleted> logger, IVenueRepo venueRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _venueRepo = venueRepo;
        }

        public async Task Consume(ConsumeContext<VenueDeleted> context)
        {
            // extract venue
            var venueDeleted = context.Message;

            _logger.LogInformation($"----> Got new message {venueDeleted.Id}");

            // delete venue
            var venueModel = await _venueRepo.GetVenueByExternalId(venueDeleted.Id);

            _venueRepo.DeleteVenue(venueModel);

            await _venueRepo.SaveChanges();
        }
    }
}
