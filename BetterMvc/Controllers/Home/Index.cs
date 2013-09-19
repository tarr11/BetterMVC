using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BetterMvc.Controllers.Home
{
    public partial class HomeController : ControllerBase
    {
        public ActionResult Index()
        {
            var result = svc.DoSomething(new Services.Master.DoSomethingRequest
            {
            });
            var vm = new IndexViewModel { };
            return View(vm);
        }
    }

    public class IndexViewModel
    {

    }
}