using Microsoft.EntityFrameworkCore;
using UserService.Data;
using UserService.Models;

namespace UserService.UnitTests.Data
{
    public class ClientRepoTests : IDisposable
    {
        private AppDbContext _context;

        public ClientRepoTests()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
               .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
               .Options;

            _context = new AppDbContext(options);
        }

        public void Dispose()
        {
            _context.Dispose();
        }

        [Fact]
        public void GetClients_Returns_Correct_Numbers_Of_CLients()
        {
            //Arrange
            var clients = new List<Client>
            {
                new Client { Email = "client1@gmail.com", Name = "Client1", ExternalId = "e0de8c02-79fd-48d0-8e99-fe3304b4995c" },
                new Client { Email = "client2@gmail.com", Name = "Client2", ExternalId = "e0de8c02-79fd-48d0-8e99-fe3304b4995b" }
            };

            _context.Clients.AddRange(clients);
            _context.SaveChanges();

            var clientRepo = new ClientRepo(_context);

            //Act
            var result = clientRepo.GetAllClients();

            //Assert
            Assert.Multiple(
                () => Assert.Equal(clients.Count(), result.Count()),
                () => Assert.Equal(clients, result),
                () => Assert.Equal(1, result.First().Id)
            );
        }

        [Fact]
        public void GetClientById_Returns_Correct_Client()
        {
            //Arrange
            var clients = new List<Client>
            {
                new Client { Email = "client1@gmail.com", Name = "Client1", ExternalId = "e0de8c02-79fd-48d0-8e99-fe3304b4995c" },
                new Client { Email = "client2@gmail.com", Name = "Client2", ExternalId = "e0de8c02-79fd-48d0-8e99-fe3304b4995b" }
            };

            _context.Clients.AddRange(clients);
            _context.SaveChanges();

            var clientRepo = new ClientRepo(_context);

            //Act
            var result = clientRepo.GetClientById(1);

            //Assert
            Assert.Multiple(
                () => Assert.Equal(clients.First(), result),
                () => Assert.Equal(1, result.Id)
            );
        }
    }
}
