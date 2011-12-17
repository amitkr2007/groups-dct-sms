using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SaleManagement.DAL
{
    public class CustomerDAO
    {
        public List<KhachHang> GetAll()
        {
            using (var data = new SaleEntities())
            {
                return data.KhachHangs.ToList();
            }
        }

        public KhachHang GetByID(string cusID)
        {
            using (var data = new SaleEntities())
            {
                return data.KhachHangs.First(p=>p.MaKH.Equals(cusID));
            }
        }
    }
}
