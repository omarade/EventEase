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
                );

            CreateMap<EventUpdated, Event>();
            
            CreateMap<VenueUpdated, Venue>()
                .ForMember(dest => dest.ExternalId, opt =>
                    opt.MapFrom(src => src.Id)
                );
        }
    }
}