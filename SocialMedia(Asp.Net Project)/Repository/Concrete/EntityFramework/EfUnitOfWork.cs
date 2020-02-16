using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Repository.Concrete.EntityFramework
{
    public class EfUnitOfWork : IUnitOfWork
    {

        private readonly SocialMediaDbContext context;

        public EfUnitOfWork(SocialMediaDbContext _context)
        {
            context = _context ?? throw new ArgumentNullException("DbContext can not be null");
        }


        private IPostRepository _posts;

        private ICommentRepository _comments;

        private IFriendsRepository _friends;





        public IPostRepository Posts
        {
            get
            {
                return _posts ?? (_posts = new EfPostRepository(context));
            }
        }

        public ICommentRepository Comments
        {
            get
            {
                return _comments ?? (_comments = new EfCommentRepository(context));
            }
        }

        public IFriendsRepository Friends
        {
            get
            {
                return _friends ?? (_friends = new EfFriendsRepository(context));
            }
        }


        public int SaveChanges()
        {
            try
            {
                return context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }

        }

        public void Dispose()
        {
            context.Dispose();

        }
    }
}
