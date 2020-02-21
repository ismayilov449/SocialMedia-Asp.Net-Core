using System;
using System.Collections.Generic;
using System.Text;

namespace SocialMedia_Asp.Net_Project_.Models
{
    public class MessageListViewModel
    {
        public int Id { get; set; }
        public string MessageText { get; set; }
        public string UserId { get; set; }
        public DateTime MessageDate { get; set; }
        public bool OnlineStatus { get; set; }
        public string ImageUrl { get; set; }
        public string MessagerSenderName { get; set; }
    }
}
