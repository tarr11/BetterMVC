using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BetterMvc.Services.Context
{
    public partial interface IContextService
    {
        bool IsLoggedIn();
    }

    public partial class ContextService : IContextService
    {
        public bool IsLoggedIn()
        {
            return this.httpContext.Request.IsAuthenticated;
        }
    }
}