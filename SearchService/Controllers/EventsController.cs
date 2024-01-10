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

        /// <summary>
        /// Get upcoming events endpoint for search service
        /// </summary>
        /// <param name="pageSize">page size</param>
        /// <param name="pageNumber">page number</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> GetUpcomingEvents(int pageSize = 20, int pageNumber = 1)
        {
            var events = await _eventRepo.GetUpcomingEvents(pageSize, pageNumber);

            return Ok(events);
        }

        /// <summary>
        /// Get events by artist endpoint for search service
        /// </summary>
        /// <param name="artist">artist</param>
        /// <param name="pageSize">page size</param>
        /// <param name="pageNumber">page number</param>
        /// <returns></returns>
        [HttpGet("artist/{artist}")]
        public async Task<IActionResult> GetEventsByArtist(string artist, int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetEventsByArtist(artist, pageSize, pageNumber);

            return Ok(events);
        }

        /// <summary>
        /// Get events by date endpoint for search service
        /// </summary>
        /// <param name="date">date</param>
        /// <param name="pageSize">page size</param>
        /// <param name="pageNumber">page number</param>
        /// <returns></returns>
        [HttpGet("date/{date}")]
        public async Task<IActionResult> GetEventsByDate(DateTime date, int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetEventsByDate(date, pageSize, pageNumber);

            return Ok(events);
        }

        /// <summary>
        /// Get evetns by type endpoint for search service
        /// </summary>
        /// <param name="type">type</param>
        /// <param name="pageSize">page size</param>
        /// <param name="pageNumber">page number</param>
        /// <returns></returns>
        [HttpGet("type/{type}")]
        public async Task<IActionResult> GetEventsByType(string type, int pageSize, int pageNumber)
        {
            var events = await _eventRepo.GetEventsByType(type, pageSize, pageNumber);

            return Ok(events);
        }
    }
}