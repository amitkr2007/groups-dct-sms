using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DTO
{
    public class ImportVoucherDTO
    {
        public string VoucherID { get; set; }

        public DateTime CreatedDate { get; set; }

        public string Description { get; set; }

        public List<ProductDTO> ProductsOnImpVoucher { get; set; }
    }
}
