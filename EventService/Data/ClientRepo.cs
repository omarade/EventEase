using EventService.Models;
using Microsoft.EntityFrameworkCore;

namespace EventService.Data
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
            if (client is null)
            {
                throw new ArgumentNullException(nameof(client));
            }

            _context.Clients.Add(client);
        }

        public async Task<IEnumerable<Client>> GetAllClients()
        {
            return await _context.Clients.ToListAsync();
        }

        public async Task<Client> GetClientById(int id)
        {
            return await _context.Clients
                .Where(c => c.Id == id)
                .Include(c => c.Events)
                    .ThenInclude(e => e.Venue)
                .FirstOrDefaultAsync();
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

        public async Task<Client> GetClientByExternalId(string id)
        {
            return await _context.Clients.FirstOrDefaultAsync(c => c.ExternalId == id);
        }
    }
}