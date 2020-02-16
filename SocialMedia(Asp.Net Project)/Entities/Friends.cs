using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Entities
{
    public class Friends
    {
        public int Id { get; set; }
        public string UserId1 { get; set; }
        public string UserId2 { get; set; }

        public string Status { get; set; }


    }
}
