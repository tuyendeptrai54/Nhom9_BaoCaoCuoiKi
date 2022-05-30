using System.ComponentModel.DataAnnotations;



namespace DemoBackend.Database
{
    public class Branche
    {
        [Key]
        public string BranchId { get; set; }
        public string BranchName { get; set; }
        public string BranchAdd { get; set; }
    }


}