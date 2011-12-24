using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;
using System.Data.Objects;

namespace SaleManagement.DAL
{
    public class ImportVoucherDAO
    {
        public List<HoaDon> GetListInvoice()
        {
            using (var data = new SaleEntities())
            {
                return data.HoaDons.ToList();
            }
        }

        public IList GetListInvoiceDetailByInvoiceID(string invoiceID)
        {
            using (var data = new SaleEntities())
            {
                List<LinhKien> productList = new List<LinhKien>();
                ProductDAO product = new ProductDAO();
                var invoiceDetailList = data.ChiTietHoaDons.Where(p => p.MaHoaDon.Equals(invoiceID)).ToList();
                var lstProduct = (from p in data.LinhKiens
                                 select p).ToList();
                var lstresult = from ct in invoiceDetailList
                                join k in lstProduct on ct.ID equals k.ID
                                select new
                                {
                                    k.ID,
                                    k.TenLinhKien,
                                    ct.GiaSanPham,
                                    ct.SoLuongBan,
                                    TT = ct.GiaSanPham * ct.SoLuongBan
                                };
                return lstresult.ToList();
            }
        }

        public static void InsertImportVoucher(PhieuNhap pn)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                ctx.AddToPhieuNhaps(pn);
                ctx.SaveChanges();
            }
            catch (OptimisticConcurrencyException)
            {
                ctx.Refresh(RefreshMode.ClientWins, ctx.LoaiLinhKiens);
                ctx.SaveChanges();
            }
            catch (UpdateException)
            {
                ctx.Refresh(RefreshMode.StoreWins, ctx.LoaiLinhKiens);
                throw new UpdateException("Saving Error");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
