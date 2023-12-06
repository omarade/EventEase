using UserService.Models;

namespace UserService.Data
{
    public interface IClientRepo
    {
        bool SaveChanges();

        IEnumerable<Client> GetAllClients();

        Client GetClientById(int id);

        Client GetClientByEmail(string email);

        void CreateClient(Client client);

        void UpdateClient(Client client);

        void DeleteClient(Client client);
    }
}