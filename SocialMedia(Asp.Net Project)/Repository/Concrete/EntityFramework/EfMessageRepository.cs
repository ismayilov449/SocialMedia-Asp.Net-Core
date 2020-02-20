using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Repository.Concrete.EntityFramework
{
    public class EfMessageRepository : EfGenericRepository<Message>,IMessageRepository
    {

        public EfMessageRepository(SocialMediaDbContext context)
          : base(context)
        {

        }

        public SocialMediaDbContext SocialMediaDbContext { get { return context as SocialMediaDbContext; } }

    }
}
