using EventService.Models;
using Microsoft.EntityFrameworkCore;

namespace EventService.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> opt) : base(opt)
        {
            
        }

        public DbSet<Event> Events { get; set; }
        public DbSet<Venue> Venues { get; set; }
        public DbSet<Client> Clients { get; set; }
        public DbSet<ClientEvent> ClientEvents { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<Venue>()
                .HasMany(v => v.Events)
                .WithOne(e => e.Venue)
                .HasForeignKey(e => e.VenueId);

            modelBuilder
                .Entity<Event>()
                .HasOne(e => e.Venue)
                .WithMany(v => v.Events!)
                .HasForeignKey(e => e.VenueId);

            // modelBuilder
            //     .Entity<Event>()
            //     .HasMany(e => e.ClientEvents)
            //     .WithOne(ce => ce.Event)
            //     .HasForeignKey(ce => ce.EventId)
            //     .IsRequired();

            // modelBuilder
            //     .Entity<Client>()
            //     .HasMany(c => c.ClientEvents)
            //     .WithOne(ce => ce.Client)
            //     .HasForeignKey(ce => ce.ClientId)
            //     .IsRequired();

            // modelBuilder
            //     .Entity<ClientEvent>()
            //     .HasMany(ce => ce.Clients)
            //     .WithMany(ce => ce.Events)

            modelBuilder.Entity<Client>()
                .HasMany(c => c.Events)
                .WithMany(e => e.Clients)
                .UsingEntity<ClientEvent>();
        }

    }
}