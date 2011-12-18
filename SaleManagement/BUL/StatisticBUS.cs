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
                //var obj = lst.SingleOrDefault(t => t.Date == lstDates.Max() && t.ProductID == pDto.ProductID);
                var lstTemp = lst.Where(t => t.Date == lstDates.Max() && t.ProductID == pDto.ProductID);
                var obj = lstTemp == null ? null : lstTemp.First();
                ps.Quantity = obj != null ? obj.Quantity : 0;
            }
            else
            {
                ps.Quantity = 0;
            }
            return ps;
        }

        public static List<ProductStatistic> GetProductSoldByPeriodTimeAndCategory(string categoryID, DateTime fromDate, DateTime toDate)
        {
            List<ChiTietHoaDon> lstct = OrderDAO.GetAllProductSoldByPeriodTime(fromDate, toDate);
            List<ProductDTO> lstProducts = new List<ProductDTO>();
            if (categoryID == "All")
            {
                lstProducts = ProductDAO.GetAllProducts();
            }
            else
            {
                lstProducts = ProductDAO.GetProductsByCategoryID(categoryID);
            }
            var lstResult = from ct in lstct
                            group ct by ct.ID into g
                            from kq in g
                            join pr in lstProducts on kq.ID equals pr.ProductID
                            select new
                            {
                                g.Key,
                                pr.ProductCode,
                                pr.ProductName,
                                pr.Category.CategoryName,
                                pr.Description,
                                Quantity = g.Sum(p => p.SoLuongBan),
                                Amount = g.Sum(p => p.GiaSanPham * p.SoLuongBan)
                            };
            var result = from r in lstResult.Distinct().ToList()
                         select new ProductStatistic()
                         {
                             ProductID = r.Key,
                             ProductCode=r.ProductCode,
                             ProductName=r.ProductName,
                             CategoryName=r.CategoryName,
                             Description=r.Description,
                             Amount=(int)r.Amount,
                             Quantity=(int)r.Quantity
                         };
            return result.ToList();
        }

        public static List<ProductStatistic> StatisticByQuantitySoldAndPeriodTime(DateTime fromDate, DateTime toDate, int minSold, int maxSold)
        {
            List<ChiTietHoaDon> lstct = OrderDAO.GetAllProductSoldByPeriodTime(fromDate, toDate);
            List<ProductDTO> lstProducts = ProductDAO.GetAllProducts();
            var lstResult = from ct in lstct
                            group ct by ct.ID into g
                            from kq in g
                            join pr in lstProducts on kq.ID equals pr.ProductID
                            select new
                            {
                                g.Key,
                                pr.ProductCode,
                                pr.ProductName,
                                pr.Category.CategoryName,
                                pr.Description,
                                Quantity = g.Sum(p => p.SoLuongBan),
                                Amount = g.Sum(p => p.GiaSanPham * p.SoLuongBan)
                            };
            var result = from r in lstResult.Distinct().ToList()
                         where r.Quantity >= minSold && r.Quantity <= maxSold
                         select new ProductStatistic()
                         {
                             ProductID = r.Key,
                             ProductCode = r.ProductCode,
                             ProductName = r.ProductName,
                             CategoryName = r.CategoryName,
                             Description = r.Description,
                             Amount = (int)r.Amount,
                             Quantity = (int)r.Quantity
                         };
            return result.ToList();
        }
    }
}
