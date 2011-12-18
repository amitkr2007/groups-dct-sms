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

        public static List<ChiTietHoaDon> GetOrderDetails(string OrderID)
        {
            using (SaleEntities ctx = new SaleEntities())
            {
                var lst = from c in ctx.ChiTietHoaDons
                          where c.MaHoaDon == OrderID
                          select c;
                return lst.ToList();
            }
        }

        public static HoaDon GetInvoiceByID(string orderID)
        {
            using (SaleEntities ctx = new SaleEntities())
            {
                return ctx.HoaDons.SingleOrDefault(h => h.MaHoaDon == orderID);
            }
        }
    }
}
