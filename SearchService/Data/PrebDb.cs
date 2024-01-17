using SearchService.Models;

namespace SearchService.Data
{
    public class PrebDb
    {
        public static void PrepPopulation(IApplicationBuilder app, bool isProd)
        {
            using (var serviceScope = app.ApplicationServices.CreateScope())
            {
                SeedData(serviceScope.ServiceProvider.GetService<IEventRepo>(), isProd);
            }
        }

        private static void SeedData(IEventRepo eventRepo, bool isProd)
        {
            // if(!isProd) {
            //     var venue1 = new Venue { ExternalId = "1001", Name = "Rockin' Arena", City = "New York", Email = "rockinarena@gmail.com" };
            //     var event1 = new Event() { ExternalId = 1, Name = "Rock Music Explosion", Type = "Music", Artist = "Guitar Legend", Description = "A night of rock classics and electrifying solos.", DateTime = new DateTime(2024, 6, 7, 13, 0, 0), TotalTickets = 600, RemainingTickets = 600, Venue = venue1 };

            //     Venue venue2 = new Venue { ExternalId = "1002", Name = "Jazz Lounge", City = "Chicago", Email = "jazzlounge@gmail.com" };
            //     var event2 = new Event() { ExternalId = 2, Name = "Smooth Jazz Night", Type = "Music", Artist = "Saxophone Virtuoso", Description = "Relax with the smooth sounds of jazz under the city lights.", DateTime = new DateTime(2024, 6, 7, 13, 0, 0), TotalTickets = 300, RemainingTickets = 300, Venue = venue2 };

            //     Venue venue3 = new Venue { ExternalId = "1003", Name = "Theater Haven", City = "London", Email = "theaterhaven@gmail.com" };
            //     var event3 = new Event() { ExternalId = 3, Name = "Shakespearean Drama", Type = "Theater", Artist = "Stage Maestro", Description = "A classic Shakespearean play brought to life on stage.", DateTime = new DateTime(2024, 7, 12, 13, 0, 0), TotalTickets = 400, RemainingTickets = 400, Venue = venue3 };

            //     Venue venue4 = new Venue { ExternalId = "1004", Name = "Tech Hub", City = "San Francisco", Email = "techhub@gmail.com" };
            //     var event4 = new Event() { ExternalId = 4, Name = "Innovation Summit", Type = "Technology", Artist = "Tech Visionary", Description = "Explore the future of technology with industry leaders.", DateTime = new DateTime(2024, 8, 16, 13, 0, 0), TotalTickets = 250, RemainingTickets = 250, Venue = venue4 };

            //     Venue venue5 = new Venue { ExternalId = "1005", Name = "Laugh Factory", City = "Los Angeles", Email = "laughfactory@gmail.com" };
            //     var event5 = new Event() { ExternalId = 5, Name = "Stand-up Comedy Extravaganza", Type = "Comedy", Artist = "Comic Genius", Description = "An evening filled with laughter and comedic brilliance.", DateTime = new DateTime(2024, 9, 20, 13, 0, 0), TotalTickets = 350, RemainingTickets = 350, Venue = venue5 };

            //     Venue venue6 = new Venue { ExternalId = "1006", Name = "Artistic Haven", City = "Paris", Email = "artistic.haven@gmail.com" };
            //     var event6 = new Event() { ExternalId = 6, Name = "Modern Art Showcase", Type = "Art", Artist = "Contemporary Artists", Description = "Immerse yourself in the world of modern art and creativity.", DateTime = new DateTime(2024, 10, 24, 13, 0, 0), TotalTickets = 200, RemainingTickets = 200, Venue = venue6 };

            //     Venue venue7 = new Venue { ExternalId = "1007", Name = "Dance Paradise", City = "Rio de Janeiro", Email = "danceparadise@gmail.com" };
            //     var event7 = new Event() { ExternalId = 7, Name = "Samba Carnival", Type = "Dance", Artist = "Samba Diva", Description = "Experience the energy and rhythm of Brazilian Samba.", DateTime = new DateTime(2024, 11, 28, 13, 0, 0), TotalTickets = 500, RemainingTickets = 500, Venue = venue7 };

            //     Venue venue8 = new Venue { ExternalId = "1008", Name = "Literary Lounge", City = "Tokyo", Email = "literarylounge@gmail.com" };
            //     var event8 = new Event() { ExternalId = 8, Name = "Haiku Poetry Night", Type = "Literature", Artist = "Poetry Master", Description = "An intimate evening of Haiku poetry and reflection.", DateTime = new DateTime(2024, 12, 5, 13, 0, 0), TotalTickets = 150, RemainingTickets = 150, Venue = venue8 };

            //     Venue venue9 = new Venue { ExternalId = "1009", Name = "Culinary Delights", City = "Rome", Email = "culinarydelights@gmail.com" };
            //     var event9 = new Event() { ExternalId = 9, Name = "Gourmet Tasting Gala", Type = "Culinary", Artist = "Master Chef", Description = "Indulge in the finest gourmet creations from around the world.", DateTime = new DateTime(2025, 1, 9, 13, 0, 0), TotalTickets = 300, RemainingTickets = 300, Venue = venue9 };

            //     Venue venue10 = new Venue { ExternalId = "1010", Name = "Fashion Central", City = "Milan", Email = "fashioncentral@gmail.com" };
            //     var event10 = new Event() { ExternalId = 10, Name = "Fashion Runway Showcase", Type = "Fashion", Artist = "Runway Icon", Description = "A glamorous runway show featuring the latest fashion trends.", DateTime = new DateTime(2025, 2, 13, 13, 0, 0), TotalTickets = 400, RemainingTickets = 400, Venue = venue10 };

            //     Venue venue11 = new Venue { ExternalId = "1011", Name = "Acoustic Lounge", City = "Nashville", Email = "acousticlounge@gmail.com" };
            //     var event11 = new Event() { ExternalId = 11, Name = "Unplugged Sessions", Type = "Music", Artist = "Acoustic Virtuoso", Description = "Intimate acoustic performances in a cozy lounge setting.", DateTime = new DateTime(2025, 3, 20, 13, 0, 0), TotalTickets = 200, RemainingTickets = 200, Venue = venue11 };

            //     Venue venue12 = new Venue { ExternalId = "1012", Name = "Mystery Mansion", City = "New Orleans", Email = "mysterymansion@gmail.com" };
            //     var event12 = new Event() { ExternalId = 12, Name = "Murder Mystery Night", Type = "Theater", Artist = "Mystery Mastermind", Description = "Solve the case in an interactive murder mystery experience.", DateTime = new DateTime(2025, 4, 1, 13, 0, 0), TotalTickets = 120, RemainingTickets = 120, Venue = venue12 };

            //     Venue venue13 = new Venue { ExternalId = "1013", Name = "Digital Oasis", City = "Austin", Email = "digitaloasis@gmail.com" };
            //     var event13 = new Event() { ExternalId = 13, Name = "Virtual Reality Expo", Type = "Technology", Artist = "VR Innovator", Description = "Immerse yourself in the world of virtual reality and cutting-edge tech.", DateTime = new DateTime(2025, 5, 15, 13, 0, 0), TotalTickets = 180, RemainingTickets = 180, Venue = venue13 };

            //     Venue venue14 = new Venue { ExternalId = "1014", Name = "Giggles Club", City = "Sydney", Email = "gigglesclub@gmail.com" };
            //     var event14 = new Event() { ExternalId = 14, Name = "Funny Improv Night", Type = "Comedy", Artist = "Improvisation Maestro", Description = "Laugh out loud with hilarious on-the-spot improv comedy.", DateTime = new DateTime(2025, 6, 2, 13, 0, 0), TotalTickets = 250, RemainingTickets = 250, Venue = venue14 };

            //     Venue venue15 = new Venue { ExternalId = "1015", Name = "Canvas Dreams", City = "Barcelona", Email = "canvasdreams@gmail.com" };
            //     var event15 = new Event() { ExternalId = 15, Name = "Abstract Art Exhibition", Type = "Art", Artist = "Abstract Visionaries", Description = "Explore the beauty of abstract art in a vibrant exhibition.", DateTime = new DateTime(2025, 7, 8, 13, 0, 0), TotalTickets = 300, RemainingTickets = 300, Venue = venue15 };

            //     Venue venue16 = new Venue { ExternalId = "1016", Name = "Rhythmic Retreat", City = "Havana", Email = "rhythmicretreat@gmail.com" };
            //     var event16 = new Event() { ExternalId = 16, Name = "Latin Dance Fiesta", Type = "Dance", Artist = "Salsa Sensation", Description = "Dance the night away with passionate Latin rhythms.", DateTime = new DateTime(2025, 8, 14, 13, 0, 0), TotalTickets = 350, RemainingTickets = 350, Venue = venue16 };

            //     Venue venue17 = new Venue { ExternalId = "1017", Name = "Novel Nook", City = "Seoul", Email = "novelnook@gmail.com" };
            //     var event17 = new Event() { ExternalId = 17, Name = "Sci-Fi Book Launch", Type = "Literature", Artist = "Sci-Fi Maestro", Description = "Embark on a journey through the realms of science fiction literature.", DateTime = new DateTime(2025, 9, 20, 13, 0, 0), TotalTickets = 180, RemainingTickets = 180, Venue = venue17 };

            //     Venue venue18 = new Venue { ExternalId = "1018", Name = "Taste Haven", City = "Bangkok", Email = "tastehaven@gmail.com" };
            //     var event18 = new Event() { ExternalId = 18, Name = "Street Food Festival", Type = "Culinary", Artist = "Street Food Connoisseur", Description = "Savor the flavors of global street food delights.", DateTime = new DateTime(2025, 10, 26, 13, 0, 0), TotalTickets = 400, RemainingTickets = 400, Venue = venue18 };

            //     Venue venue19 = new Venue { ExternalId = "1019", Name = "Catwalk Central", City = "Berlin", Email = "catwalkcentral@gmail.com" };
            //     var event19 = new Event() { ExternalId = 19, Name = "Haute Couture Runway", Type = "Fashion", Artist = "Fashion Maestro", Description = "A showcase of high fashion and couture creations.", DateTime = new DateTime(2025, 11, 1, 13, 0, 0), TotalTickets = 280, RemainingTickets = 280, Venue = venue19 };

            //     Venue venue20 = new Venue { ExternalId = "1020", Name = "Serene Soundscape", City = "Kyoto", Email = "serenesoundscape@gmail.com" };
            //     var event20 = new Event() { ExternalId = 20, Name = "Zen Music Meditation", Type = "Music", Artist = "Zen Composer", Description = "Find tranquility with soothing music in a serene setting.", DateTime = new DateTime(2025, 12, 7, 13, 0, 0), TotalTickets = 150, RemainingTickets = 150, Venue = venue20 };

            //     Venue venue21 = new Venue { ExternalId = "1021", Name = "Funky Fusion Club", City = "Austin", Email = "funkyfusionclub@gmail.com" };
            //     var event21 = new Event() { ExternalId = 21, Name = "Eclectic Music Night", Type = "Music", Artist = "Genre Bender", Description = "A mix of musical genres for a night of diverse and funky vibes.", DateTime = new DateTime(2024, 6, 10, 13, 0, 0), TotalTickets = 180, RemainingTickets = 180, Venue = venue21 };

            //     Venue venue22 = new Venue { ExternalId = "1022", Name = "Whodunit Theatre", City = "London", Email = "whodunittheatre@gmail.com" };
            //     var event22 = new Event() { ExternalId = 22, Name = "Mysterious Whodunit", Type = "Theater", Artist = "Detective Dramatist", Description = "Unravel the mystery in an interactive whodunit theater experience.", DateTime = new DateTime(2024, 7, 15, 13, 0, 0), TotalTickets = 120, RemainingTickets = 120, Venue = venue22 };

            //     Venue venue23 = new Venue { ExternalId = "1023", Name = "Digital Wonderland", City = "San Francisco", Email = "digitalwonderland@gmail.com" };
            //     var event23 = new Event() { ExternalId = 23, Name = "Virtual Reality Showcase", Type = "Technology", Artist = "VR Enthusiast", Description = "Explore the wonders of virtual reality and immersive experiences.", DateTime = new DateTime(2024, 8, 20, 13, 0, 0), TotalTickets = 250, RemainingTickets = 250, Venue = venue23 };

            //     Venue venue24 = new Venue { ExternalId = "1024", Name = "Giggle Galaxy", City = "Sydney", Email = "gigglegalaxy@gmail.com" };
            //     var event24 = new Event() { ExternalId = 24, Name = "Comedy Constellation", Type = "Comedy", Artist = "Galactic Jester", Description = "Embark on a laughter-filled journey through the cosmic realm of comedy.", DateTime = new DateTime(2024, 9, 5, 13, 0, 0), TotalTickets = 300, RemainingTickets = 300, Venue = venue24 };

            //     Venue venue25 = new Venue { ExternalId = "1025", Name = "Vivid Visions Gallery", City = "Barcelona", Email = "vividvisionsgallery@gmail.com" };
            //     var event25 = new Event() { ExternalId = 25, Name = "Colorful Art Exhibition", Type = "Art", Artist = "Palette Pioneer", Description = "Immerse yourself in a vibrant world of colorful and expressive art.", DateTime = new DateTime(2024, 10, 12, 13, 0, 0), TotalTickets = 200, RemainingTickets = 200, Venue = venue25 };

            //     Venue venue26 = new Venue { ExternalId = "1026", Name = "Rhythmic Retreat", City = "Havana", Email = "rhythmicretreat@gmail.com" };
            //     var event26 = new Event() { ExternalId = 26, Name = "Latin Dance Fiesta", Type = "Dance", Artist = "Salsa Sensation", Description = "Dance the night away with passionate Latin rhythms.", DateTime = new DateTime(2024, 11, 8, 13, 0, 0), TotalTickets = 350, RemainingTickets = 350, Venue = venue26 };

            //     Venue venue27 = new Venue { ExternalId = "1027", Name = "Novel Nook", City = "Seoul", Email = "novelnook@gmail.com" };
            //     var event27 = new Event() { ExternalId = 27, Name = "Sci-Fi Book Launch", Type = "Literature", Artist = "Sci-Fi Maestro", Description = "Embark on a journey through the realms of science fiction literature.", DateTime = new DateTime(2024, 12, 16, 13, 0, 0), TotalTickets = 180, RemainingTickets = 180, Venue = venue27 };

            //     Venue venue28 = new Venue { ExternalId = "1028", Name = "Taste Haven", City = "Bangkok", Email = "tastehaven@gmail.com" };
            //     var event28 = new Event() { ExternalId = 28, Name = "Street Food Festival", Type = "Culinary", Artist = "Street Food Connoisseur", Description = "Savor the flavors of global street food delights.", DateTime = new DateTime(2025, 1, 22, 13, 0, 0), TotalTickets = 400, RemainingTickets = 400, Venue = venue28 };

            //     Venue venue29 = new Venue { ExternalId = "1029", Name = "Catwalk Central", City = "Berlin", Email = "catwalkcentral@gmail.com" };
            //     var event29 = new Event() { ExternalId = 29, Name = "Haute Couture Runway", Type = "Fashion", Artist = "Fashion Maestro", Description = "A showcase of high fashion and couture creations.", DateTime = new DateTime(2025, 2, 28, 13, 0, 0), TotalTickets = 280, RemainingTickets = 280, Venue = venue29 };

            //     Venue venue30 = new Venue { ExternalId = "1030", Name = "Serene Soundscape", City = "Kyoto", Email = "serenesoundscape@gmail.com" };
            //     var event30 = new Event() { ExternalId = 30, Name = "Zen Music Meditation", Type = "Music", Artist = "Zen Composer", Description = "Find tranquility with soothing music in a serene setting.", DateTime = new DateTime(2025, 3, 7, 13, 0, 0), TotalTickets = 150, RemainingTickets = 150, Venue = venue30 };

            //     eventRepo.CreateEvent(event1);
            //     eventRepo.CreateEvent(event2);
            //     eventRepo.CreateEvent(event3);
            //     eventRepo.CreateEvent(event4);
            //     eventRepo.CreateEvent(event5);
            //     eventRepo.CreateEvent(event6);
            //     eventRepo.CreateEvent(event7);
            //     eventRepo.CreateEvent(event8);
            //     eventRepo.CreateEvent(event9);
            //     eventRepo.CreateEvent(event10);
            //     eventRepo.CreateEvent(event11);
            //     eventRepo.CreateEvent(event12);
            //     eventRepo.CreateEvent(event13);
            //     eventRepo.CreateEvent(event14);
            //     eventRepo.CreateEvent(event15);
            //     eventRepo.CreateEvent(event16);
            //     eventRepo.CreateEvent(event17);
            //     eventRepo.CreateEvent(event18);
            //     eventRepo.CreateEvent(event19);
            //     eventRepo.CreateEvent(event20);
            //     eventRepo.CreateEvent(event21);
            //     eventRepo.CreateEvent(event22);
            //     eventRepo.CreateEvent(event23);
            //     eventRepo.CreateEvent(event24);
            //     eventRepo.CreateEvent(event25);
            //     eventRepo.CreateEvent(event26);
            //     eventRepo.CreateEvent(event27);
            //     eventRepo.CreateEvent(event28);
            //     eventRepo.CreateEvent(event29);
            //     eventRepo.CreateEvent(event30);
            // }
        }
    }
}