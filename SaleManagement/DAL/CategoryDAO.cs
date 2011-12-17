using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;
using System.Data;
using System.Data.Objects;

namespace SaleManagement.DAL
{
    public class CategoryDAO
    {
        public static List<CategoryDTO> GetAllCategories()
        {
            try
            {
                SaleEntities ctx = new SaleEntities();
                var result = from c in ctx.LoaiLinhKiens
                             select c;
                List<CategoryDTO> lstResult = new List<CategoryDTO>();
                foreach (var item in result)
                {
                    lstResult.Add(ConverterDAO.ConvertEntityToDTO(item));
                }
                return lstResult;
                }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static CategoryDTO GetCategoryByID(string cateID)
        {
            SaleEntities ctx = new SaleEntities();
            LoaiLinhKien llk = ctx.LoaiLinhKiens.SingleOrDefault(c => c.MaLoai == cateID);
            if (llk != null)
            {
                return ConverterDAO.ConvertEntityToDTO(llk);   
            }
            else
            {
                throw new ArgumentNullException("Không tồn tại loại sản phẩm có mã : " + cateID);
            }
        }

        public static void InsertNewCategory(CategoryDTO cDto)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                LoaiLinhKien a = ConverterDAO.ConvertDTOToEntity(cDto);
                
                ctx.SaveChanges();
            }
            catch (OptimisticConcurrencyException)
            {
                ctx.Refresh(RefreshMode.ClientWins, ctx.LoaiLinhKiens);
                ctx.SaveChanges();
            }
            catch (UpdateException)
            {
                ctx.Refresh(RefreshMode.StoreWins, ctx.LoaiLinhKiens);
                throw new UpdateException("Saving Error");
            }
            catch (Exception ex)
            {                
                throw ex;
            }
        }

        public static void DeleteCategory(string id)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                var cate = ctx.LoaiLinhKiens.Single(c => c.MaLoai == id);
                ctx.DeleteObject(cate);
                ctx.SaveChanges();
            }
            catch (OptimisticConcurrencyException)
            {
                ctx.Refresh(RefreshMode.ClientWins, ctx.LoaiLinhKiens);
                ctx.SaveChanges();
            }
            catch (UpdateException)
            {
                ctx.Refresh(RefreshMode.StoreWins, ctx.LoaiLinhKiens);
                throw new UpdateException("Deleting Error");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void UpdateCategory(CategoryDTO objDto)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                LoaiLinhKien a = ctx.LoaiLinhKiens.SingleOrDefault(c => c.MaLoai == objDto.CategoryID);
                if (a != null)
                {
                    a.TenLoai = objDto.CategoryName;
                    a.MoTa = objDto.Description;
                    ctx.SaveChanges();
                }
                else
                {
                    throw new ArgumentNullException("Không thể cập nhật đối tượng = null");
                }
            }
            catch (OptimisticConcurrencyException)
            {
                ctx.Refresh(RefreshMode.ClientWins, ctx.LoaiLinhKiens);
                ctx.SaveChanges();
            }
            catch (UpdateException)
            {
                ctx.Refresh(RefreshMode.StoreWins, ctx.LoaiLinhKiens);
                throw new UpdateException("Updating Error");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
