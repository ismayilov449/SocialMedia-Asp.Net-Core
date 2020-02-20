using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Entities
{
    public class Message
    {

        public int Id { get; set; }

        public string SenderUserId { get; set; }

        public AppUser SenderUser { get; set; }

        public string RecieverUserId { get; set; }

        public AppUser RecieverUser { get; set; }

        public DateTime MessageDate { get; set; }

        public string MessageText { get; set; }

    }
}
