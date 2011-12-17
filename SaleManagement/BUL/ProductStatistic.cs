using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.BUL
{
    public class ProductStatistic
    {
        public int ProductID { get; set; }

        public string ProductCode { get; set; }

        public string ProductName { get; set; }

        public string CategoryName { get; set; }

        public int Quantity { get; set; }

        public decimal Amount { get; set; }

        public string Description { get; set; }
    }
}
