using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Hubs
{
    public class ChatHub : Hub
    {
        //public async Task Send(string name, string message)
        //{
        //    // Call the broadcastMessage method to update clients.
        //    await Clients.All.SendAsync("broadcastMessage", name, message);
        //}

        public async Task SendSelectedUser(string forwardedUserId,string message)
        {
            await Clients.Client(forwardedUserId).SendAsync("Send",message);
        }
    }
}
