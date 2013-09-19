using BetterMvc.Services.Context;
using BetterMvc.Services.Master;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BetterMvc.Controllers
{
    public class ControllerBase : Controller
    {
        public MasterService svc { get; set; }
        public IContextService contextSvc { get; set; }

        public ControllerBase(MasterService service, IContextService context)
        {
            svc = service;
            contextSvc = context;
        }
    }
}