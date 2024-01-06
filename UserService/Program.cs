using System.Text;
using MassTransit;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using UserService.Consumers;
using UserService.Data;

public class Program
{
    static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // vars
        var rabbitMQ = "";
        var jwtConfig = "";
        var connectionString = "";

        //Env specific configuration
        if (builder.Environment.IsProduction())
        {
            rabbitMQ = Environment.GetEnvironmentVariable("RABBIT_MQ");
            Console.WriteLine(rabbitMQ);
            jwtConfig = Environment.GetEnvironmentVariable("JWT");
            Console.WriteLine(jwtConfig);
            connectionString = Environment.GetEnvironmentVariable("USER_DB_CONNECTION_STRING");
            Console.WriteLine(connectionString);
         
            Console.WriteLine("----> Using SqlServer Db");
            builder.Services.AddDbContext<AppDbContext>(options =>
                options.UseSqlServer(connectionString)
            );
        }
        else
        {
            rabbitMQ = $"amqp://guest:guest@{builder.Configuration["RabbitMQHost"]}:{builder.Configuration["RabbitMQPort"]}";
            jwtConfig = builder.Configuration.GetSection("JwtConfig:Secret").Value;

            Console.WriteLine("----> Using InMem Db");
            builder.Services.AddDbContext<AppDbContext>(opt =>
                opt.UseInMemoryDatabase("InMem")
            );
        }

        builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

        //Configure MassTransit RMQ
        builder.Services.AddMassTransit(config =>
        {
            // register consumer
            config.AddConsumer<ClientCreatedConsumer>();
            config.AddConsumer<VenueCreatedConsumer>();

            config.SetKebabCaseEndpointNameFormatter();

            config.UsingRabbitMq((ctx, cfg) =>
            {
                Console.WriteLine(rabbitMQ);
                cfg.Host(rabbitMQ);

                cfg.ReceiveEndpoint("UserService_client-created-endpoint", c =>
                {
                    // define the consumer class
                    c.ConfigureConsumer<ClientCreatedConsumer>(ctx);
                });

                cfg.ReceiveEndpoint("UserService_venue-created-endpoint", c =>
                {
                    // define the consumer class
                    c.ConfigureConsumer<VenueCreatedConsumer>(ctx);
                });
            });
        });

        // Add services to the container.
        builder.Services.AddScoped<IClientRepo, ClientRepo>();
        builder.Services.AddScoped<IVenueRepo, VenueRepo>();


        builder.Services.AddControllers();
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        //Configure JWT
        builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(jwt =>
            {
                var key = Encoding.ASCII.GetBytes(jwtConfig);
                jwt.SaveToken = true;

                jwt.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    RequireExpirationTime = false,
                    ValidateLifetime = true
                };
            });

        builder.Services.AddAuthorization();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        PrepDb.PrepPopulation(app, app.Environment.IsProduction());

        app.UseHttpsRedirection();

        app.UseAuthorization();

        app.MapControllers();

        app.Run();

    }
}
