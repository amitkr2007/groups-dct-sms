using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;
using SaleManagement.DAL;

namespace SaleManagement.BUL
{
    public class SearchingBUS
    {
        public static List<CategoryDTO> SearchCategoriesByKey(string key)
        {
            List<CategoryDTO> lst = CategoryDAO.GetAllCategories();
            var lstResult = from c in lst
                            where c.CategoryName.Contains(key) || c.Description.Contains(key) || c.CategoryID.Contains(key)
                            select c;
            return lstResult.ToList();
        }

        public static List<ProductDTO> SearchProducts(string key)
        {
            List<ProductDTO> lst = ProductDAO.GetAllProducts();
            var lstResult = lst.Where(p => p.ProductCode.Contains(key) || p.ProductName.Contains(key) || p.Description.Contains(key));
            return lst.ToList();
        }
    }
}
