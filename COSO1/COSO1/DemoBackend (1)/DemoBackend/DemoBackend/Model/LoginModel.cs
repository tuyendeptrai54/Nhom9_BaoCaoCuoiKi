using System.ComponentModel.DataAnnotations;



namespace DemoBackend.Models
{
    public class LoginModel
    {
        [Required]

        public string Username { get; set; }

        [Required]
        public string Password { get; set; }

    }
}