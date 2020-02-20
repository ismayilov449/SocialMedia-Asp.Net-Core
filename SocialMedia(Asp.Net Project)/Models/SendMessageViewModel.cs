using SocialMedia_Asp.Net_Project_.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Models
{
    public class SendMessageViewModel
    {

        public List<Message> Messages { get; set; }
        public Message Message { get; set; }

    }
}
