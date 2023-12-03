using UserService.Models;

namespace UserService.Data
{
    public interface IClientRepo
    {
        bool SaveChanges();

        IEnumerable<Client> GetAllClients();

        Client GetClientById(int id);

        void CreateClient(Client client);

        
    }
}