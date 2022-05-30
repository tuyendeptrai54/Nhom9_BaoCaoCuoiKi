using System.ComponentModel.DataAnnotations;



namespace DemoBackend.Database
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int CategoryId { get; set; }
        public double Price { get; set; }
        public string Avatar { get; set; }
        public string Description { get; set; }
        public int InStocks { get; set; }
        public string BranchId { get; set; }
    }
}
