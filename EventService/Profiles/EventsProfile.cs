using AutoMapper;
using EventService.Models;
using EventService.Models.Dtos;
using MessageBusEvents.Models;

namespace EventService.Profiles
{
    public class EventsProfile : Profile
    {
        public EventsProfile()
        {
            CreateMap<Event, EventReadDto>();
            CreateMap<EventCreateDto, Event>();
            CreateMap<ClientEventCreateDto, ClientEvent>();

            CreateMap<Client, ClientReadDto>();
            CreateMap<Venue, VenueReadDto>();

            // Messagebus Event models
            CreateMap<Event, EventCreated>();
            CreateMap<Event, EventUpdated>();
            CreateMap<Event, EventDeleted>();
            CreateMap<Venue, MessageBusEvents.Models.Dto.Venue>()
                .ForMember(dest => dest.Id, opt =>
                    opt.MapFrom(src => src.ExternalId)
                );

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
        }
    }
}