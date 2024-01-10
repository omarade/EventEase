using Microsoft.EntityFrameworkCore;
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

        public async Task<IEnumerable<Client>> GetAllClients(int pageSize, int pageNumber)
        {
            if(pageSize > 20) {
                pageSize = 20;
            }

            return await _context.Clients
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();
        }

        public async Task<Client> GetClientById(int id)
        {
            return await _context.Clients.FirstOrDefaultAsync(c => c.Id == id);
        }
        
        public async Task<Client> GetClientByEmail(string email)
        {
            return await _context.Clients.FirstOrDefaultAsync(c => c.Email == email);
        }

        public async Task<bool> SaveChanges()
        {
            return (await _context.SaveChangesAsync() >= 0);
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