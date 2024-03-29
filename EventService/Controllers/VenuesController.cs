using AutoMapper;
using EventService.Data;
using EventService.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace EventService.Controllers
{
    [Route("api/events/[controller]")]
    [ApiController]
    public class VenuesController: Controller
    {
        private readonly IVenueRepo _venueRepo;
        private readonly IMapper _mapper;

        public VenuesController(IVenueRepo venueRepo, IMapper mapper)
        {
            _venueRepo = venueRepo;
            _mapper = mapper;
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

            return Ok(_mapper.Map<VenueReadDto>(venue));
        }
    }
}