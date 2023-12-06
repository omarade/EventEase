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
                if(!context.Clients.Any())
                {
                    Console.WriteLine("---> Seeding Clients data...");

                    context.Clients.AddRange(
                        new Client() {ExternalId="e0de8c02-79fd-48d0-8e99-fe3304b4995b", Name="Logan Tate", Email="logantate@live.com"},
                        new Client() {ExternalId="test", Name="Alice Johnson", Email="alice.johnson@example.com"},
                        new Client() {ExternalId="test1", Name="Bob Smith", Email="bob.smith@example.com"},
                        new Client() {ExternalId="test2", Name="Emily Davis", Email="emily.davis@example.com"}
                    );
                }

                if(!context.Venues.Any())
                {
                    Console.WriteLine("---> Seeding Venues data...");

                    context.Venues.AddRange(
                    //     new Venue() {Name="Gala Gardens", Email="events@galagardens.com", PhoneNumber= "+1 (555) 123-4567", Address="Blossom Lane 123", City="Cityville"},
                        new Venue() {ExternalId="91ae0b89-5f2e-46e7-87d5-d984e2abd588", Name="Sapphire Sky Hall", Email="info@sapphireskyhall.com", PhoneNumber= "+1 (555) 123-4523", Address="Crystal Avenue 456", City="Townsville"}
                    //     new Venue() {Name="Harborview Pavilion", Email="events@harborviewpavilion.com", PhoneNumber= "+1 (555) 456-7890", Address="Oceanfront Drive 101", City="Port City"}
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