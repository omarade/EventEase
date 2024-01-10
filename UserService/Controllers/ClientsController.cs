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
    public class ClientsController : ControllerBase
    {       
        private readonly IClientRepo _clientRepo;
        private readonly IMapper _mapper;      
        private readonly IPublishEndpoint _publishEndpoint;

        public ClientsController(IClientRepo clientRepo, IMapper mapper,
            IPublishEndpoint publishEndpoint)
        {
            _clientRepo = clientRepo;
            _mapper = mapper;
            _publishEndpoint = publishEndpoint;
        }

        /// <summary>
        /// Get clients endpoint for user service
        /// </summary>
        /// <param name="pageSize">page size</param>
        /// <param name="pageNumber">page number</param>
        /// <returns></returns>
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<ClientReadDto>>> GetClients(int pageSize = 20, int pageNumber = 1)
        {
            Console.WriteLine("---> Getting Clients....");

            var clients = await _clientRepo.GetAllClients(pageSize, pageNumber);

            return Ok(_mapper.Map<IEnumerable<ClientReadDto>>(clients));
        }

        /// <summary>
        /// Get client by id endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        [HttpGet("{id}", Name = "GetClientById")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<ClientReadDto>> GetClientById(int id)
        {
            Console.WriteLine("---> Getting Client with id: " + id);

            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = await _clientRepo.GetClientById(id);            

            if(client != null)
            {
                if (clientId != client.ExternalId)
                {
                    return Unauthorized();
                }

                return Ok(_mapper.Map<ClientReadDto>(client));
            }
            else 
            {
                return NotFound();
            }
        }

        /// <summary>
        /// Get client by email endpoint
        /// </summary>
        /// <param name="email">email</param>
        /// <returns></returns>
        [HttpGet("GetClientByEmail", Name = "GetClientByEmail")]
        public async Task<ActionResult<ClientReadDto>> GetClientByEmail(string email)
        {
            Console.WriteLine("---> Getting Client with email: " + email);
            
            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = await _clientRepo.GetClientByEmail(email);

            if (clientId != client.ExternalId)
            {
                return Unauthorized();
            }

            if(client != null)
            {
                return Ok(_mapper.Map<ClientReadDto>(client));
            }
            else 
            {
                return NotFound();
            }
        }

        /// <summary>
        /// Update client endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <param name="clientUpdateDto">name</param>
        /// <returns></returns>
        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<ClientUpdateDto>> UpdateClient(int id, ClientUpdateDto clientUpdateDto)
        {
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

            // var clientModel = _mapper.Map<Client>(clientUpdateDto);
            client.Name = clientUpdateDto.Name;
            
            _clientRepo.UpdateClient(client);
            if(await _clientRepo.SaveChanges())
            {
                Console.WriteLine("----> Sending message ClientUpdated");
                var clientUpdated = _mapper.Map<ClientUpdated>(client);

                await _publishEndpoint.Publish<ClientUpdated>(clientUpdated);
            }

            return NoContent();
        }

        /// <summary>
        /// Delete client endpoint
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult> DeleteClient(int id)
        {
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

            var clientDeleted = _mapper.Map<ClientDeleted>(client);

            _clientRepo.DeleteClient(client);
            if(await _clientRepo.SaveChanges())
            {
                //Publish clientDeleted Event
                await _publishEndpoint.Publish<ClientDeleted>(clientDeleted);
            }
            
            return Ok();
        }
    }
}