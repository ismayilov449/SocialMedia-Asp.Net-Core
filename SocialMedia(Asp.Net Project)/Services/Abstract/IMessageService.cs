using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace SocialMedia_Asp.Net_Project_.Services
{
    public interface IMessageService
    {
        void SendMessage(AppUser senderUser, AppUser recieverUser, string messageText);
        Message GetMessage(int id);
        List<MessageListViewModel> GetMessagesByCurrentUser(AppUser currentUser);
    }
}
