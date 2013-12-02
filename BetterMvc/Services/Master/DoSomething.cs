using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BetterMvc.Services.Master
{
    public partial interface IMasterService
    {
        DoSomethingResult DoSomething(DoSomethingRequest request);
    }

    public partial class MasterService : IMasterService
    {
        public DoSomethingResult DoSomething(DoSomethingRequest request)
        {
            return new DoSomethingResult { SomeData = "foo" };
        }
    }

    public class DoSomethingResult : Result
    {
        public string SomeData { get; set; }

    }

    public class DoSomethingRequest : Request
    {
        public int Id { get; set; }

    }
}