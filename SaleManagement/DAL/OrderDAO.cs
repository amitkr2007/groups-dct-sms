using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DAL
{
    public class OrderDAO
    {
        public static List<ChiTietHoaDon> GetAllProductSoldByPeriodTime(DateTime fromDate, DateTime toDate)
        {
            SaleEntities ctx = new SaleEntities();
            var lst = from h in ctx.HoaDons
                      from ct in ctx.ChiTietHoaDons
                      where h.NgayGiao >= fromDate && h.NgayGiao <= toDate &&
                            h.MaHoaDon == ct.MaHoaDon
                      select ct;
            return lst.ToList();
        }        
    }
}
