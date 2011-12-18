using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;
using SaleManagement.DAL;

namespace SaleManagement.BUL
{
    public class StatisticBUS
    {
        public static List<ProductStatistic> StatisticStoredWithQuantityAndDate(List<ProductDTO> lstSelectedProducts, DateTime date)
        {
            List<ProductStatistic> result = new List<ProductStatistic>();
            List<StoredStatusDTO> lst = WarehouseDAO.GetAllSoredStatuses();
            foreach (ProductDTO item in lstSelectedProducts)
            {
                result.Add(StatisticBUS.CreateStatisticObj(item, lst, date));
            }
            return result;
        }

        private static ProductStatistic CreateStatisticObj(ProductDTO pDto, List<StoredStatusDTO> lst, DateTime date)
        {
            ProductStatistic ps = new ProductStatistic();
            ps.ProductID = pDto.ProductID;
            ps.Amount = 0; // tinh amount da ban duoc cua san pham
            ps.ProductCode = pDto.ProductCode;
            ps.ProductName = pDto.ProductName;
            ps.CategoryName = pDto.Category.CategoryName;
            ps.Description = pDto.Description;
            var lstDates = from ss in lst
                           where ss.Date <= date && ss.ProductID == pDto.ProductID
                           select ss.Date;
            if (lstDates != null && lstDates.Count() > 0)
            {
                var obj = lst.SingleOrDefault(t => t.Date == lstDates.Max() && t.ProductID == pDto.ProductID);
                ps.Quantity = obj != null ? obj.Quantity : 0;
            }
            else
            {
                ps.Quantity = 0;
            }
            return ps;
        }

        public static object GetProductSoldByPeriodTimeAndCategory(string categoryID, DateTime fromDate, DateTime toDate)
        {
            List<ChiTietHoaDon> lstct = OrderDAO.GetAllProductSoldByPeriodTime(fromDate, toDate);
            List<ProductDTO> lstProducts = ProductDAO.GetProductsByCategoryID(categoryID);
            var lstResult = from ct in lstct group ct by ct.ID into g
                             from kq in g
                             join pr in lstProducts on kq.ID equals pr.ProductID
                             select new {
                                 g.Key,
                                 pr.ProductCode,
                                 pr.ProductName,
                                 pr.Category.CategoryName,
                                 pr.Description,
                                 Quantity = g.Sum(p=>p.SoLuongBan),
                                 Amount= g.Sum(p=>p.GiaSanPham*p.SoLuongBan)
                             };
            return lstResult.Distinct().ToList();
        }
    }
}
