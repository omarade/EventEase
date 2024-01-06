using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using SearchService.Data;

namespace SearchService.Consumers
{
    public class EventCreatedConsumer : IConsumer<EventCreated>
    {
        private readonly ILogger<EventCreated> _logger;
        private readonly IEventRepo _eventRepo;
        private readonly IMapper _mapper;

        public EventCreatedConsumer(ILogger<EventCreated> logger, IEventRepo eventRepo, IMapper mapper)
        {
            _logger = logger;
            _eventRepo = eventRepo;
            _mapper = mapper;
        }

        public async Task Consume(ConsumeContext<EventCreated> context)
        {
            //Extract event
            var eventCreated = context.Message;

            _logger.LogInformation($"----> Got new message {eventCreated.Name}");

            //Create event
            var eventModel = _mapper.Map<Models.Event>(eventCreated);
            
            await _eventRepo.CreateEvent(eventModel);
        }
    }
}