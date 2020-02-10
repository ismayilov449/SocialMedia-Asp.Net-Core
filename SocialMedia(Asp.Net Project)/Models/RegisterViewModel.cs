using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Models
{
    public class RegisterViewModel
    {


        [Required]
        [StringLength(20)]
        [UIHint("Enter your name")]
        public string Name { get; set; }

        [Required]
        [StringLength(20)]
        [UIHint("Enter your surname")]
        public string Surname { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress]
        [UIHint("Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [UIHint("Password")]
        public string Password { get; set; }
        public string ImageUrl { get; set; }
         

    }
}
