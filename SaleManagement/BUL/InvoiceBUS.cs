using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DAL;
using System.Collections;

namespace SaleManagement.BUL
{
    public class InvoiceBUS
    {
        public List<KhachHang> AutoLoadCustomer()
        {
            var cus = new CustomerDAO();
            return cus.GetAll();
        }

        public List<HoaDon> GetListInvoice()
        {
            return new ImportVoucherDAO().GetListInvoice();
        }

        public IList GetInvoidDetailByInviceID(string invoiceID)
        {
            return new ImportVoucherDAO().GetListInvoiceDetailByInvoiceID(invoiceID);
        }

        public KhachHang GetCustomerByID(string cusID)
        {
            return new CustomerDAO().GetByID(cusID);
        }

        public static List<ProductOnOrder> GetProductsOnOrder(string orderID)
        {
            var lstOrderDetails = OrderDAO.GetOrderDetails(orderID);
            var lstProducts = ProductDAO.GetAllProductEntity();
            var lstresult = from ct in lstOrderDetails
                            join k in lstProducts on ct.ID equals k.ID
                            select new ProductOnOrder()
                            {
                                ProductID = k.ID,
                                ProductName = k.TenLinhKien,
                                Price = (int)ct.GiaSanPham,
                                Quantity = (int)ct.SoLuongBan,
                                Amount = (int)(ct.GiaSanPham * ct.SoLuongBan)
                            };
            return lstresult.ToList();
        }

        public static void CheckOutInvoice(string orderID)
        {
            HoaDon ord = OrderDAO.GetInvoiceByID(orderID);
            var lstdt = OrderDAO.GetOrderDetails(orderID);
            foreach (var item in lstdt)
	        {
                int oldQuantity = InvoiceBUS.GetQuantityInWarehouse(item.ID);
                int newQuantity = oldQuantity - (int)item.SoLuongBan;
                WarehouseDAO.InsertSoredStatus((DateTime)ord.NgayGiao, item.ID, newQuantity);
	        }
            OrderDAO.CheckOutOrder(orderID, true);
        }

        public static int GetQuantityInWarehouse(int productID)
        {
            var lst = WarehouseDAO.GetAllLinhKienTons();
            var check = lst.Where(t => t.ID == productID);
            if (check == null || check.Count() <= 0) return 0;
            var maxDate = (from tt in lst
                           where tt.ID == productID
                           select tt.Ngay).Max();
            var objt = lst.Where(t => t.Ngay == maxDate && t.ID == productID);
            if (objt == null)
            {
                return 0;
            }
            else
            {
                return (int)objt.Last().SoLuongTon;
            }
        }

        public static int CheckEnoughQuantity(int productID, int quantity)
        {
            int slton = InvoiceBUS.GetQuantityInWarehouse(productID);
            return slton < quantity ? slton : 0;
        }

        public static void InsertImportVoucher(ImportVoucher saveObj)
        {
            try
            {
                PhieuNhap pn = new PhieuNhap();
                pn.MaPhieuNhap = saveObj.VoucherID;
                pn.NgayLap = saveObj.CreatedDate;
                pn.GhiChu = saveObj.Description;
                pn.ChiTietPhieuNhaps = new System.Data.Objects.DataClasses.EntityCollection<ChiTietPhieuNhap>();
                foreach (var item in saveObj.lstDetails)
                {
                    ChiTietPhieuNhap ctpn = new ChiTietPhieuNhap();
                    ctpn.MaPhieuNhap = saveObj.VoucherID;
                    ctpn.ID = item.ProductID;
                    ctpn.SoLuongNhap = item.Quantity;
                    ctpn.GiaNhap = item.Price;
                    pn.ChiTietPhieuNhaps.Add(ctpn);
                }
                ImportVoucherDAO.InsertImportVoucher(pn);

                foreach (var item in saveObj.lstDetails)
                {
                    int oldQuantity = InvoiceBUS.GetQuantityInWarehouse(item.ProductID);
                    int newQuantity = oldQuantity + item.Quantity;
                    WarehouseDAO.InsertSoredStatus(saveObj.CreatedDate, item.ProductID, newQuantity);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
