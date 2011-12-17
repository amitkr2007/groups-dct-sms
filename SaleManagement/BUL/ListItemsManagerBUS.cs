using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DAL;
using SaleManagement.DTO;

namespace SaleManagement.BUL
{
    public class ListItemsManagerBUS
    {
        #region Category
        public static void InsertNewCategory(CategoryDTO cDto)
        {
            try
            {
                CategoryDAO.InsertNewCategory(cDto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<CategoryDTO> GetAllCategories()
        {
            try
            {
                return CategoryDAO.GetAllCategories();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void DeleteCategory(string ID)
        {
            try
            {
                CategoryDAO.DeleteCategory(ID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void UpdateCategory(CategoryDTO cateDTO)
        {
            try
            {
                CategoryDAO.UpdateCategory(cateDTO);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool CheckExistCategoryID(string id)
        {
            try
            {
                List<CategoryDTO> lst = CategoryDAO.GetAllCategories();
                var a = lst.Where(c => c.CategoryID == id);
                return (a == null || a.Count() == 0) ? false : true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Product

        public static List<ProductDTO> GetAllProducts()
        {
            try
            {
                return ProductDAO.GetAllProducts();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static ProductDTO GetProductByID(int id)
        {
            try
            {
                return ProductDAO.GetProductByID(id);
            }
            catch (Exception ex)
            {                
                throw ex;
            }
        }

        public static void InsertNewProduct(ProductDTO objDto)
        {
            try 
	        {
                ProductDAO.InsertNewProduct(objDto);
	        }
	        catch (Exception ex)
	        {
		        throw ex;
	        }
        }

        public static void UpdateProduct(ProductDTO objDto)
        {
            try
            {
                ProductDAO.UpdateProduct(objDto);
            }
            catch (Exception ex)
            {                
                throw ex;
            }
        }

        public static void DeleteProduct(int id)
        {
            try
            {
                ProductDAO.DeleteProduct(id);
            }
            catch (Exception ex)
            {                
                throw ex;
            }
        }     

        #endregion
    }
}
