using UserService.Models;

namespace UserService.Data
{
    public static class PrepDb
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
            // if(isProd)
            // {
            //     Console.WriteLine("----> Attempting to apply migrations...");
            //     try
            //     {
            //         context.Database.Migrate();
            //     }
            //     catch(Exception e)
            //     {
            //         Console.WriteLine($"----> Could not run migrations: {e.Message}");
            //     }
                
            // }
          
            if(!context.Clients.Any() || !context.Venues.Any())
            {
                // Add client
                if(!context.Clients.Any())
                {
                    Console.WriteLine("---> Seeding Clients data...");

                    context.Clients.AddRange(
                        new Client() {ExternalId="e0de8c02-79fd-48d0-8e99-fe3304b4995c", Name="Logan Tate", Email="client@gmail.com"}
                    );
                }

                // Add venue
                if(!context.Venues.Any())
                {
                    Console.WriteLine("---> Seeding Venues data...");

                    context.Venues.AddRange(
                        new Venue() {ExternalId="e0de8c02-79fd-48d0-8e99-fe3304b4995a", Name="Sapphire Sky Hall", Email="venue@gmail.com", PhoneNumber= "+1 (555) 123-4523", Address="Crystal Avenue 456", City="Townsville"}
                    );
                }                

                context.SaveChanges();
            }
            else
            {
                Console.WriteLine("---> We have data");
            }
        }
    }
}