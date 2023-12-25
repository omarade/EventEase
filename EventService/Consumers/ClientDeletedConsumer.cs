using AutoMapper;
using EventService.Data;
using EventService.Models;
using MassTransit;
using MessageBusEvents.Models;

namespace EventService.Consumers
{
    public class ClientDeletedConsumer : IConsumer<ClientDeleted>
    {
        private readonly ILogger<ClientDeleted> _logger;

        private readonly IClientRepo _clientRepo;

        private readonly IMapper _mapper;

        public ClientDeletedConsumer(ILogger<ClientDeleted> logger, IClientRepo clientRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _clientRepo = clientRepo;
        }

        public async Task Consume(ConsumeContext<ClientDeleted> context)
        {
            // extract client
            var clientDeleted = context.Message;

            _logger.LogInformation($"----> Got new message {clientDeleted.Id}");

            // delete client
            var clientModel = _clientRepo.GetClientByExternalId(clientDeleted.Id);

            _clientRepo.DeleteClient(clientModel);

            _clientRepo.SaveChanges();
        }
    }
}
