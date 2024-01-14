using Microsoft.AspNetCore.Mvc;
using SearchService.Data;
using Prometheus;

namespace SearchService.Controllers
{
    [ApiController]
    [Route("api/search/[controller]")]
    public class EventsController: ControllerBase
    {
        private readonly IEventRepo _eventRepo;
        private readonly Counter _counter;

        public EventsController(IEventRepo eventRepo)
        {
            _eventRepo = eventRepo;
            _counter = Metrics.CreateCounter("search_counter", "Search service counter");
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

            // Increment the counter
            _counter.Inc();

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
            
            // Increment the counter
            _counter.Inc();

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
            
            // Increment the counter
            _counter.Inc();

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

            // Increment the counter
            _counter.Inc();

            return Ok(events);
        }
    }
}