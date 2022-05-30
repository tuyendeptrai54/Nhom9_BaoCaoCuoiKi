using System.ComponentModel.DataAnnotations;

namespace DemoBackend.Database
{
    public class Customer
    {
        
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string CustomerSex { get; set; }
        public int Age { get; set; }
        public string Avatar { get; set; }
        public int Id { get; set; }
    }
}
