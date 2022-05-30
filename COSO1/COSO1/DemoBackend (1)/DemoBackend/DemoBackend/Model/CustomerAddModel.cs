using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace DemoBackend.Model
{
    public class CustomerAddModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên" )]
        [MaxLength(255, ErrorMessage = "Tên khách hàng   không được quá  255 kí tự")]

        public string CustomerName { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập giới tính")]
        public string CustomerSex { get; set; }
        
        public int Age { get; set; }
        [Required(ErrorMessage = "Vui lòng chọn hình ảnh")]
        public string Avatar { get; set; }
        public int Id { get; set; }
    }
}