using AutoMapper;
using EventService.Data;
using EventService.Extensions;
using EventService.Models.Dtos;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EventService.Controllers
{
    [Route("api/events/[controller]")]
    [ApiController]
    public class ClientsController: Controller
    {
        private readonly IClientRepo _clientRepo;
        private readonly IMapper _mapper;

        public ClientsController(IClientRepo clientRepo, IMapper mapper)
        {
            _clientRepo = clientRepo;
            _mapper = mapper;
        }

        /// <summary>
        /// Get client by id endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        [HttpGet("{id}", Name = "GetClientById")]
        [Authorize]
        public async Task<ActionResult<ClientReadDto>> GetClientById(int id)
        {
            Console.WriteLine("---> Getting Client with id: " + id);

            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = await _clientRepo.GetClientById(id);

            if (client is null)
            {
                return NotFound($"---> Client was not found");
            }

            if (clientId != client.ExternalId)
            {
                return Unauthorized();
            }

            return Ok(_mapper.Map<ClientReadDto>(client));
        }
    }
}