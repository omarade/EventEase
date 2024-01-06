using UserService.Models;

namespace UserService.Data
{
    public interface IClientRepo
    {
        Task<bool> SaveChanges();

        Task<IEnumerable<Client>> GetAllClients();

        Task<Client> GetClientById(int id);

        Task<Client> GetClientByEmail(string email);

        void CreateClient(Client client);

        void UpdateClient(Client client);

        void DeleteClient(Client client);
    }
}