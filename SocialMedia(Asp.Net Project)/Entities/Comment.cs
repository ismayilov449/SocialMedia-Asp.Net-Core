using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SocialMedia_Asp.Net_Project_.Entities
{
    public class Comment
    {

        public int Id { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public int PostId { get; set; }

        [Required]
        public string UserId { get; set; }

        public string UserFullName { get; set; }

        public string UserName { get; set; }

    }
}
