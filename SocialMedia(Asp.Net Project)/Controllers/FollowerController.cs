using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;

namespace SocialMedia_Asp.Net_Project_.Controllers
{
    [Authorize]
    public class FollowerController : Controller
    {
        private UserManager<AppUser> userManager;
        private IUnitOfWork uow;
        public FollowerController(UserManager<AppUser> _userManager, IUnitOfWork _uow)
        {
            userManager = _userManager;
            uow = _uow;
        }

        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public async Task<IActionResult> AddFriend(string userId)
        {
            var user = await userManager.FindByNameAsync(User.Identity.Name);
            var currentrequest = uow.Friends.Find(i => i.UserId1 == user.Id && i.UserId2 == userId).FirstOrDefault();


            if (userId != user.Id)
            {

                if (user != null)
                {
                    if (currentrequest != null && currentrequest.Status == "None")
                    {
                        currentrequest.Status = "Waiting";
                        uow.Friends.Edit(currentrequest);
                    }
                    else
                    {
                        var request = new Friends()
                        {
                            UserId1 = user.Id,
                            UserId2 = userId,
                            Status = "Waiting"
                        };

                        uow.Friends.Add(request);
                    }
                    uow.SaveChanges();

                }
            }

            return (RedirectToAction("UserProfile", "Account", new { id = userId }));
        }

        [HttpGet]
        public async Task<IActionResult> RemoveFriend(string userId)
        {
            var user = await userManager.FindByNameAsync(User.Identity.Name);
            var currentrequest = uow.Friends.Find(i => i.UserId1 == user.Id && i.UserId2 == userId).FirstOrDefault();
            var currentrequestreverse = uow.Friends.Find(i => i.UserId1 == userId && i.UserId2 == user.Id).FirstOrDefault();

            if (user != null)
            {
                if (currentrequest != null)
                {
                    uow.Friends.Delete(currentrequest);
                    
                }else if(currentrequestreverse != null)
                {
                    uow.Friends.Delete(currentrequestreverse);
                }
                uow.SaveChanges();
            }

            return (RedirectToAction("UserProfile", "Account", new { id = userId }));
        }

        [HttpGet]
        public async Task<IActionResult> CancelFriendRequest(string userId)
        {
            var user = await userManager.FindByNameAsync(User.Identity.Name);
            var currentrequest = uow.Friends.Find(i => i.UserId1 == user.Id && i.UserId2 == userId).FirstOrDefault();


            if (user != null && currentrequest != null)
            {
                if (currentrequest.Status == "Waiting")
                {
                    currentrequest.Status = "None";
                }
                uow.Friends.Edit(currentrequest);
                uow.SaveChanges();

            }

            return (RedirectToAction("UserProfile", "Account", new { id = userId }));
        }

        [HttpGet]
        public async Task<IActionResult> AcceptFriendRequest(string userId)
        {
            var user = await userManager.FindByNameAsync(User.Identity.Name);
            var currentrequest = uow.Friends.Find(i => i.UserId1 == userId && i.UserId2 == user.Id).FirstOrDefault();


            if (user != null && currentrequest != null)
            {
                if (currentrequest.Status == "Waiting")
                {
                    currentrequest.Status = "Accepted";
                }
                uow.Friends.Edit(currentrequest);
                uow.SaveChanges();

            }

            return (RedirectToAction("UserProfile", "Account", new { id = userId }));
        }

        [HttpGet]
        public async Task<IActionResult> RejectFriendRequest(string userId)
        {
            var user = await userManager.FindByNameAsync(User.Identity.Name);
            var currentrequest = uow.Friends.Find(i => i.UserId1 == userId && i.UserId2 == user.Id).FirstOrDefault();


            if (user != null && currentrequest != null)
            {
                if (currentrequest.Status == "Waiting")
                {
                    currentrequest.Status = "None";
                }
                uow.Friends.Edit(currentrequest);
                uow.SaveChanges();

            }

            return (RedirectToAction("UserProfile", "Account", new { id = userId }));
        }


    }
}