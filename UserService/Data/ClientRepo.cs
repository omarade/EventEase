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

            _context.Clients.AddAsync(client);
        }

        public IEnumerable<Client> GetAllClients()
        {
            return _context.Clients.ToList();
        }

        public Client GetClientById(int id)
        {
            return _context.Clients.FirstOrDefault(c => c.Id == id);
        }
        
        public Client GetClientByEmail(string email)
        {
            return _context.Clients.FirstOrDefault(c => c.Email == email);
        }

        public bool SaveChanges()
        {
            return (_context.SaveChanges() >= 0);
        }

        public void UpdateClient(Client client)
        {
            _context.Clients.Update(client);       
        }

        public void DeleteClient(Client client)
        {
            _context.Clients.Remove(client);
        }
    }
}