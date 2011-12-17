using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;

namespace SaleManagement.DAL
{
    public class ConverterDAO
    {
        #region Convert DTO object to entity object
        public static LoaiLinhKien ConvertDTOToEntity(CategoryDTO cDto)
        {
            if (cDto != null)
            {
                LoaiLinhKien llk = new LoaiLinhKien();
                llk.MaLoai = cDto.CategoryID;
                llk.TenLoai = cDto.CategoryName;
                llk.MoTa = cDto.Description;
                return llk;
            }
            else
            {
                throw new ArgumentNullException("Can not convert null object");
            }
        }

        public static LinhKien ConvertDTOToEntity(ProductDTO pDto)
        {
            if (pDto != null)
            {
                LinhKien lk = new LinhKien();
                lk.ID = pDto.ProductID;
                lk.MaLKien = pDto.ProductCode;
                lk.MaLoai = pDto.Category.CategoryID;
                lk.TenLinhKien = pDto.ProductName;
                lk.GiaBan = pDto.Price;
                lk.HinhAnh = pDto.Image;
                lk.SanPhamMoi = pDto.IsNew;
                lk.ThongTinThem = pDto.Description;
                return lk;
            }
            else
            {
                throw new ArgumentNullException("Can not convert null object");
            }
        }

        #endregion

        #region Convert Entity to DTO object

        public static CategoryDTO ConvertEntityToDTO(LoaiLinhKien llk)
        {
            if (llk != null)
            {
                CategoryDTO cDto = new CategoryDTO();
                cDto.CategoryID = llk.MaLoai;
                cDto.CategoryName = llk.TenLoai;
                cDto.Description = llk.MoTa;
                return cDto;
            }
            else
            {
                throw new ArgumentNullException("Can not convert null object");
            }
        }

        public static ProductDTO ConvertEntityToDTO(LinhKien lk)
        {
            if (lk != null)
            {
                ProductDTO pDto = new ProductDTO();
                pDto.ProductID = lk.ID;
                pDto.ProductCode = lk.MaLKien;
                pDto.Category = CategoryDAO.GetCategoryByID(lk.MaLoai); 
                pDto.ProductName = lk.TenLinhKien;
                pDto.Price = lk.GiaBan == null ? 0 : (int)lk.GiaBan;
                pDto.Image = lk.HinhAnh;
                pDto.IsNew = lk.SanPhamMoi == null ? false : (bool)lk.SanPhamMoi;
                pDto.Description = lk.ThongTinThem;
                return pDto;
            }
            else
            {
                throw new ArgumentNullException("Can not convert null object");
            }
        }

        #endregion
    }
}
