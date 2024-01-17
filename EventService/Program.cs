using System.Text;
using EventService.Consumers;
using EventService.Data;
using MassTransit;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Prometheus;

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
    connectionString = Environment.GetEnvironmentVariable("EVENT_DB_CONNECTION_STRING");
    Console.WriteLine(connectionString);

    // Console.WriteLine("----> Using SqlServer Db");
    // builder.Services.AddDbContext<AppDbContext>(options =>
    //     options.UseSqlServer(connectionString)
    // );

     Console.WriteLine("----> Using InMem Db");
    builder.Services.AddDbContext<AppDbContext>(opt => 
        opt.UseInMemoryDatabase("InMem")
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

    // connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    // builder.Services.AddDbContext<AppDbContext>(options =>
    //     options.UseSqlServer(connectionString)
    // ); 
}

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

//Configure MassTransit RMQ
builder.Services.AddMassTransit(config => {
    // register consumer
    config.AddConsumer<VenueCreatedConsumer>();
    config.AddConsumer<VenueUpdatedConsumer>();
    config.AddConsumer<VenueDeletedConsumer>();
    config.AddConsumer<ClientCreatedConsumer>();
    config.AddConsumer<ClientUpdatedConsumer>();
    config.AddConsumer<ClientDeletedConsumer>();

    config.SetKebabCaseEndpointNameFormatter();

    config.UsingRabbitMq((ctx, cfg) => {
		Console.WriteLine(rabbitMQ);
        cfg.Host(rabbitMQ);

        cfg.ReceiveEndpoint("EventService_venue-created-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<VenueCreatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("EventService_venue-updated-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<VenueUpdatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("EventService_venue-deleted-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<VenueDeletedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("EventService_client-created-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<ClientCreatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("EventService_client-updated-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<ClientUpdatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("EventService_client-deleted-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<ClientDeletedConsumer>(ctx);
        });
    });
});

// Add services to the container.
builder.Services.AddScoped<IEventRepo, EventRepo>();
builder.Services.AddScoped<IClientRepo, ClientRepo>();
builder.Services.AddScoped<IVenueRepo, VenueRepo>();

//CORS
var allowedSpecificOrigins = "_allowedSpecificOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: allowedSpecificOrigins,
        policy  =>
        {
            policy.WithOrigins("http://localhost:80",
                                "http://localhost:4200");
        }
    );
});


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
            //Expiration date
            RequireExpirationTime = true,
            ValidateLifetime = true,
            ClockSkew = TimeSpan.Zero 
        };
    });

builder.Services.AddAuthorization(); 

var app = builder.Build();

// Monitoring Prometheus: export metrics to Prometheus
// http://localhost:5229/api/events/metrics
app.UseMetricServer("/api/events/metrics");
app.UseHttpMetrics(options =>
{
    // This will preserve only the first digit of the status code.
    // For example: 200, 201, 203 -> 2xx
    options.ReduceStatusCodeCardinality();
});


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// app.UseHttpsRedirection();

// app.UseCors(allowedSpecificOrigins);

app.UseAuthorization();

app.MapControllers();

PrepDb.PrepPopulation(app, app.Environment.IsProduction());

app.Run();
