using AutoMapper;
using EventService.Data;
using EventService.Models;
using MassTransit;
using MessageBusEvents;

namespace EventService.Consumers
{
    public class VenueCreatedConsumer: IConsumer<VenueCreated>
    {
        private readonly ILogger<VenueCreated> _logger;

        private readonly IVenueRepo _venueRepo;

        private readonly IMapper _mapper;

        public VenueCreatedConsumer(ILogger<VenueCreated> logger, IVenueRepo venueRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _venueRepo = venueRepo;
        }

        public async Task Consume(ConsumeContext<VenueCreated> context)
        {
            // extract venue
            var venueCreated = context.Message;

            _logger.LogInformation($"----> Got new message {venueCreated.Name}");         

            // create venue
            var venueModel = _mapper.Map<Venue>(venueCreated);

            _venueRepo.CreateVenue(venueModel);

            _venueRepo.SaveChanges();
        }
    }
}