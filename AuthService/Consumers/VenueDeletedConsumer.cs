using MassTransit;
using MessageBusEvents;
using Microsoft.AspNetCore.Identity;


namespace AuthService.Consumers
{
    public class VenueDeletedConsumer : IConsumer<VenueDeleted>
    {
        private readonly ILogger<VenueDeleted> _logger;
        private readonly UserManager<IdentityUser> _userManager;

        public VenueDeletedConsumer(ILogger<VenueDeleted> logger, UserManager<IdentityUser> userManager)
        {
            _logger = logger;
            _userManager = userManager;
        }

        public async Task Consume(ConsumeContext<VenueDeleted> context)
        {
            var venueDeleted = context.Message;

            _logger.LogInformation($"----> Got new message {venueDeleted.Id}");

            var userModel = await _userManager.FindByIdAsync(venueDeleted.Id);

            var isDeleted = await _userManager.DeleteAsync(userModel);

            Console.WriteLine($"---------> Venue {venueDeleted.Id} deleted: {isDeleted}");
        }
    }
}