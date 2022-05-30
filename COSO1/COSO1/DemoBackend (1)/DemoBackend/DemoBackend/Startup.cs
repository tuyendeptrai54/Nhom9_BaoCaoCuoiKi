﻿using DemoBackend.Database;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoBackend
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "DemoBackend", Version = "v1" });
            });

            //config db
            services.AddDbContext<DemoDbContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("Default"));
            });
            // cấu hình CORS
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder =>
                {
                    builder.SetIsOriginAllowed(host => true);
                    builder.AllowAnyHeader(); //x-header
                    builder.AllowAnyMethod(); //post, get, put, delete
                    builder.AllowCredentials();
                });
            });
            //Cấu hình authentication
            JwtSecurityTokenHandler.DefaultInboundClaimTypeMap.Remove("sub");
            string secret = "g2sL6RLQh6dVRSSnCRjvEqP971-V2DGpFoUleIfKrIc";
            string iss = "dcaea177e8d14f1fb863059dde75ca3b";
            string audience = "Demo Backend";
            var signingKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secret));
           var tokenValidationParameters = new TokenValidationParameters()
           {
               ValidateIssuerSigningKey = true,
               IssuerSigningKey = signingKey,
               ValidateIssuer = true,
               ValidIssuer = iss,
               ValidateAudience = true,
               ValidAudience = audience,
               ValidateLifetime = true,
               ClockSkew = TimeSpan.Zero,
               RequireExpirationTime = true,
           };
           services.AddAuthentication("AuthKey")
.AddJwtBearer("AuthKey", x =>
{
x.TokenValidationParameters = tokenValidationParameters;
x.SaveToken = true;
x.RequireHttpsMetadata = false;
});



            //end
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "DemoBackend v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();
            // Authen là xác thực
            app.UseAuthentication();
             // Author là phân quyền
            app.UseAuthorization();
            app.UseCors("CorsPolicy");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}