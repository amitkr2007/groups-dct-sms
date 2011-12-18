using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Objects;

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

        public static void CheckOutOrder(string orderID, bool status)
        {
            using (SaleEntities ctx = new SaleEntities())
            {
                try
                {
                    HoaDon a = ctx.HoaDons.SingleOrDefault(c => c.MaHoaDon == orderID);
                    if (a != null)
                    {
                        a.TrangThai = status;
                        ctx.SaveChanges();
                    }
                    else
                    {
                        throw new ArgumentNullException("Không thể cập nhật đối tượng = null");
                    }
                }
                catch (OptimisticConcurrencyException)
                {
                    ctx.Refresh(RefreshMode.ClientWins, ctx.LoaiLinhKiens);
                    ctx.SaveChanges();
                }
                catch (UpdateException)
                {
                    ctx.Refresh(RefreshMode.StoreWins, ctx.LoaiLinhKiens);
                    throw new UpdateException("Updating Error");
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
