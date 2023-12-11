using AutoMapper;
using MassTransit;
using MessageBusEvents.Models;
using UserService.Data;
using UserService.Models;

namespace UserService.Consumers
{
    public class UserCreatedConsumer: IConsumer<UserCreated>
    {
        private readonly ILogger<UserCreated> _logger;
        private readonly AppDbContext _context;
        private readonly IMapper _mapper;

        public UserCreatedConsumer(ILogger<UserCreated> logger, AppDbContext context, IMapper mapper)
        {
            _logger = logger;
            _context = context;
            _mapper = mapper;
        }

        public async Task Consume(ConsumeContext<UserCreated> context)
        {
            // extract user
            var userCreated = context.Message;

            _logger.LogInformation($"----> Got new message {userCreated.Name}");         

            // create venue or client
            if(userCreated.Role == "Venue") {
                var venueModel = _mapper.Map<Venue>(userCreated);
                await _context.Venues.AddAsync(venueModel);
            } else if(userCreated.Role == "Client") {
                var clientModel = _mapper.Map<Client>(userCreated);

                await _context.Clients.AddAsync(clientModel);
            }

            _context.SaveChanges();
        }
    }
}