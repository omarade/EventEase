using AutoMapper;
using MessageBusEvents;
using Microsoft.AspNetCore.Identity;

namespace AuthService.Profiles
{
    public class AuthProfile: Profile
    {
        public AuthProfile()
        {
            // Source -> Target
            CreateMap<IdentityUser, ClientCreated>();
        }
    }
}