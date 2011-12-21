using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.API
{
    public interface IProduct
    {
        List<LinhKienNhap> ProductListNhap { get; set; }
    }
}
