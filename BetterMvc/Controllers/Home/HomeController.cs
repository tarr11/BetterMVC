using BetterMvc.Services.Context;
using BetterMvc.Services.Master;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BetterMvc.Controllers.Home
{
    public partial class HomeController : ControllerBase
    {
        public HomeController(MasterService service, IContextService contextService)
            : base(service, contextService)
        {

        }
    }
}
