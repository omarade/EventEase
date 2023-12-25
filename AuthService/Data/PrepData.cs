using Microsoft.AspNetCore.Identity;

namespace AuthService.Data
{
    public class PrepData
    {
        public static void PrepPopulation(IApplicationBuilder app, bool isProd)
        {
            using (var serviceScope = app.ApplicationServices.CreateScope())
            {
                SeedData(serviceScope.ServiceProvider.GetService<UserManager<IdentityUser>>(), serviceScope.ServiceProvider.GetService<RoleManager<IdentityRole>>(), isProd);
            }        
        }

        private static void SeedData(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, bool isProd)
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

            // Create roles
            roleManager.CreateAsync(new IdentityRole("Admin"));
            roleManager.CreateAsync(new IdentityRole("Venue"));
            roleManager.CreateAsync(new IdentityRole("Client"));

            // Create users with different roles
            // 1. Admin
            var admin = new IdentityUser()
            {
                Id = "e0de8c02-79fd-48d0-8e99-fe3304b4995b",
                Email = "admin@gmail.com",
                UserName = "admin@gmail.com"
            };
            userManager.CreateAsync(admin, "Pa$$w0rd!");
            userManager.AddToRoleAsync(admin, "Admin");

            // 2. Venue
            var venue = new IdentityUser()
            {
                Id = "e0de8c02-79fd-48d0-8e99-fe3304b4995a",
                Email = "venue@gmail.com",
                UserName = "venue@gmail.com"
            };
            userManager.CreateAsync(venue, "Pa$$w0rd!");
            userManager.AddToRoleAsync(venue, "Venue");

            // 3. Client
            var client = new IdentityUser()
            {
                Id = "e0de8c02-79fd-48d0-8e99-fe3304b4995c",
                Email = "client@gmail.com",
                UserName = "client@gmail.com"
            };
            userManager.CreateAsync(client, "Pa$$w0rd!");
            userManager.AddToRoleAsync(client, "Client");
        }
    }   
}