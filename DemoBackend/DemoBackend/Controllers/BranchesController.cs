using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DemoBackend.Database;

namespace DemoBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BranchesController : ControllerBase
    {
        private readonly DemoDbContext _context;

        public BranchesController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: api/Branches
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Branche>>> GetBranches()
        {
            return await _context.Branches.ToListAsync();
        }

        // GET: api/Branches/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Branche>> GetBranche(string id)
        {
            var branche = await _context.Branches.FindAsync(id);

            if (branche == null)
            {
                return NotFound();
            }

            return branche;
        }

        // PUT: api/Branches/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBranche(string branchId, Branche branche)
        {
            if (branchId != branche.BranchId)
            {
                return BadRequest();
            }

            _context.Entry(branche).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BrancheExists(branchId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Branches
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Branche>> PostBranche(Branche branche)
        {
            _context.Branches.Add(branche);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBranche", new { branchId = branche.BranchId }, branche);
        }

        // DELETE: api/Branches/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBranche(string branchId)
        {
            var branche = await _context.Branches.FindAsync(branchId);
            if (branche == null)
            {
                return NotFound();
            }

            _context.Branches.Remove(branche);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BrancheExists(string branchId)
        {
            return _context.Branches.Any(e => e.BranchId == branchId);
        }
    }
}
