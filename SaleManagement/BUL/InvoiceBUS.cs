using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DAL;

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

        public object GetInvoidDetailByInviceID(string invoiceID)
        {
            return new ImportVoucherDAO().GetListInvoiceDetailByInvoiceID(invoiceID);
        }

        public KhachHang GetCustomerByID(string cusID)
        {
            return new CustomerDAO().GetByID(cusID);
        }
    }
}
