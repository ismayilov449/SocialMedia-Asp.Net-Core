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

namespace SocialMedia_Asp.Net_Project_.Controllers
{
    [AllowAnonymous]
    public class AccountController : Controller
    {

        private UserManager<AppUser> userManager;
        private SignInManager<AppUser> signInManager;

        public AccountController(SignInManager<AppUser> signInManager, UserManager<AppUser> userManager)
        {
            this.signInManager = signInManager;
            this.userManager = userManager;
        }


        public IActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel loginVM)
        {

            if (ModelState.IsValid)
            {
                var user = await userManager.FindByEmailAsync(loginVM.Email);

                if (user != null)
                {
                    await signInManager.SignOutAsync();

                    var result = await signInManager.PasswordSignInAsync(user, loginVM.Password, true, false);

                    if (result.Succeeded)
                    {
                        return RedirectToAction("MainPage", "Management");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Email or Password is incorrect!");

                    }
                }
            }
            return View(loginVM);
        }


        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel registerVM, IFormFile file)
        {

            if (file != null)
            {
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\userimg", file.FileName);


                using (var fs = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(fs);
                    registerVM.ImageUrl = file.FileName;
                }

            }

            if (ModelState.IsValid)
            {

                AppUser appUser = new AppUser
                {
                    Name = registerVM.Name,
                    Surname = registerVM.Surname,
                    Email = registerVM.Email,
                    ImageURL = registerVM.ImageUrl
                };
                var rand = new Random();
                var username = appUser.Name.Substring(0, 3) + "_" + appUser.Surname.Substring(1, 4) + rand.Next(1, 100);

                appUser.UserName = username.ToLower();
                var result = await userManager.CreateAsync(appUser, registerVM.Password);

                if (result.Succeeded)
                {
                    return RedirectToAction("MainPage", "Management");
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                }


            }

            return View(registerVM);
        }

        [HttpGet]
        public async Task<IActionResult> Profile()
        {

            if (User.Identity.IsAuthenticated)
            {
                var user = await userManager.FindByNameAsync(User.Identity.Name);
                ViewBag.UserId = user.Id;

                return PartialView(user);
                 
            }
            return NotFound();

        }

        [HttpGet]
        public async Task<IActionResult> UserProfile(string id)
        {
            var user = await userManager.FindByIdAsync(id);

            return View(user);
        }

        [HttpGet]
        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return RedirectToAction("Login", "Account");
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}