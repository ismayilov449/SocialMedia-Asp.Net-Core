using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;
using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Hubs;
using SocialMedia_Asp.Net_Project_.Models;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;
using SocialMedia_Asp.Net_Project_.Repository.Concrete.EntityFramework;
using SocialMedia_Asp.Net_Project_.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Controllers
{
    [Authorize]
    public class MessageController : Controller
    {
        private readonly UserManager<AppUser> userManager;
        private readonly IMessageService messageService;
        private readonly IMessageRepository messageRepository;
        private readonly IHubContext<ChatHub> hubContext;

        public MessageController(
            UserManager<AppUser> userManager,
            IMessageService messageService,
            IMessageRepository messageRepository,
            IHubContext<ChatHub> hubContext
            )
        {
            this.userManager = userManager;
            this.messageService = messageService;
            this.messageRepository = messageRepository;
            this.hubContext = hubContext;
        }

        [HttpGet("/message/{userId}")]
        public async Task<IActionResult> SendMessage(string userId)
        {
            var user = await userManager.GetUserAsync(User);
            var recieverUser = await userManager.FindByIdAsync(userId);
            ViewBag.UserId = userId;
            var messagesByUser = messageRepository.GetAll().Include(i => i.SenderUser)
                .Include(i => i.RecieverUser)
                .Where(i => (i.SenderUserId == user.Id && i.RecieverUserId == userId) || (i.SenderUserId == userId && i.RecieverUserId == user.Id))
                .OrderBy(i => i.MessageDate)
                .ToList();

            SendMessageViewModel vm = new SendMessageViewModel
            {
                Messages = messagesByUser
            };

            return View(vm);
        }

        [HttpPost]

        public async Task<IActionResult> Send(SendMessageViewModel vm, string recieverId)
        {
            var currentUser = await userManager.GetUserAsync(User);
            var recieverUser = await userManager.FindByIdAsync(recieverId);

            if (ModelState.IsValid)
            {

                messageService.SendMessage(currentUser, recieverUser, vm.Message.MessageText);
                await hubContext.Clients.Client(recieverUser.ConnectionId).SendAsync("RecieveMessage", vm.Message.MessageText);

                return RedirectToAction("SendMessage", new { userId = recieverId });
            }
            return RedirectToAction("Message", "SendMessage", new { userId = recieverId });

        }

    }
}
