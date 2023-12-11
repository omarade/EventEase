using AutoMapper;
using MessageBusEvents.Models;
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

            // Event models
            CreateMap<UserCreated, Venue>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                )
                .ForMember(dest => dest.Id, 
                    opt => opt.Ignore()
                );
                                
            CreateMap<UserCreated, Client>()                
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                )
                .ForMember(dest => dest.Id, 
                    opt => opt.Ignore()
                );

            CreateMap<Venue, UserDeleted>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );

            CreateMap<Client, UserDeleted>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );
        }
        
    }
}