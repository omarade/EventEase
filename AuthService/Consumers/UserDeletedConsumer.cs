using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using Microsoft.AspNetCore.Identity;


namespace AuthService.Consumers
{
    public class UserDeletedConsumer : IConsumer<UserDeleted>
    {
        private readonly ILogger<UserDeleted> _logger;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IMapper _mapper;

        public UserDeletedConsumer(ILogger<UserDeleted> logger, UserManager<IdentityUser> userManager, IMapper mapper)
        {
            _logger = logger;
            _userManager = userManager;
            _mapper = mapper;
        }

        public async Task Consume(ConsumeContext<UserDeleted> context)
        {
            var userDeleted = context.Message;

            _logger.LogInformation($"----> Got new message {userDeleted.Id}");

            var userModel = await _userManager.FindByIdAsync(userDeleted.Id);
            // var userModel = _mapper.Map<IdentityUser>(userDeleted);

            var isDeleted = await _userManager.DeleteAsync(userModel);

            Console.WriteLine($"---------> User {userDeleted.Id} deleted: {isDeleted}");
        }
    }
}