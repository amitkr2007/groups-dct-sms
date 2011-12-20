using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SaleManagement.DAL;
using SaleManagement.BUL;
using SaleManagement.DTO;

namespace SaleManagement.API
{
    public partial class frmPhieuNhap : FormBase, IProduct
    {
        public frmPhieuNhap()
        {
            InitializeComponent();
            this.grdProduct.AutoGenerateColumns = false;
            this.GetProductList();
        }

        public override int TabID
        {
            get
            {
                return tabControl1.SelectedIndex;
            }
            set
            {
                tabControl1.SelectedIndex = value;
            }
        }

        public void GetProductList()
        {
            var lstitem = from pro in ProductDAO.GetAllProductEntity()
                          join tk in ProductDAO.GetListTonKho().Where(n=>n.Ngay<=DateTime.Now).OrderByDescending(p=>p.Ngay).GroupBy(h=>h.ID) on pro.ID equals tk.Key into lst
                          from kk in lst.DefaultIfEmpty()
                          select new LinhKienNhap {
                              ID = pro.ID,
                              MaLKien = pro.MaLKien,
                              TenLinhKien = pro.TenLinhKien,
                              ThongTinThem = pro.ThongTinThem,
                              GiaBan = pro.GiaBan,
                              SoLuongTon = (kk==null)? 0 : kk.First().SoLuongTon.Value
                          };
            ProductList = lstitem.ToList();
        }

        private void btnSPMoi_Click(object sender, EventArgs e)
        {
            frmSanPham sp = new frmSanPham(this);
            sp.WindowState = System.Windows.Forms.FormWindowState.Normal;
            sp.MinimumSize = new System.Drawing.Size(985, 533);
            sp.ShowDialog();
        }


        public List<LinhKienNhap> ProductList
        {
            get
            {
                return grdProduct.DataSource as List<LinhKienNhap>;
            }
            set
            {
                grdProduct.DataSource = value;
            }
        }

        public List<LinhKienNhap> ProductListNhap
        {
            get
            {
                return grdProductNhap.DataSource as List<LinhKienNhap>;
            }
            set
            {
                grdProductNhap.DataSource = value;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

        }

        private void btnRemove_Click(object sender, EventArgs e)
        {

        }
    }

    public class LinhKienNhap : LinhKien
    {
        public int SoLuongTon { get; set; }
        public int GiaNhap { get; set; }
        public int Soluong { get; set; }
    }
}
