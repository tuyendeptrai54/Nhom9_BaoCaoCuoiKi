 using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace DemoBackend.Model
{
    public class AccountAddModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên tài khoản")]
        [MaxLength(255, ErrorMessage = "Tên tài khoản  không được quá  255 kí tự")]

        public string AccountName{ get; set; }
        [Required(ErrorMessage = "Vui lòng nhập email")]
        public string AccountEmail { get; set; }
        
        public string AccountPassword { get; set; }
       
        
    }
}
