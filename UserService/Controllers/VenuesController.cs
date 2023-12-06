using AutoMapper;
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

        public VenuesController(IVenueRepo venueRepo, IMapper mapper)
        {
            _venueRepo = venueRepo;
            _mapper = mapper;
        }

        [HttpGet]
        public ActionResult<IEnumerable<VenueReadDto>> GetVenues()
        {
            Console.WriteLine("---> Getting Venues....");

            var venues = _venueRepo.GetAllVenues();

            return Ok(_mapper.Map<IEnumerable<VenueReadDto>>(venues));
        }

        [HttpGet("{id}", Name = "GetVenueById")]
        public ActionResult<VenueReadDto> GetVenueById(int id)
        {
            Console.WriteLine("---> Getting Venue with id: " + id);

            var venue = _venueRepo.GetVenueById(id);

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
        public ActionResult<ClientUpdateDto> UpdateClient(int id, VenueUpdateDto venueUpdateDto)
        {
            //Get logged in user Id from JWT.
            string venueId = this.User.GetId();

            var venue = _venueRepo.GetVenueById(id);  

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
            _venueRepo.SaveChanges();
            
            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult DeleteVenue(int id)
        {
            //Get logged in user Id from JWT.
            string venueId = this.User.GetId();

            var venue = _venueRepo.GetVenueById(id);

            if (venue is null)
            {
                return NotFound($"---> Venue was not found");
            }

            if (venueId != venue.ExternalId)
            {
                return Unauthorized();
            }

            _venueRepo.DeleteVenue(venue);
            _venueRepo.SaveChanges();
            
            return Ok();
        }
    }
}