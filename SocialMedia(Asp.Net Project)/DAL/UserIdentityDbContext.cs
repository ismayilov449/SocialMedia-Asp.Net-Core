using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SocialMedia_Asp.Net_Project_.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.DAL
{
    public class UserIdentityDbContext : IdentityDbContext<AppUser>
    {

        public UserIdentityDbContext(DbContextOptions<UserIdentityDbContext> options)
            : base(options)
        {

        }
         
      
    }
}
