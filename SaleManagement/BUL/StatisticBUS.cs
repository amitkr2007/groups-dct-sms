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
            //var maxDate = (from ss in lst
            //               where ss.Date <= date && ss.ProductID == id
            //               select ss.Date).Max();
            //if (lst == null)
            //{
            //    return null;
            //}
            //var maxDate1 = from a in lstobj
            //                   where a.ProductID == id && a.Date <= date
                               //select a;
            //var lstDate = lstobj.Select(d => d.Date);

            //var maxDate = lstobj.Max(o => o.Date);
            //foreach (var item in lstDate)
            //{
            //    if (maxDate <= item)
            //    {
            //        maxDate = item;
            //    }
            //}
            //var obj = lst.SingleOrDefault(t => t.Date == maxDate && t.ProductID == id);
            //ProductStatistic ps = new ProductStatistic();
            //ps.ProductID = obj.ProductID;
            //ps.Quantity = obj.Quantity;
            //ProductDTO p = ProductDAO.GetProductByID(id);
            //ps.ProductCode = p.ProductCode;
            //ps.ProductName = p.ProductName;
            //ps.Description = p.Description;
            //result.Add(ps);
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
    }
}
