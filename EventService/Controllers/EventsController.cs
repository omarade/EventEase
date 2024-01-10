using AutoMapper;
using EventService.Data;
using EventService.Extensions;
using EventService.Models;
using EventService.Models.Dtos;
using MassTransit;
using MessageBusEvents.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EventService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventsController : Controller
    {
        private readonly IEventRepo _eventRepo;
        private readonly IClientRepo _clientRepo;
        private readonly IVenueRepo _venueRepo;
        private readonly IMapper _mapper;
        private readonly IPublishEndpoint _publishEndpoint;

        public EventsController(IEventRepo eventRepo, IVenueRepo venueRepo, IClientRepo clientRepo, IMapper mapper, IPublishEndpoint publishEndpoint)
        {
            _eventRepo = eventRepo;
            _clientRepo = clientRepo;
            _venueRepo = venueRepo;
            _mapper = mapper;
            _publishEndpoint = publishEndpoint;
        }

        /// <summary>
        /// Get all events endpoint for event service
        /// </summary>
        /// <param name="pageSize">page size</param>
        /// <param name="pageNumber">page number</param>
        /// <returns></returns>
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<EventReadDto>>> GetAllEvents(int pageSize = 20, int pageNumber = 1)
        {
            Console.WriteLine("---> Getting Events....");

            var events = await _eventRepo.GetAllEvents(pageSize, pageNumber);

            return Ok(_mapper.Map<IEnumerable<EventReadDto>>(events));
        }
        
        /// <summary>
        /// Get event by id endpoint for event service
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        [HttpGet("{id}", Name = "GetEventById")]
        public async Task<ActionResult<EventReadDto>> GetEventById(int id)
        {
            Console.WriteLine("---> Getting Event with id: " + id);

            var ev = await _eventRepo.GetEventById(id);

            if (ev is null)
            {
                return NotFound("----> Event was not found");
            }

            return Ok(_mapper.Map<EventReadDto>(ev));
        }

        /// <summary>
        /// Create event for search service
        /// </summary>
        /// <param name="eventCreateDto">name</param>
        /// <returns></returns>
        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Venue")]
        public async Task<ActionResult<EventReadDto>> CreateEvent(EventCreateDto eventCreateDto)
        {
            if (ModelState.IsValid)
            {
                //Get logged in user Id from JWT.
                string venueId = this.User.GetId();

                var venue = await _venueRepo.GetVenueById(eventCreateDto.VenueId);

                if(venue is null)
                {
                    return NotFound($"---> Venue was not found");
                }

                //validate logged in venue
                if (venueId != venue.ExternalId)
                {
                    return Unauthorized();
                }

                var newEvent = _mapper.Map<Models.Event>(eventCreateDto);

                _eventRepo.CreateEvent(newEvent);

                // Publish EventCreated
                if (await _eventRepo.SaveChanges())
                {
                    var eventCreated = _mapper.Map<EventCreated>(newEvent);
                    var eventVenue = _mapper.Map<MessageBusEvents.Models.Dto.Venue>(newEvent.Venue);

                    eventCreated.Venue = eventVenue;

                    await _publishEndpoint.Publish<EventCreated>(eventCreated);
                }

                var eventReadDto = _mapper.Map<EventReadDto>(newEvent);

                return CreatedAtRoute(nameof(GetEventById), new { Id = eventReadDto.Id }, eventReadDto);
            }

            return BadRequest("Invalid request payload");
        }

        /// <summary>
        /// Update event for search service
        /// </summary>
        /// <param name="id">id</param>
        /// <param name="eventUpdateDto">name, type, artist</param>
        /// <returns></returns>
        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Venue")]
        public async Task<ActionResult<EventUpdateDto>> UpdateEvent(int id, EventUpdateDto eventUpdateDto)
        {
            //Get logged in user Id from JWT.
            string venueId = this.User.GetId();

            var eventModel = await _eventRepo.GetEventById(id);

            if (eventModel is null)
            {
                return NotFound($"----> Event was not found");
            }

            //check if venue owns the event
            if (venueId != eventModel.Venue.ExternalId)
            {
                return Unauthorized();
            }

            //Mapping
            eventModel.Name = eventUpdateDto.Name;
            eventModel.Type = eventUpdateDto.Type;
            eventModel.Artist = eventUpdateDto.Artist;
            eventModel.Description = eventUpdateDto.Description;

            _eventRepo.UpdateEvent(eventModel);

            // Publish EventUpdated
            if (await _eventRepo.SaveChanges())
            {
                var eventUpdated = _mapper.Map<EventUpdated>(eventModel);

                await _publishEndpoint.Publish<EventUpdated>(eventUpdated);
            }

            return NoContent();
        }

        /// <summary>
        /// Delete event for search service
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Venue")]
        public async Task<ActionResult> DeleteEvent(int id)
        {
            //Get logged in user Id from JWT.
            string venueId = this.User.GetId();

            var eventModel = await _eventRepo.GetEventById(id);

            if (eventModel is null)
            {
                return NotFound($"----> Event was not found");
            }

            //check if venue owns the event
            if (venueId != eventModel.Venue.ExternalId)
            {
                return Unauthorized();
            }

            _eventRepo.DeleteEvent(eventModel);

            // Publish EventDeleted
            if (await _eventRepo.SaveChanges())
            {
                var eventDeleted = _mapper.Map<EventDeleted>(eventModel);

                await _publishEndpoint.Publish<EventDeleted>(eventDeleted);
            }

            return Ok();
        }
        
        /// <summary>
        /// reserve ticket for an event endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <param name="clientEventCreateDto">ticketsNum</param>
        /// <returns></returns>
        [HttpPost("{id}/reserve-ticket")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Client")]
        public async Task<ActionResult> ReserveTicket(int id, ClientEventCreateDto clientEventCreateDto)
        {
            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = await _clientRepo.GetClientByExternalId(clientId);

            if(clientId != client.ExternalId) {
                return Unauthorized();
            }

            var eventModel = await _eventRepo.GetEventById(id);

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
            if (await _eventRepo.SaveChanges())
            {
                var eventUpdated = _mapper.Map<EventUpdated>(eventModel);

                await _publishEndpoint.Publish<EventUpdated>(eventUpdated);
            }

            return Ok();
        }
    }
}