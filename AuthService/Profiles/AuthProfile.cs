using AutoMapper;
using MessageBusEvents.Models;
using Microsoft.AspNetCore.Identity;

namespace AuthService.Profiles
{
    public class AuthProfile: Profile
    {
        public AuthProfile()
        {
            // Source -> Target
            CreateMap<IdentityUser, UserCreated>();
            CreateMap<UserDeleted, IdentityUser>();
        }
    }
}