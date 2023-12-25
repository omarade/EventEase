using EventService.Models;

namespace EventService.Data
{
    public interface IClientRepo
    {
        bool SaveChanges();

        IEnumerable<Client> GetAllClients();

        Client GetClientById(int id);

        Client GetClientByExternalId(string id);

        Client GetClientByEmail(string email);

        void CreateClient(Client client);

        void UpdateClient(Client client);

        void DeleteClient(Client client);
    }
}