using AutoMapper;
using EventService.Data;
using EventService.Models;
using MassTransit;
using MessageBusEvents.Models;

namespace EventService.Consumers
{
    public class ClientUpdatedConsumer : IConsumer<ClientUpdated>
    {
        private readonly ILogger<ClientUpdated> _logger;

        private readonly IClientRepo _clientRepo;

        private readonly IMapper _mapper;

        public ClientUpdatedConsumer(ILogger<ClientUpdated> logger, IClientRepo clientRepo, IMapper mapper)
        {
            _logger = logger;
            _mapper = mapper;
            _clientRepo = clientRepo;
        }

        public async Task Consume(ConsumeContext<ClientUpdated> context)
        {
            // extract client
            var clientUpdated = context.Message;

            _logger.LogInformation($"----> Got new message {clientUpdated.Name}");

            // update client
            var clientModel = _clientRepo.GetClientByExternalId(clientUpdated.Id);

            clientModel.Name = clientUpdated.Name;

            _clientRepo.UpdateClient(clientModel);

            _clientRepo.SaveChanges();
        }
    }
}
