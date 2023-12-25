namespace EventService.Models.Dtos
{
    public class ClientReadDto
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public ICollection<Event> Events { get; set; }
    }
}