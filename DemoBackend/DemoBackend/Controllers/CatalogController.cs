using DemoBackend.Database;
using DemoBackend.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogController : ControllerBase
    {
        private readonly DemoDbContext _context;

        public CatalogController(DemoDbContext context)
        {
            _context = context;
        }

        [Route("categories")]
        [HttpGet]
        public async Task<IActionResult> GetCategories()
        {
            var items = await _context.Categories.ToListAsync();
            return Ok(items);
        }



        [Route("products")]
        [HttpGet]
        public async Task<IActionResult> GetProducts()
        {
            var items = await _context.Products.ToListAsync();
            return Ok(items);
        }
        [Route("customers")]
        [HttpGet]
        public async Task<IActionResult> GetCustomers()
        {
            var items = await _context.Customers.ToListAsync();
            return Ok(items);
        }
        [Route("accounts")]
        [HttpGet]
        public async Task<IActionResult> GetAccounts()
        {
            var items = await _context.Accounts.ToListAsync();
            return Ok(items);
        }
        [Route("products-by-category/{id}")]
        [HttpGet]
        public async Task<IActionResult> GetProductsByCategory(int id)
        {
            var items = await _context.Products
                .Where(x => x.CategoryId == id)
                .ToListAsync();
            return Ok(items);
        }
        [Route("products-by-branche/{id}")]
        [HttpGet]
        public async Task<IActionResult> GetProductsByBranche(string id)
        {
          var items = await _context.Products
              .Where(x => x.BranchId == id)
              .ToListAsync();
          return Ok(items);
        }

        [Route("add-product")]
        [HttpPost]
        public async Task<IActionResult> AddProduct([FromBody] ProductAddModel model)
        {
            
            if (ModelState.IsValid)
            {
                var product = new Product()
                {
                    Avatar = model.Avatar,
                    CategoryId = model.CategoryId,
                    Description = model.Description,
                    InStocks = model.InStocks,
                    Price = model.Price,
                    ProductName = model.ProductName,
                    BranchId = model.BranchId

                };
                _context.Products.Add(product);
                await _context.SaveChangesAsync();
                return Ok(product);
            }
            return BadRequest(ModelState.Values);

        }
        [Route("add-customer")]
        [HttpPost]
        public async Task<IActionResult> AddCustomer([FromBody] CustomerAddModel model)
        {

            if (ModelState.IsValid)
            {
                var customer= new Customer()
                {
                    Avatar = model.Avatar,
                    CustomerName= model.CustomerName,
                    
                    Age = model.Age,
                    CustomerSex = model.CustomerSex

                };
                _context.Customers.Add(customer);
                await _context.SaveChangesAsync();
                return Ok(customer);
            }
            return BadRequest(ModelState.Values);

        }

        [Route("add-account")]
        [HttpPost]
        public async Task<IActionResult> AddAccount([FromBody] AccountAddModel model)
        {

            if (ModelState.IsValid)
            {
                var account = new Account()
                {
                    AccountName = model.AccountName,
                    AccountEmail = model.AccountEmail,
                    AccountPassword= model.AccountPassword,
                    

                };
                _context.Accounts.Add(account);
                await _context.SaveChangesAsync();
                return Ok(account);
            }
            return BadRequest(ModelState.Values);

        }

    }
}
