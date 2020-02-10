using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Models;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;

namespace SocialMedia_Asp.Net_Project_.Controllers
{
    [Authorize]
    public class ManagementController : Controller
    {
        private readonly IUnitOfWork uow;
        private readonly UserManager<AppUser> userManager;

        public ManagementController(IUnitOfWork _uow, UserManager<AppUser> _userManager)
        {
            uow = _uow;
            userManager = _userManager;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> MainPage()
        {

            var posts = uow.Posts.GetAll();

            var currPost = new MainPostViewModel();
            currPost.Posts = new List<PostViewModel>();

            foreach (var post in posts)
            {
                currPost.Posts.Add(new PostViewModel()
                {
                    Id = post.Id,
                    Title = post.Title,
                    UserId = post.UserId,
                    ImageURL = post.ImageURL,
                    Description = post.Description,
                    Comments = uow.Comments.GetCommentsByPostId(post.Id)

                });
            }

            return View(currPost);

        }


        [HttpPost]
        public async Task<IActionResult> AddPost(MainPostViewModel mainPostVM, IFormFile file)
        {
            if (file != null)
            {
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\images", file.FileName);


                using (var fs = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(fs);
                    mainPostVM.Post.ImageURL = file.FileName;
                }

            }


            var user = await userManager.FindByNameAsync(User.Identity.Name);

            if (user != null)
            {

                Post currPost = new Post()
                {
                    Description = mainPostVM.Post.Description,
                    UserId = user.Id,
                    ImageURL = mainPostVM.Post.ImageURL,
                    Title = ""
                };

                uow.Posts.Add(currPost);
                uow.SaveChanges();
            }

            return RedirectToAction("MainPage", "Management");
        }
   
    
    

        [HttpGet]
        public async Task<IActionResult> FullPost(int postId)
        {
            var currPost = new PostViewModel();
            var clickedPost = uow.Posts.Find(i => i.Id == postId).FirstOrDefault();
            var clickedPostComments = uow.Comments.GetCommentsByPostId(postId);

            currPost.Comments = clickedPostComments;
            currPost.Description = clickedPost.Description;
            currPost.ImageURL = clickedPost.ImageURL;
            currPost.UserId = clickedPost.UserId;
            currPost.Title = "";

            return View(currPost);
        }
    }
}