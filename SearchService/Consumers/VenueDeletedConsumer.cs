using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using SearchService.Data;

namespace SearchService.Consumers
{
    public class VenueDeletedConsumer : IConsumer<VenueDeleted>
    {
        private readonly ILogger<VenueDeleted> _logger;

        private readonly IEventRepo _eventRepo;

        private readonly IMapper _mapper;

        public VenueDeletedConsumer(ILogger<VenueDeleted> logger, IEventRepo eventRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _eventRepo = eventRepo;
        }

        public async Task Consume(ConsumeContext<VenueDeleted> context)
        {
            // extract venue
            var venueDeleted = context.Message;

            _logger.LogInformation($"----> Got new message VenueDeleted: {venueDeleted.Id}");

            // delete venue
            await _eventRepo.DeleteEventsByVenue(venueDeleted.Id);
        }  
    }
}