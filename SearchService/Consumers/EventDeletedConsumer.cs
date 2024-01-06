using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using SearchService.Data;

namespace SearchService.Consumers
{
    public class EventDeletedConsumer : IConsumer<EventDeleted>
    {
        private readonly ILogger<EventDeleted> _logger;
        private readonly IEventRepo _eventRepo;
        private readonly IMapper _mapper;

        public EventDeletedConsumer(ILogger<EventDeleted> logger, IEventRepo eventRepo, IMapper mapper)
        {
            _logger = logger;
            _eventRepo = eventRepo;
            _mapper = mapper; 
        }
        
        public async Task Consume(ConsumeContext<EventDeleted> context)
        {
            //Extract event
            var eventDeleted = context.Message;

            _logger.LogInformation($"----> Got new message EventDeleted: {eventDeleted.Id}");

            //Find event
            var eventModel =  await _eventRepo.GetEventByExternalId(eventDeleted.Id);
            //Delete event
            await _eventRepo.DeleteEvent(eventModel);
        }
    }
}