namespace SearchService.Data
{
    public class DatabaseSettings
    {
        public string ConnectionString { get; set; } = null!;

        public string DatabaseName { get; set; } = null!;

        public string EventsCollectionName { get; set; } = null!;
    }
}