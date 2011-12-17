using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DAL
{
    public class DBSubmitState
    {
        public bool IsExist { get; set; }

        public bool IsCompleted { get; set; }

        public string ErrorMessage { get; set; }
    }
}
