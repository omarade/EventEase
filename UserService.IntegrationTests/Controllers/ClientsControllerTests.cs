using FluentAssertions;
using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using UserService.Models.Dtos;

// Resource: https://www.frodehus.dev/integration-testing-jwt-authenticated-apis/
namespace UserService.IntegrationTests.Controllers
{
    public class ClientsControllerTests: EndToEndTestCase
    {
        [Fact]
        public async Task GetClients_ReturnsAllClients()
        {
            //Arrange
            var token = new TestJwtToken().WithRole("Admin").Build();

            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            //Act
            var response = await Client.GetFromJsonAsync<IEnumerable<ClientReadDto>>("/api/clients");

            //Assert
            response.Should().NotBeNullOrEmpty();
            response.Should().HaveCount(1);
            response.FirstOrDefault().Id.Should().Be(1);
        }

        [Fact]
        public async Task GetClients_NoToken_ReturnsUnauthorized()
        {
            //Act
            var response = await Client.GetAsync("/api/clients");

            //Assert
            response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
        }

        [Theory]
        [InlineData("Client")]
        [InlineData("Venue")]
        public async Task GetClients_NonAdminToken_ReturnsForbidden(string roleName)
        {
            //Arrange
            var token = new TestJwtToken().WithRole(roleName).Build();

            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            //Act
            var response = await Client.GetAsync("/api/clients");

            //Assert
            response.StatusCode.Should().Be(HttpStatusCode.Forbidden);
        }

        [Fact]
        public async Task GetClientById_AsOwner_ReturnsClient()
        {
            //Arrange
            var token = new TestJwtToken().WithId("e0de8c02-79fd-48d0-8e99-fe3304b4995c").Build();
            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);            

            //Act
            var response = await Client.GetAsync("/api/clients/1");

            //Assert
            response.EnsureSuccessStatusCode();      
            response.StatusCode.Should().Be(HttpStatusCode.OK);

            var client = await response.Content.ReadFromJsonAsync<ClientReadDto>();

            client.Should().NotBeNull();
            client.Id.Should().Be(1);
            client.Name.Should().Be("Logan Tate");
            client.Email.Should().Be("client@gmail.com");
        }

        [Fact]
        public async Task GetClientById_NonOwner_ReturnsUnauthorized()
        {
            //Arrange
            var token = new TestJwtToken().WithId("e0de8c02-79fd-48d0-8e99-fe3304b4995e").Build();
            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            //Act
            var response = await Client.GetAsync("/api/clients/1");

            //Assert
            response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
        }

        [Fact]
        public async Task GetClientById_NotFound_ReturnsNotFound()
        {
            //Arrange
            var token = new TestJwtToken().WithId("e0de8c02-79fd-48d0-8e99-fe3304b4995c").Build();
            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            //Act
            var response = await Client.GetAsync("/api/clients/3");

            //Assert
            response.StatusCode.Should().Be(HttpStatusCode.NotFound);
        }

        [Fact]
        public async Task UpdateClient_AsOwner_UpdatesClient()
        {
            //Arrange
            var token = new TestJwtToken().WithId("e0de8c02-79fd-48d0-8e99-fe3304b4995c").Build();
            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            using StringContent jsonContent = new(
                JsonSerializer.Serialize(new ClientUpdateDto
                {
                    Name = "Name Changed"
                }),
                Encoding.UTF8,
                "application/json");

            //Act
            var response = await Client.PutAsync("/api/clients/1", jsonContent);

            //Assert
            response.EnsureSuccessStatusCode();
            response.StatusCode.Should().Be(HttpStatusCode.NoContent);

            var getClient = await Client.GetAsync("/api/clients/1");

            getClient.EnsureSuccessStatusCode();
            getClient.StatusCode.Should().Be(HttpStatusCode.OK);

            var client = await getClient.Content.ReadFromJsonAsync<ClientReadDto>();

            client.Should().NotBeNull();
            client.Id.Should().Be(1);
            client.Name.Should().Be("Name Changed");
            client.Email.Should().Be("client@gmail.com");
        }

        [Fact]
        public async Task UpdateClient_NonOwner_ReturnsUnauthorized()
        {
            //Arrange
            var token = new TestJwtToken().WithId("e0de8c02-79fd-48d0-8e99-fe3304b4995e").Build();
            Client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            using StringContent jsonContent = new(
                 JsonSerializer.Serialize(new ClientUpdateDto
                 {
                     Name = "Name Changed"
                 }),
                 Encoding.UTF8,
                 "application/json");

            //Act
            var response = await Client.PutAsync("/api/clients/1", jsonContent);

            //Assert
            response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
        }
    }
}
