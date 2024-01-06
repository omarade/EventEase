using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using UserService.Data;
using UserService.Extensions;
using UserService.Models.Dtos;

namespace UserService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VenuesController : ControllerBase
    {
        private readonly IVenueRepo _venueRepo;
        private readonly IMapper _mapper;
        private readonly IPublishEndpoint _publishEndpoint;

        public VenuesController(IVenueRepo venueRepo, IMapper mapper, IPublishEndpoint publishEndpoint)
        {
            _venueRepo = venueRepo;
            _mapper = mapper;
            _publishEndpoint = publishEndpoint;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<VenueReadDto>>> GetVenues()
        {
            Console.WriteLine("---> Getting Venues....");

            var venues = await _venueRepo.GetAllVenues();

            return Ok(_mapper.Map<IEnumerable<VenueReadDto>>(venues));
        }

        [HttpGet("{id}", Name = "GetVenueById")]
        public async Task<ActionResult<VenueReadDto>> GetVenueById(int id)
        {
            Console.WriteLine("---> Getting Venue with id: " + id);

            var venue = await _venueRepo.GetVenueById(id);

            if(venue != null)
            {
                return Ok(_mapper.Map<VenueReadDto>(venue));
            }
            else 
            {
                return NotFound();
            }
        }

        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<ClientUpdateDto>> UpdateClient(int id, VenueUpdateDto venueUpdateDto)
        {
            //Get logged in user Id from JWT.
            string venueId = this.User.GetId();

            var venue = await _venueRepo.GetVenueById(id);  

            if (venueId != venue.ExternalId)
            {
                return Unauthorized();
            }

            //Mapping
            venue.Name = venueUpdateDto.Name;
            venue.PhoneNumber = venueUpdateDto.PhoneNumber;
            venue.Address = venueUpdateDto.Address;
            venue.City = venueUpdateDto.City;
           
            _venueRepo.UpdateVenue(venue);
            if (await _venueRepo.SaveChanges())
            {
                Console.WriteLine("----> Sending message VenueUpdated");
                var venueUpdated = _mapper.Map<VenueUpdated>(venue);

                await _publishEndpoint.Publish<VenueUpdated>(venueUpdated);
            }

            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult> DeleteVenue(int id)
        {
            //Get logged in user Id from JWT.
            string venueId = this.User.GetId();

            var venue = await _venueRepo.GetVenueById(id);

            if (venue is null)
            {
                return NotFound($"---> Venue was not found");
            }

            if (venueId != venue.ExternalId)
            {
                return Unauthorized();
            }

            var userDeleted = _mapper.Map<VenueDeleted>(venue);

            _venueRepo.DeleteVenue(venue);
            if(await _venueRepo.SaveChanges()) {
                //Publish VenueDeleted Event
                Console.WriteLine("----> Sending message VenueDeleted");

                await _publishEndpoint.Publish<VenueDeleted>(userDeleted);
            }
            
            return Ok();
        }
    }
}