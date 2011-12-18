using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;
using System.Data;
using System.Data.Objects;

namespace SaleManagement.DAL
{
    public class ProductDAO
    {
        public LinhKien GetProductById(int linhKien)
        {
            using (var data = new SaleEntities())
            {
                return data.LinhKiens.First(p => p.ID.Equals(linhKien));
            }
        }

        public static List<ProductDTO> GetAllProducts()
        {
            SaleEntities ctx = new SaleEntities();
            var lst = from p in ctx.LinhKiens
                      select p;
            List<ProductDTO> result = new List<ProductDTO>();
            foreach (var item in lst)
            {
                result.Add(ConverterDAO.ConvertEntityToDTO(item));
            }
            return result;
        }

        public static ProductDTO GetProductByID(int id)
        {
            SaleEntities ctx = new SaleEntities();
            LinhKien lk = ctx.LinhKiens.SingleOrDefault(l => l.ID == id);
            return ConverterDAO.ConvertEntityToDTO(lk);
        }

        public static List<ProductDTO> GetProductsByCategoryID(string categoryID)
        {
            return ProductDAO.GetAllProducts().Where(p => p.Category.CategoryID == categoryID).ToList();
        }

        public static void InsertNewProduct(ProductDTO cDto)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                LinhKien a = ConverterDAO.ConvertDTOToEntity(cDto);
                ctx.AddToLinhKiens(a);
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

        public static void UpdateProduct(ProductDTO objDto)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                LinhKien a = ctx.LinhKiens.SingleOrDefault(c => c.MaLoai == objDto.ProductCode);
                if (a != null)
                {
                    a.MaLKien = objDto.ProductCode;
                    a.MaLoai = objDto.Category.CategoryID;
                    a.TenLinhKien = objDto.ProductName;
                    a.GiaBan = objDto.Price;
                    a.HinhAnh = objDto.Image;
                    a.SanPhamMoi = objDto.IsNew;
                    a.ThongTinThem = objDto.Description;
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

        public static void DeleteProduct(int id)
        {
            SaleEntities ctx = new SaleEntities();
            try
            {
                var cate = ctx.LinhKiens.Single(p => p.ID == id);
                if (cate != null)
                {
                    ctx.DeleteObject(cate);
                    ctx.SaveChanges(); 
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
                throw new UpdateException("Saving Error");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<LinhKien> GetAllProductEntity()
        {
            using (SaleEntities ctx = new SaleEntities())
            {
                var lst = from p in ctx.LinhKiens
                          select p;
                return lst.ToList();
            }
        }
    }
}
