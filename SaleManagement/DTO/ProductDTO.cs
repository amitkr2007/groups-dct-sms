using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DTO
{
    public class ProductDTO
    {
        //public bool Selected { get; set; }

        public int ProductID { get; set; }

        public CategoryDTO Category { get; set; }

        public string ProductName { get; set; }

        public string ProductCode { get; set; }

        public int Price { get; set; }

        public byte[] Image { get; set; }

        public bool IsNew { get; set; }

        public string Description { get; set; }
    }
}
