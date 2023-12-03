using UserService.Models;

namespace UserService.Data
{
    public class ClientRepo : IClientRepo
    {
        private readonly AppDbContext _context;

        public ClientRepo(AppDbContext context)
        {
            _context = context;
        }

        public void CreateClient(Client client)
        {
            if(client is null) 
            {
                throw new ArgumentNullException(nameof(client));
            }

            _context.Clients.Add(client);
        }

        public IEnumerable<Client> GetAllClients()
        {
            return _context.Clients.ToList();
        }

        public Client GetClientById(int id)
        {
            return _context.Clients.FirstOrDefault(c => c.Id == id);
        }

        public bool SaveChanges()
        {
            return (_context.SaveChanges() >= 0);
        }

    }
}