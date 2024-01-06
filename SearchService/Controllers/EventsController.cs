using Microsoft.AspNetCore.Mvc;
using SearchService.Data;

namespace SearchService.Controllers
{
    [ApiController]
    [Route("api/search/[controller]")]
    public class EventsController: ControllerBase
    {
        private readonly IEventRepo _eventRepo;

        public EventsController(IEventRepo eventRepo)
        {
            _eventRepo = eventRepo;
        }

        [HttpGet]
        public async Task<IActionResult> GetUpcomingEvents(int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetUpcomingEvents(pageSize, pageNumber);

            return Ok(events);
        }

        [HttpGet("artist/{artist}")]
        public async Task<IActionResult> GetEventsByArtist(string artist, int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetEventsByArtist(artist, pageSize, pageNumber);

            return Ok(events);
        }

        [HttpGet("date/{date}")]
        public async Task<IActionResult> GetEventsByDate(DateTime date, int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetEventsByDate(date, pageSize, pageNumber);
            Console.WriteLine(date);

            return Ok(events);
        }

        [HttpGet("type/{type}")]
        public async Task<IActionResult> GetEventsByType(string type, int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetEventsByType(type, pageSize, pageNumber);

            return Ok(events);
        }
    }
}