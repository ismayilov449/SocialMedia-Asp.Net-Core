using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.ViewComponents
{
    public class MessageInboxViewComponent : ViewComponent
    {
        private readonly IMessageService service;
        private readonly UserManager<AppUser> userManager;

        public MessageInboxViewComponent(
            IMessageService service,
            UserManager<AppUser> userManager
            )
        {
            this.service = service;
            this.userManager = userManager;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var user = await userManager.FindByNameAsync(User.Identity.Name);

            var entity = service.GetMessagesByCurrentUser(user).ToList();

            var lastMessage = entity.OrderByDescending(i => i.MessageDate).Select(i => i.MessageText).FirstOrDefault();

            ViewBag.Last = lastMessage;

            var data = service.GetMessagesByCurrentUser(user).OrderBy(i => i.MessageDate).Select(i => i.MessageDate).FirstOrDefault();

            ViewBag.Date = data.ToString("MMMM dd");

            ViewBag.Active = RouteData.Values["userId"].ToString();
            return View(entity);
        }
    }
}
