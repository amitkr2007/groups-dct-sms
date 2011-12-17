using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DTO
{
    public class StoredStatusDTO
    {
        public StoredStatusDTO()
        { 
        }

        public int StoredStatusID { get; set; }

        public DateTime Date { get; set; }

        public int ProductID { get; set; }

        public int Quantity { get; set; }
    }
}
