using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Models;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;

namespace SocialMedia_Asp.Net_Project_.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IUnitOfWork uow;
        public HomeController(IUnitOfWork _uow)
        {
            uow = _uow;
        }

        public IActionResult Index()
        {

            var posts = uow.Posts.GetAll();

            var currPost = new List<PostViewModel>();

            foreach (var post in posts)
            {
                currPost.Add(new PostViewModel()
                {
                    Id = post.Id,
                    Title = post.Title,
                    UserId = post.UserId,
                    ImageURL = post.ImageURL,
                    Description = post.Description,
                    Comments = uow.Comments.GetCommentsByPostId(post.Id)

                }) ;
            }
           

            return View(currPost);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
