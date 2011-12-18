using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

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
                //foreach (var item in invoiceDetailList)
                //{
                //    productList.Add(product.GetProductById(item.ID));
                //}
                //var result = from pro in productList
                //             from invoi in invoiceDetailList
                //             select new { 
                //                 pro.TenLinhKien,
                //                 invoi.GiaSanPham,
                //                 invoi.SoLuongBan,
                //                 TT=invoi.GiaSanPham * invoi.SoLuongBan
                //             };
                ////return result.Distinct().ToList();
                //var lst = result.Distinct().ToList();
                return lstresult.ToList();
            }
        }
    }
}
