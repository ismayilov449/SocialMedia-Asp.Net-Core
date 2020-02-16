using SocialMedia_Asp.Net_Project_.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Models
{
    public class UserFriendRequestViewModel
    {

        public AppUser CurrentUser { get; set; }

        public string RequestStatus { get; set; }

    }
}
