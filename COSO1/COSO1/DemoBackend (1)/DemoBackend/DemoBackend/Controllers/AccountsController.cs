using DemoBackend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using DemoBackend.Database;
using System.Linq;

namespace DemoBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
       
    {
        private readonly DemoDbContext _context;
        public AccountsController(DemoDbContext context)
        {
            _context = context;
        }
      
        [Authorize(AuthenticationSchemes = "AuthKey")]

        [Route("index")]
        [HttpGet]
        public IActionResult Index()
        {

            return Ok(new { state = 1, user = User.Identity.Name });
        }

        [HttpPost]
        [Route("login")]
        public IActionResult Login([FromBody] LoginModel model)
        {
            

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

           

            if (_context.Accounts.Any(p => p.AccountEmail == model.Username) ==  true || _context.Accounts.Any(p => p.AccountName == model.Username) == true &&
                _context.Accounts.Any(p => p.AccountPassword == model.Password) == true)
      {
                // gen token
                string secret = "g2sL6RLQh6dVRSSnCRjvEqP971-V2DGpFoUleIfKrIc";
                string iss = "dcaea177e8d14f1fb863059dde75ca3b";
                string audience = "Demo Backend";

                var signingKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secret));

                var claims = new List<Claim>()
                     {
                    new Claim(ClaimTypes.Name, model.Username),
                    new Claim(ClaimTypes.NameIdentifier, model.Username),
                    new Claim(ClaimTypes.Email, "trongtuyenlekhiet.com"),
                    new Claim("FirstName", "Tuyen"),
                    new Claim("LastName", "Tran"),
                    new Claim("Role", model.Username)
                    };

                var jwt = new JwtSecurityToken(
                   issuer: iss,
                   audience: audience,
                   claims: claims,
                   notBefore: DateTime.UtcNow,
                   expires: DateTime.UtcNow.AddSeconds(60 * 60),
                   signingCredentials: new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256)
            );

                var jwtToken = new JwtSecurityTokenHandler().WriteToken(jwt);
                return Ok(new
                {
                    access_token = jwtToken,
                    expires = DateTime.UtcNow.AddSeconds(60 * 60),
                    role = model.Username
                });
            }
            return BadRequest(new { state = "invalid username or password" });
        }
    }
}
