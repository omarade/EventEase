using AutoMapper;
using FakeItEasy;
using MassTransit;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using UserService.Controllers;
using UserService.Data;
using UserService.Models;
using UserService.Models.Dtos;

namespace UserService.UnitTests.Controllers
{
    public class ClientsControllerTests
    {
        private IClientRepo _clientRepo;
        private IMapper _mapper;
        private IPublishEndpoint _publishEndpoint;
        public ClientsControllerTests()
        {
            _clientRepo = A.Fake<IClientRepo>();
            _mapper = A.Fake<IMapper>();
            _publishEndpoint = A.Fake<IPublishEndpoint>();
        }

        [Fact]
        public async Task GetClients_Returns_Correct_Numbers_Of_CLients()
        {
            //Arrange
            int count = 5;

            var fakeClients = A.CollectionOfDummy<Client>(count).AsEnumerable();
            var fakeClientsDtos = A.CollectionOfDummy<ClientReadDto>(count).AsEnumerable();

            A.CallTo(() => _clientRepo.GetAllClients(20,1)).Returns(fakeClients);
            A.CallTo(() => _mapper.Map<IEnumerable<ClientReadDto>>(fakeClients)).Returns(fakeClientsDtos);

            var clientsController = new ClientsController(_clientRepo, _mapper, _publishEndpoint);

            //Act
            var actionResult = await clientsController.GetClients();

            //Assert
            var result = actionResult.Result as OkObjectResult;
            var returnClients = result.Value as IEnumerable<ClientReadDto>;

            Assert.Multiple(
                () => Assert.Equal(count, returnClients.Count()),
                () => Assert.Equal(fakeClientsDtos, returnClients),
                () => Assert.Equal((int)HttpStatusCode.OK, result.StatusCode)
            );
        }

        //[Fact]
        //public void GetClientById_Returns_Correct_Client()
        //{
        //    //Arrange
        //    var clientId = "e0de8c02-79fd-48d0-8e99-fe3304b4995c"; // Set the desired user ID for testing

        //    var client = new Client() { ExternalId = "e0de8c02-79fd-48d0-8e99-fe3304b4995c", Name = "Logan Tate", Email = "client@gmail.com" };

        //    var fakeUser = A.Fake<ClaimsPrincipal>();
        //    A.CallTo(() => fakeUser.GetId()).Returns(clientId);

        //    A.CallTo(() => _clientRepo.GetClientById(1)).Returns(client);

        //    var clientReadDto = new ClientReadDto() { Id= 1, Name = "Logan Tate", Email = "client@gmail.com" };

        //    A.CallTo(() => _mapper.Map<ClientReadDto>(client)).Returns(clientReadDto);

        //    //Act
        //    var clientsController = new ClientsController(_clientRepo, _mapper, _publishEndpoint);

        //    var actionResult = clientsController.GetClientById(1);

        //    //Assert
        //    var result = actionResult.Result as OkObjectResult;
        //    var returnClient = result.Value as ClientReadDto;

        //    Assert.Multiple(
        //        () => Assert.Equal(clientReadDto, returnClient),
        //        () => Assert.Equal(((int)HttpStatusCode.OK), result.StatusCode)
        //    );
        //}
    }
}