using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;

namespace SaleManagement.DAL
{
    public class WarehouseDAO
    {
        public static List<StoredStatusDTO> GetAllSoredStatuses()
        {
            SaleEntities ctx = new SaleEntities();
            var lst = from t in ctx.LinhKienTons
                      select t;
            List<StoredStatusDTO> result = new List<StoredStatusDTO>();
            foreach (var item in lst)
            {
                StoredStatusDTO s = new StoredStatusDTO();
                s.StoredStatusID = item.idTon;
                s.ProductID = (int)item.ID;
                s.Date = item.Ngay;
                s.Quantity = (int)item.SoLuongTon;
                result.Add(s);
            }
            return result;
        }
    }
}
