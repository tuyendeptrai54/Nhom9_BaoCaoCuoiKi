using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace DemoBackend.Model
{  
    public class ProductAddModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]
        [MaxLength(255, ErrorMessage = "Tên sản phẩm  không được quá  255 kí tự")]
        
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mã danh mục")]
        public int CategoryId { get; set; }
        [Range(0,10000000)]
        public double Price { get; set; }
        [Required(ErrorMessage = "Vui lòng chọn hình ảnh")]
        public string Avatar { get; set; }
        public string Description { get; set; }
        public int InStocks { get; set; }
        public string BranchId { get; set; }
    }
}
