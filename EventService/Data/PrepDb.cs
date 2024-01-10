using EventService.Models;

namespace EventService.Data
{
    public class PrepDb
    {
        public static void PrepPopulation(IApplicationBuilder app, bool isProd)
        {
            using (var serviceScope = app.ApplicationServices.CreateScope())
            {
                SeedData(serviceScope.ServiceProvider.GetService<AppDbContext>(), isProd);
            }
        }

        private static void SeedData(AppDbContext context, bool isProd)
        {
            //Apply data migration
            if(isProd & context.Database.GetMigrations().Count() == 0)
            {
                Console.WriteLine("----> Attempting to apply migrations...");
                try
                {
                    context.Database.Migrate();
                    return;
                }
                catch(Exception e)
                {
                    Console.WriteLine($"----> Could not run migrations: {e.Message}");
                }                
            }

            if (!isProd)
            {
                if (!context.Events.Any() || !context.Clients.Any() || !context.Venues.Any())
                {
                    // Add venue
                    Console.WriteLine("---> Adding Venues");
                    context.Venues.AddRange(
                        new Venue() {ExternalId="e0de8c02-79fd-48d0-8e99-fe3304b4995a", Name="Sapphire Sky Hall", Email="venue@gmail.com", PhoneNumber= "+1 (555) 123-4523", Address="Crystal Avenue 456", City="Townsville"}
                    );

                    // Add events
                    Console.WriteLine("----> Adding events");
                    context.Events.AddRange(
                        // new Event() {Name="", Type="", Artist="", Description="", TotalTickets=100, RemainingTickets=100}
                        new Event() { Name = "Electric Groove Fest", Type = "Music", Artist = "Synthwave Sensation", Description = "Experience a night of electrifying beats and futuristic tunes.", TotalTickets = 500, RemainingTickets = 500, VenueId = 1  },
                        new Event() { Name = "Comedy Carnival", Type = "Comedy", Artist = "Stand-up Star", Description = "Laugh till your sides hurt with hilarious jokes and witty anecdotes.", TotalTickets = 300, RemainingTickets = 300, VenueId = 1  },
                        new Event() { Name = "Artistic Fusion Exhibition", Type = "Art", Artist = "Canvas Maestro", Description = "Immerse yourself in a world of colors and creativity at this unique art exhibition.", TotalTickets = 200, RemainingTickets = 200, VenueId = 1 },
                        new Event() { Name = "Science Symposium", Type = "Education", Artist = "Tech Innovator", Description = "Explore the latest advancements in science and technology with leading experts.", TotalTickets = 150, RemainingTickets = 150, VenueId = 1  },
                        new Event() { Name = "Dance Fever Showcase", Type = "Dance", Artist = "Choreography Prodigy", Description = "Witness the grace and energy of dancers as they showcase their mesmerizing moves.", TotalTickets = 250, RemainingTickets = 250, VenueId = 1  },
                        new Event() { Name = "Fantasy Book Launch", Type = "Literature", Artist = "Bestselling Author", Description = "Step into the realms of magic and adventure with the launch of a new fantasy novel.", TotalTickets = 100, RemainingTickets = 100, VenueId = 1  },
                        new Event() { Name = "Film Fanatic Screening", Type = "Film", Artist = "Cinematic Genius", Description = "Screening of an exclusive film followed by a Q&A session with the director.", TotalTickets = 180, RemainingTickets = 180, VenueId = 1  },
                        new Event() { Name = "Tech Expo 2023", Type = "Technology", Artist = "Innovation Guru", Description = "Get hands-on experience with the latest gadgets and cutting-edge technology.", TotalTickets = 300, RemainingTickets = 300, VenueId = 1  },
                        new Event() { Name = "Foodie Fiesta", Type = "Culinary", Artist = "Master Chef", Description = "Indulge your taste buds with a gastronomic journey featuring gourmet delights.", TotalTickets = 120, RemainingTickets = 120, VenueId = 1  },
                        new Event() { Name = "Fashion Extravaganza", Type = "Fashion", Artist = "Runway Diva", Description = "Experience the glamour and style of the fashion world with a dazzling runway show.", TotalTickets = 200, RemainingTickets = 200, VenueId = 1  }
                    );

                    // Add client
                    Console.WriteLine("---> Adding Clients");
                    context.Clients.AddRange(
                        new Client() {ExternalId="0c152da6-3443-4722-a561-719a562e8135", Name="Logan Tate", Email="client@gmail.com"}
                    );

                    // Reserve ticket
                    context.ClientEvents.Add(new ClientEvent() {
                        TicketsNum = 5,
                        ClientId = 1, 
                        EventId = 1
                    });

                    context.SaveChanges();
                }
                else
                {
                    Console.WriteLine("---> We have data");
                }
            }
        }
            
    }
}