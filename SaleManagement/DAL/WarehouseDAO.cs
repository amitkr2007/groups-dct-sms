using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SaleManagement.DTO;
using System.Data;
using System.Data.Objects;

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

        private static int GetQuantityInWarehouse(int productID)
        {
            var lst = WarehouseDAO.GetAllLinhKienTons();
            var check = lst.Where(t => t.ID == productID);
            if (check == null || check.Count() <= 0) return 0;
            var maxDate = (from tt in lst
                           where tt.ID == productID
                           select tt.Ngay).Max();
            var objt = lst.SingleOrDefault(t => t.Ngay == maxDate && t.ID == productID);
            if (objt == null)
            {
                return 0;
            }
            else
            {
                return (int)objt.SoLuongTon;
            }
        }

        public static void InsertSoredStatus(DateTime date, int productID, int quantity)
        {
            using (SaleEntities ctx = new SaleEntities())
            {
                try
                {
                    //var maxDate = (from tt in ctx.LinhKienTons
                    //               where tt.ID == productID
                    //               select tt.Ngay).Max();
                    //var objt = ctx.LinhKienTons.SingleOrDefault(t => t.Ngay == maxDate && t.ID == productID);
                    LinhKienTon tk = new LinhKienTon();
                    //if (objt == null)
                    //{
                    //    tk.Ngay = date;
                    //    tk.ID = productID;
                    //    tk.SoLuongTon = quantity;
                    //}
                    //else
                    //{
                    //int soLuongTon = WarehouseDAO.GetQuantityInWarehouse(productID);
                        tk.Ngay = date;
                        tk.ID = productID;
                        tk.SoLuongTon = quantity;
                    //}
                    ctx.AddToLinhKienTons(tk);
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
        }

        public static List<LinhKienTon> GetAllLinhKienTons()
        {
            using (SaleEntities ctx = new SaleEntities())
            {
                var lst = from t in ctx.LinhKienTons
                          select t;
                return lst.ToList();
            }
        }
    }
}
