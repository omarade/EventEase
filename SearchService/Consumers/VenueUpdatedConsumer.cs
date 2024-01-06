using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using SearchService.Data;
using SearchService.Models;

namespace SearchService.Consumers
{
    public class VenueUpdatedConsumer : IConsumer<VenueUpdated>
    {
        private readonly ILogger<VenueUpdated> _logger;

        private readonly IEventRepo _eventRepo;

        private readonly IMapper _mapper;

        public VenueUpdatedConsumer(ILogger<VenueUpdated> logger, IEventRepo eventRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _eventRepo = eventRepo;
        }

        public async Task Consume(ConsumeContext<VenueUpdated> context)
        {
            // extract venue
            var venueUpdated = context.Message;

            _logger.LogInformation($"----> Got new message VenueUpdated: {venueUpdated.Id}");
            
            var venueModel = _mapper.Map<Venue>(venueUpdated);
            // update venue
            await _eventRepo.UpdateVenue(venueModel);
        }     
    }
}