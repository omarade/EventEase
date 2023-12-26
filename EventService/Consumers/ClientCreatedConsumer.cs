using AutoMapper;
using EventService.Data;
using EventService.Models;
using MassTransit;
using MessageBusEvents;

namespace EventService.Consumers
{
    public class ClientCreatedConsumer : IConsumer<ClientCreated>
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
