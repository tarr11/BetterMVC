using BetterMvc.Services.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BetterMvc.Services.Context
{
    /// <summary>
    /// Anything that needs to touch HttpContext goes here
    /// Never call HttpContext methods directly from your controller
    /// </summary>
    public partial interface IContextService
    {

    }

    public partial class ContextService : IContextService
    {
        HttpContextBase httpContext;
        public ContextService(HttpContextBase context)
        {
            this.httpContext = context;
        }
    }
}