using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using UserService.Data;
using UserService.Models;

namespace UserService.Consumers
{
    public class ClientCreatedConsumer: IConsumer<ClientCreated>
    {
        private readonly ILogger<ClientCreated> _logger;

        private readonly IClientRepo _clientRepo;

        private readonly IMapper _mapper;

        public ClientCreatedConsumer(ILogger<ClientCreated> logger, IClientRepo clientRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _clientRepo = clientRepo;
        }

        public async Task Consume(ConsumeContext<ClientCreated> context)
        {
            // extract client
            var clientCreated = context.Message;

            _logger.LogInformation($"----> Got new message {clientCreated.Name}");         

            // create client
            var clientModel = _mapper.Map<Client>(clientCreated);

            _clientRepo.CreateClient(clientModel);

            _clientRepo.SaveChanges();
        }
    }
}