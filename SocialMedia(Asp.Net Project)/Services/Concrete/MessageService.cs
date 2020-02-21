using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using SocialMedia_Asp.Net_Project_.DAL;
using SocialMedia_Asp.Net_Project_.Entities;
using SocialMedia_Asp.Net_Project_.Extensions;
using SocialMedia_Asp.Net_Project_.Models;
using SocialMedia_Asp.Net_Project_.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SocialMedia_Asp.Net_Project_.Services.Concrete
{
    public class MessageService : IMessageService
    {
        private readonly IUnitOfWork uow;
        private readonly UserManager<AppUser> userManager;
        private readonly SocialMediaDbContext context;

        public MessageService(IUnitOfWork uow, UserManager<AppUser> userManager, SocialMediaDbContext context)
        {
            this.uow = uow;
            this.userManager = userManager;
            this.context = context;
        }

        public Message GetMessage(int id)
        {
            var message = uow.Messages.Get(id);

            return message;
        }

        public List<MessageListViewModel> GetMessagesByCurrentUser(AppUser currentUser)
        {
            var messagesByCurrentUser1 = uow.Messages.GetAll()
                .Include(i => i.RecieverUser)
                .Include(i => i.SenderUser)
                .Where(i => i.RecieverUserId == currentUser.Id || i.SenderUserId == currentUser.Id)
                .Select(i => new MessageListViewModel
                {

                    UserId = i.RecieverUserId == currentUser.Id ? i.SenderUserId : i.RecieverUserId,
                    MessagerSenderName = i.RecieverUser.UserName == currentUser.UserName ? i.SenderUser.UserName : i.RecieverUser.UserName,
                    MessageText = i.MessageText,
                    OnlineStatus = i.RecieverUser.UserName == currentUser.UserName ? i.SenderUser.IsOnline : i.RecieverUser.IsOnline,
                    MessageDate = i.MessageDate,
                    ImageUrl = i.RecieverUser.UserName == currentUser.UserName ? i.SenderUser.ImageURL : i.RecieverUser.ImageURL
                })
                .OrderBy(i => i.MessageDate)
               
                .ToList();

            var messagesByCurrentUser = messagesByCurrentUser1.DistinctBy(i => i.MessagerSenderName);


            return messagesByCurrentUser.ToList();
        }

        public void SendMessage(AppUser senderUser, AppUser recieverUser, string messageText)
        {
            Message m = new Message();
            var tempRecieverUser = uow.Messages.GetAll()
                .Include(i => i.SenderUser)
                .Include(i => i.RecieverUser)
                .Any(i => i.RecieverUserId == recieverUser.Id || i.SenderUserId == recieverUser.Id);

            var tempSenderUser = uow.Messages.GetAll()
               .Include(i => i.SenderUser)
               .Include(i => i.RecieverUser)
               .Any(i => i.RecieverUserId == senderUser.Id || i.SenderUserId == senderUser.Id);


            if (tempRecieverUser == true && tempSenderUser == true)
            {
                m.RecieverUserId = recieverUser.Id;
                m.SenderUserId = senderUser.Id;
                m.MessageText = messageText;
                m.MessageDate = DateTime.Now;
            }

            if (tempSenderUser == true && tempRecieverUser == false)
            {
                m.RecieverUser = recieverUser;
                m.RecieverUserId = recieverUser.Id;
                m.SenderUserId = senderUser.Id;
                m.MessageText = messageText;
                m.MessageDate = DateTime.Now;
            }

            if (tempSenderUser == false && tempRecieverUser == true)
            {
                m.SenderUser = senderUser;
                m.RecieverUserId = recieverUser.Id;
                m.SenderUserId = senderUser.Id;
                m.MessageText = messageText;
                m.MessageDate = DateTime.Now;
            }

            if (tempSenderUser == false && tempRecieverUser == false)
            {
                m.SenderUser = senderUser;
                m.RecieverUser = recieverUser;
                m.RecieverUserId = recieverUser.Id;
                m.SenderUserId = senderUser.Id;
                m.MessageText = messageText;
                m.MessageDate = DateTime.Now;
            }

            //Message m = new Message()
            //{
            //    RecieverUserId = recieverUser.Id,
            //    SenderUserId = senderUser.Id,
            //    MessageText = messageText,
            //    MessageDate = DateTime.Now
            //};

            uow.Messages.Add(m);
            uow.SaveChanges();
        }


    }
}
