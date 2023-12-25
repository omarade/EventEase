using AutoMapper;
using EventService.Data;
using EventService.Models.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace EventService.Controllers
{
    [Route("api/[controller]")]
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

        [HttpGet("{id}", Name = "GetClientById")]
        public ActionResult<ClientReadDto> GetClientById(int id)
        {
            Console.WriteLine("---> Getting Client with id: " + id);

            var client = _clientRepo.GetClientById(id);

            return Ok(_mapper.Map<ClientReadDto>(client));
        }
    }
}