using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Entities
{
    public class AppUser : IdentityUser
    {
       
        [Required]
        public string Name { get; set; }

        [Required]
        public string Surname { get; set; }

        [Required]
        public int Age { get; set; }

        public string ImageURL { get; set; }

        public string ConnectionId { get; set; }
        
        public bool IsOnline { get; set; }
        

    }
}
