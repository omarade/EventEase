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

            // Messagebus Event models
            CreateMap<VenueCreated, Venue>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                )
                .ForMember(dest => dest.Id, 
                    opt => opt.Ignore()
                );
                                
            CreateMap<ClientCreated, Client>()                
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                )
                .ForMember(dest => dest.Id, 
                    opt => opt.Ignore()
                );

            CreateMap<Venue, VenueDeleted>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );

            CreateMap<Client, ClientDeleted>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );

            CreateMap<Venue, VenueUpdated>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );

            CreateMap<Client, ClientUpdated>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );
        }
        
    }
}