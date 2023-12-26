using AutoMapper;
using EventService.Data;
using EventService.Extensions;
using EventService.Models;
using EventService.Models.Dtos;
using MassTransit;
using MessageBusEvents;
using Microsoft.AspNetCore.Mvc;

namespace EventService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventsController : Controller
    {
        private readonly IEventRepo _eventRepo;
        private readonly IClientRepo _clientRepo;
        private readonly IMapper _mapper;
        private readonly IPublishEndpoint _publishEndpoint;

        public EventsController(IEventRepo eventRepo, IClientRepo clientRepo, IMapper mapper, IPublishEndpoint publishEndpoint)
        {
            _eventRepo = eventRepo;
            _clientRepo = clientRepo;
            _mapper = mapper;
            _publishEndpoint = publishEndpoint;
        }

        [HttpGet]
        public ActionResult<IEnumerable<EventReadDto>> GetAllEvents()
        {
            Console.WriteLine("---> Getting Events....");

            var events = _eventRepo.GetAllEvents();

            return Ok(_mapper.Map<IEnumerable<EventReadDto>>(events));
        }

        [HttpGet("{id}", Name = "GetEventById")]
        public ActionResult<EventReadDto> GetEventById(int id)
        {
            Console.WriteLine("---> Getting Event with id: " + id);

            var ev = _eventRepo.GetEventById(id);

            return Ok(_mapper.Map<EventReadDto>(ev));
        }

        [HttpPost]
        public ActionResult<EventReadDto> CreateEvent(EventCreateDto eventCreateDto)
        {
            if (ModelState.IsValid)
            {
                var newEvent = _mapper.Map<Models.Event>(eventCreateDto);

                _eventRepo.CreateEvent(newEvent);

                // Publish EventCreated
                if (_eventRepo.SaveChanges())
                {
                    var eventCreated = _mapper.Map<EventCreated>(newEvent);
                    eventCreated.VenueId = newEvent.Venue.ExternalId;

                    _publishEndpoint.Publish<EventCreated>(eventCreated);
                }

                var eventReadDto = _mapper.Map<EventReadDto>(newEvent);

                return CreatedAtRoute(nameof(GetEventById), new { Id = eventReadDto.Id }, eventReadDto);
            }

            return BadRequest("Invalid request payload");
        }

        [HttpPut("{id}")]
        public ActionResult<EventUpdateDto> UpdateEvent(int id, EventUpdateDto eventUpdateDto)
        {
            var eventModel = _eventRepo.GetEventById(id);

            if (eventModel is null)
            {
                return NotFound($"----> Event was not found");
            }

            //check if venue own the event

            //Mapping
            eventModel.Name = eventUpdateDto.Name;
            eventModel.Type = eventUpdateDto.Type;
            eventModel.Artist = eventUpdateDto.Artist;
            eventModel.Description = eventUpdateDto.Description;

            _eventRepo.UpdateEvent(eventModel);

            // Publish EventUpdated
            if (_eventRepo.SaveChanges())
            {
                var eventUpdated = _mapper.Map<EventUpdated>(eventModel);

                _publishEndpoint.Publish<EventUpdated>(eventUpdated);
            }

            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteEvent(int id)
        {

            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var eventModel = _eventRepo.GetEventById(id);

            if (eventModel is null)
            {
                return NotFound($"----> Event was not found");
            }

            _eventRepo.DeleteEvent(eventModel);

            // Publish EventDeleted
            if (_eventRepo.SaveChanges())
            {
                var eventDeleted = _mapper.Map<EventDeleted>(eventModel);

                _publishEndpoint.Publish<EventDeleted>(eventDeleted);
            }

            return Ok();
        }

        [HttpPost("{id}/reserve-ticket")]
        public ActionResult ReserveTicket(int id, ClientEventCreateDto clientEventCreateDto)
        {
            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = _clientRepo.GetClientByExternalId(clientId);

            var eventModel = _eventRepo.GetEventById(id);

            if(eventModel is null)
            {
                NotFound($"----> Event was not found");
            }

            var clientEvent = new ClientEvent() {
                TicketsNum = clientEventCreateDto.TicketsNum,
                Event = eventModel,
                Client = client
            };

            //Reserve ticket
            _eventRepo.ReserveTickets(clientEvent);

            //Decrease remaining tickets
            if(eventModel.TotalTickets != eventModel.RemainingTickets)
            {
                eventModel.RemainingTickets = eventModel.RemainingTickets - clientEventCreateDto.TicketsNum;
            }
            else
            {
                eventModel.RemainingTickets = eventModel.TotalTickets - clientEventCreateDto.TicketsNum;
            }
            
            _eventRepo.UpdateEvent(eventModel);

            // Publish EventUpdated
            if (_eventRepo.SaveChanges())
            {
                var eventUpdated = _mapper.Map<EventUpdated>(eventModel);

                _publishEndpoint.Publish<EventUpdated>(eventUpdated);
            }

            return Ok();
        }
    }
}