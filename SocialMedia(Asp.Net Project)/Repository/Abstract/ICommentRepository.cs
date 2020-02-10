using SocialMedia_Asp.Net_Project_.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Repository.Abstract
{
    public interface ICommentRepository : IGenericRepository<Comment>
    {

        IEnumerable<Comment> GetCommentsByPostId(int postId);

    }
}
