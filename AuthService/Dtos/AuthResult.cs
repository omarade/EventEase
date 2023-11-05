namespace AuthService.Dtos
{
    public class AuthResult
    {
        public string Token { get; set; } = string.Empty;

        public Boolean Result { get; set; }

        public List<string> Errors { get; set; }

    }
}