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
    [Route("api/users/[controller]")]
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

        /// <summary>
        /// Get venues endpoint
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <returns></returns>
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<VenueReadDto>>> GetVenues(int pageSize = 20, int pageNumber = 1)
        {
            Console.WriteLine("---> Getting Venues....");

            var venues = await _venueRepo.GetAllVenues(pageSize, pageNumber);

            return Ok(_mapper.Map<IEnumerable<VenueReadDto>>(venues));
        }

        /// <summary>
        /// Get venue by id endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
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

        /// <summary>
        /// update venue endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <param name="venueUpdateDto">name, phonenumber, address, city</param>
        /// <returns></returns>
        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<ClientUpdateDto>> UpdateVenue(int id, VenueUpdateDto venueUpdateDto)
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

        /// <summary>
        /// Delete venue endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
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