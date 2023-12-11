using System.Text;
using MassTransit;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using UserService.Consumers;
using UserService.Data;


var builder = WebApplication.CreateBuilder(args);

// vars
string rabbitMQ = "";

//Configur Databases
if(builder.Environment.IsProduction()){
    Console.WriteLine("----> Using SqlServer Db");
    // builder.Services.AddDbContext<AppDbContext>(opt => 
    //     opt.UseSqlServer(builder.Configuration.GetConnectionString("PlatformsConn"))
    // );  
}
else 
{
    rabbitMQ = $"amqp://guest:guest@{builder.Configuration["RabbitMQHost"]}:{builder.Configuration["RabbitMQPort"]}";

    Console.WriteLine("----> Using InMem Db");
    builder.Services.AddDbContext<AppDbContext>(opt => 
        opt.UseInMemoryDatabase("InMem")
    );
}

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

//Configur MassTrasit RMQ
builder.Services.AddMassTransit(config => {
    // register consumer
    config.AddConsumer<UserCreatedConsumer>();

    config.SetKebabCaseEndpointNameFormatter();

    config.UsingRabbitMq((ctx, cfg) => {
		Console.WriteLine(rabbitMQ);
        cfg.Host(rabbitMQ);

        //cfg.ConfigureEndpoints(context);
        cfg.ReceiveEndpoint("user-created-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<UserCreatedConsumer>(ctx);
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

//Confifure JWT
builder.Services.AddAuthentication(options => 
    {
        options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
        options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    })
    .AddJwtBearer(jwt => 
    {
        var key = Encoding.ASCII.GetBytes(builder.Configuration.GetSection("JwtConfig:Secret").Value);
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
