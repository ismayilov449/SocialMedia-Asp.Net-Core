using Microsoft.EntityFrameworkCore;
using SocialMedia_Asp.Net_Project_.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.DAL
{
    public class SocialMediaDbContext : DbContext
    {

        public SocialMediaDbContext(DbContextOptions<SocialMediaDbContext> options)
            : base(options)
        {

        }


        public DbSet<Post> Posts { get; set; }

        public DbSet<Comment> Comments { get; set; }

        public DbSet<Friends> Friends { get; set; }

    }
}
