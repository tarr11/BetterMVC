using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BetterMvc.Services.Master
{
    /// <summary>
    /// The Master Service
    /// Controllers should only have to call this service, and nothing else
    /// There should only be one service call per controller
    /// </summary>
    public partial interface IMasterService
    {

    }

    public partial class MasterService : IMasterService
    {

    }
}