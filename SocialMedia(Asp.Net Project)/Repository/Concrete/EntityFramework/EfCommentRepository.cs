using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Repository.Concrete.EntityFramework
{
    public class EfCommentRepository : EfGenericRepository<Comment>,ICommentRepository
    {

        public EfCommentRepository(SocialMediaDbContext context)
            :base(context)
        {

        }

        public SocialMediaDbContext SocialMediaDbContext { get { return context as SocialMediaDbContext; } }

        public IEnumerable<Comment> GetCommentsByPostId(int postId)
        {
            var comments = new List<Comment>();

            foreach (var comment in context.Comments)
            {
                if(comment.PostId == postId)
                {
                    comments.Add(comment);
                }

            }

            return comments; 
        }
    }
}
