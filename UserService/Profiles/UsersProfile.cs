using AutoMapper;
using UserService.Models;
using UserService.Models.Dtos;

namespace UserService.Profiles
{
    public class UsersProfile : Profile
    {
        public UsersProfile()
        {
            // Source -> Target
            CreateMap<Client, ClientReadDto>();
            CreateMap<Venue, VenueReadDto>();
        }
        
    }
}