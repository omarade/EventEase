using AutoMapper;
using MessageBusEvents.Models;
using SearchService.Models;

namespace SearchService.Profiles
{
    public class SearchProfile : Profile
    {
        public SearchProfile()
        {
            // Messagebus Event models
            CreateMap<EventCreated, Event>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                )               
                .ForMember(dest => dest.Id, 
                    opt => opt.Ignore()
                );

            CreateMap<MessageBusEvents.Models.Dto.Venue, Venue>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                );

            CreateMap<EventUpdated, Event>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                )               
                .ForMember(dest => dest.Id, 
                    opt => opt.Ignore()
                );;
            
            CreateMap<VenueUpdated, Venue>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                );
        }
    }
}