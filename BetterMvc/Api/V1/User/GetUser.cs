using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace BetterMvc.Api.V1.User
{
    public class GetUser
    {
	[HttpGet]
	public GetUserViewModel Get()
        {
            return new GetUserViewModel();
        }
    }

    public class GetUserViewModel
    {
        public string Username { get; set; }
        public string ImageUrl { get; set; }

    }
}