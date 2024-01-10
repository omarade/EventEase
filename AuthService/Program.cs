using System.Text;
using AuthService.Configurations;
using AuthService.Consumers;
using AuthService.Data;
using MassTransit;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

var builder = WebApplication.CreateBuilder(args);

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
    connectionString = Environment.GetEnvironmentVariable("AUTH_DB_CONNECTION_STRING");
    Console.WriteLine(connectionString);

    // Read JwtConfig from environment variables
    var jwtConfigObj = new JwtConfig
    {
        Secret = jwtConfig ?? throw new InvalidOperationException("JWT_SECRET environment variable not set.")
    };

    builder.Services.AddSingleton(jwtConfigObj);

    //Map Env Var to JWT Config
    builder.Services.Configure<JwtConfig>(config =>
    {
        config.Secret = jwtConfigObj.Secret;
    });   
    
    Console.WriteLine("----> Using SqlServer Db");
    builder.Services.AddDbContext<AppDbContext>(options =>
        options.UseSqlServer(connectionString)
    );
}
else
{
    rabbitMQ = $"amqp://guest:guest@{builder.Configuration["RabbitMQHost"]}:{builder.Configuration["RabbitMQPort"]}";
    jwtConfig = builder.Configuration.GetSection("JwtConfig:Secret").Value;

    connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

    Console.WriteLine("----> Using InMem Db");
    builder.Services.AddDbContext<AppDbContext>(opt =>
       opt.UseInMemoryDatabase("InMem")
    );

    builder.Services.Configure<JwtConfig>(builder.Configuration.GetSection("JwtConfig"));
    // Console.WriteLine(connectionString);
    // builder.Services.AddDbContext<AppDbContext>(options =>
    //     //options.UseSqlite(connectionString)
    //     options.UseSqlServer(connectionString)
    // );
}

// Add services to the container.

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

builder.Services.AddMassTransit(config => {
    Console.WriteLine(rabbitMQ);

    // register consumer
    config.AddConsumer<ClientDeletedConsumer>();
    config.AddConsumer<VenueDeletedConsumer>();

    config.SetKebabCaseEndpointNameFormatter();

    config.UsingRabbitMq((ctx, cfg) => {
        cfg.Host(rabbitMQ);

        cfg.ReceiveEndpoint("AuthService_client-deleted-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<ClientDeletedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("AuthService_venue-deleted-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<VenueDeletedConsumer>(ctx);
        });
    });
});

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

//Roles
builder.Services.AddIdentity<IdentityUser, IdentityRole>(options => 
    {
        options.SignIn.RequireConfirmedAccount = false;
        options.User.RequireUniqueEmail = true;
        options.Password.RequireUppercase = true;
        options.Password.RequireLowercase = true;
        options.Password.RequireDigit = true;
    })
    .AddEntityFrameworkStores<AppDbContext>();

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

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors(allowedSpecificOrigins);

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

PrepData.PrepPopulation(app, app.Environment.IsProduction());

app.Run();
