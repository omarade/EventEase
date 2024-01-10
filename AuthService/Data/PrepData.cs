using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace AuthService.Data
{
    public class PrepData
    {
        public static async void PrepPopulation(IApplicationBuilder app, bool isProd)
        {
            using (var serviceScope = app.ApplicationServices.CreateScope())
            {
                await SeedData(serviceScope.ServiceProvider.GetService<AppDbContext>(), serviceScope.ServiceProvider.GetService<UserManager<IdentityUser>>(), serviceScope.ServiceProvider.GetService<RoleManager<IdentityRole>>(), isProd);
            }        
        }

        private static async Task SeedData(AppDbContext context, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, bool isProd)
        {
            //Apply data migration
            // if(isProd)
            // {
            //     if (context.Database.GetMigrations().Count() == 0)
            //     {
            //         Console.WriteLine("----> Attempting to apply migrations...");
            //         try
            //         {
            //             context.Database.Migrate();
            //             return;
            //         }
            //         catch (Exception e)
            //         {
            //             Console.WriteLine($"----> Could not run migrations: {e.Message}");
            //         }
            //     }
            // }
            

            if(!isProd) {

                // Check if there is data
                if(await userManager.Users.AnyAsync())
                {
                    Console.WriteLine("Deleting all data...");
                    EmptyDatabase(context);
                }
                Console.WriteLine("Prep data");

                // Create roles
                await roleManager.CreateAsync(new IdentityRole("Admin"));
                await roleManager.CreateAsync(new IdentityRole("Venue"));
                await roleManager.CreateAsync(new IdentityRole("Client"));

                // Create users with different roles
                // 1. Admin
                var admin = new IdentityUser()
                {
                    // Id = "e0de8c02-79fd-48d0-8e99-fe3304b4995b",
                    Email = "admin@gmail.com",
                    UserName = "admin@gmail.com"
                };
                await userManager.CreateAsync(admin, "Pa$$w0rd!");
                await userManager.AddToRoleAsync(admin, "Admin");

                // 2. Venue
                var venue = new IdentityUser()
                {
                    Id = "e0de8c02-79fd-48d0-8e99-fe3304b4995a",
                    Email = "venue@gmail.com",
                    UserName = "venue@gmail.com"
                };
                await userManager.CreateAsync(venue, "Pa$$w0rd!");
                await userManager.AddToRoleAsync(venue, "Venue");

                // 3. Client
                var client = new IdentityUser()
                {
                    Id = "0c152da6-3443-4722-a561-719a562e8135",
                    Email = "client@gmail.com",
                    UserName = "client@gmail.com"
                };
                await userManager.CreateAsync(client, "Pa$$w0rd!");
                await userManager.AddToRoleAsync(client, "Client");
            }
        }

        private static void EmptyDatabase(AppDbContext context)
        {
            var userRecords = context.Users.ToList();
            var roleRecords = context.Roles.ToList();

            if (userRecords.Count() > 0)
            {
                context.Users.RemoveRange(userRecords);
            }

            if (roleRecords.Count() > 0)
            {
                context.Roles.RemoveRange(roleRecords);
            } 

            context.SaveChanges();
        }
    }   
}