using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using SearchService.Data;

namespace SearchService.Consumers
{
    public class EventUpdatedConsumer : IConsumer<EventUpdated>
    {
        private readonly ILogger<EventUpdated> _logger;
        private readonly IEventRepo _eventRepo;
        private readonly IMapper _mapper;

        public EventUpdatedConsumer(ILogger<EventUpdated> logger, IEventRepo eventRepo, IMapper mapper)
        {
            _logger = logger;
            _eventRepo = eventRepo;
            _mapper = mapper; 
        }
        
        public async Task Consume(ConsumeContext<EventUpdated> context)
        {
            //Extract event
            var eventUpdated = context.Message;

            _logger.LogInformation($"----> Got new message EventUpdated: {eventUpdated.Id}");

            //Find event
            var eventModel =  await _eventRepo.GetEventByExternalId(eventUpdated.Id);
            //var eventModel = _mapper.Map<Models.Event>(eventUpdated);

            eventModel.Name = eventUpdated.Name;
            eventModel.Type = eventUpdated.Type;
            eventModel.Artist = eventUpdated.Artist;
            eventModel.Description = eventUpdated.Description;
            eventModel.DateTime = eventUpdated.DateTime;
            eventModel.ImgPath = eventUpdated.ImgPath;
            eventModel.RemainingTickets = eventUpdated.RemainingTickets;

            //Update event
            await _eventRepo.UpdateEvent(eventModel);
        }
    
        
    }
}