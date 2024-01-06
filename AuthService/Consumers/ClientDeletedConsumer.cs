using MassTransit;
using MessageBusEvents.Models;
using Microsoft.AspNetCore.Identity;

namespace AuthService.Consumers
{
    public class ClientDeletedConsumer : IConsumer<ClientDeleted>
    {
        private readonly ILogger<ClientDeleted> _logger;
        private readonly UserManager<IdentityUser> _userManager;

        public ClientDeletedConsumer(ILogger<ClientDeleted> logger, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _userManager = userManager;
        }

        public async Task Consume(ConsumeContext<ClientDeleted> context)
        {
            var clientDeleted = context.Message;

            _logger.LogInformation($"----> Got new message {clientDeleted.Id}");

            var userModel = await _userManager.FindByIdAsync(clientDeleted.Id);

            var isDeleted = await _userManager.DeleteAsync(userModel);

            Console.WriteLine($"---------> Client {clientDeleted.Id} deleted: {isDeleted}");
        }
    }
}
