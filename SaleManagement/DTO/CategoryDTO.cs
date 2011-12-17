using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DTO
{
    public class CategoryDTO
    {
        public CategoryDTO()
        { 
        }

        public string CategoryID { get; set; }

        public string CategoryName { get; set; }

        public string Description { get; set; }

        public override string ToString()
        {
            return this.CategoryName;
        }
    }
}
