
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DTO
{
    public class OrderDTO
    {
        public string OrderID { get; set; }

        public string CustomerID { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime ShipedDate { get; set; }

        public int ToalAmount 
        {
            get
            {
                return this.ProductsOnOrder.Sum(p => p.Price);
            }
        }

        public string ShipedAddress { get; set; }

        public bool State { get; set; }

        public string Description { get; set; }

        public List<ProductDTO> ProductsOnOrder { get; set; }
    }
}
