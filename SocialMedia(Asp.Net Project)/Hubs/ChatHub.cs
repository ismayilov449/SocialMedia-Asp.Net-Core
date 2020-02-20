using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Hubs
{
    public class ChatHub : Hub
    {


        private readonly UserIdentityDbContext context;
        private readonly UserManager<AppUser> userManager;
        public static List<string> onlineUsers;
        public ChatHub(UserIdentityDbContext context, UserManager<AppUser> userManager)
        {
            this.context = context;
            this.userManager = userManager;
            onlineUsers = new List<string>();
        }

        public override async Task OnConnectedAsync()
        {
            var user = await userManager.FindByNameAsync(Context.User.Identity.Name);
            
            user.ConnectionId = Context.ConnectionId;
            user.IsOnline = true;
            onlineUsers.Add(user.UserName);

            await userManager.UpdateAsync(user);
            await base.OnConnectedAsync();
        }



        public override async Task OnDisconnectedAsync(Exception exception)
        {
            var user = await userManager.FindByNameAsync(Context.User.Identity.Name);
            user.IsOnline = false;
            await userManager.UpdateAsync(user);

            await base.OnDisconnectedAsync(exception);
        }


        public void SendMessage(string message, string user)
        {
            Clients.All.SendAsync("RecieveMessage", message);
        }
    }
}
