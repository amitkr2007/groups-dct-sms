using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.BUL
{
    public class ProductOnOrder
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public int Amount { get; set; }
    }
}
