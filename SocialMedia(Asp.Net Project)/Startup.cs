using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Internal;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Entities;
 
using SocialMedia_Asp.Net_Project_.Repository.Abstract;
using SocialMedia_Asp.Net_Project_.Repository.Concrete.EntityFramework;
using SocialMedia_Asp.Net_Project_.Hubs;

namespace SocialMedia_Asp.Net_Project_
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
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });


            services.AddDbContext<UserIdentityDbContext>(options =>
         options.UseSqlServer("Data Source=ADMINISTRATOR\\SQLEXPRESS;Database=SocialMediaUsers;Trusted_Connection=True"));

            services.AddDbContext<SocialMediaDbContext>(options =>
         options.UseSqlServer("Data Source=ADMINISTRATOR\\SQLEXPRESS;Database = SocaialMediaDB;Integrated Security=True"));


            services.AddTransient<IPostRepository, EfPostRepository>();
            services.AddTransient<ICommentRepository, EfCommentRepository>();
            services.AddTransient<IUnitOfWork, EfUnitOfWork>();

            services.AddSignalR();

            services.AddIdentity<AppUser, IdentityRole>(options =>
            {
                 
                options.User.RequireUniqueEmail = true;
                options.Password.RequiredLength = 6;
                options.Password.RequireLowercase = false;
                options.Password.RequireUppercase = false;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireDigit = false;



            })
                       .AddEntityFrameworkStores<UserIdentityDbContext>()
                       .AddDefaultTokenProviders();

            services.AddAuthentication();

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseCookiePolicy();
            app.UseAuthentication();

            app.UseSignalR(routes =>
            {
                routes.MapHub<ChatHub>("/chatHub");
            });

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });


           
        }
    }
}
