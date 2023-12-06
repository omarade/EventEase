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
    public class ClientsController : ControllerBase
    {
        
        private readonly IClientRepo _clientRepo;

        
        private readonly IMapper _mapper;

        public ClientsController(IClientRepo clientRepo, IMapper mapper)
        {
            _clientRepo = clientRepo;
            _mapper = mapper;
        }


        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public ActionResult<IEnumerable<ClientReadDto>> GetClients()
        {
            Console.WriteLine("---> Getting Clients....");

            var clients = _clientRepo.GetAllClients();

            return Ok(_mapper.Map<IEnumerable<ClientReadDto>>(clients));
        }
        
        [HttpGet("{id}", Name = "GetClientById")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<ClientReadDto> GetClientById(int id)
        {
            Console.WriteLine("---> Getting Client with id: " + id);

            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = _clientRepo.GetClientById(id);

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

        [HttpGet("GetClientByEmail", Name = "GetClientByEmail")]
        public ActionResult<ClientReadDto> GetClientByEmail(string email)
        {
            Console.WriteLine("---> Getting Client with email: " + email);
            
            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = _clientRepo.GetClientByEmail(email);

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

       [HttpPut("{id}")]
       [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
       public ActionResult<ClientUpdateDto> UpdateClient(int id, ClientUpdateDto clientUpdateDto)
       {
            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = _clientRepo.GetClientById(id);

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
            _clientRepo.SaveChanges();
            
            return NoContent();
       }

       [HttpDelete("{id}")]
       [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
       public ActionResult DeleteClient(int id)
       {
            //Get logged in user Id from JWT.
            string clientId = this.User.GetId();

            var client = _clientRepo.GetClientById(id);

            if (client is null)
            {
                return NotFound($"---> Client was not found");
            }

            if (clientId != client.ExternalId)
            {
                return Unauthorized();
            }

            _clientRepo.DeleteClient(client);
            _clientRepo.SaveChanges();
            
            return Ok();
       }
    }
}