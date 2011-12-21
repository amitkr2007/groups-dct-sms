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
    public partial class frmPhieuNhap : FormBase , IProduct
    {
        public frmPhieuNhap()
        {
            InitializeComponent();
            this.grdProduct.AutoGenerateColumns = false;
            this.grdProductNhap.AutoGenerateColumns = false;
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
            grdProduct.DataSource = ProductList;
        }

        private void btnSPMoi_Click(object sender, EventArgs e)
        {
            frmSanPham sp = new frmSanPham(this);
            sp.WindowState = System.Windows.Forms.FormWindowState.Normal;
            sp.MinimumSize = new System.Drawing.Size(985, 533);
            sp.ShowDialog();
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            var data = (grdProduct.DataSource as List<LinhKienNhap>).Where(p => p.Checked);
            ProductNhapList.AddRange(data);
            grdProductNhap.DataSource = ProductNhapList;
            ProductList.RemoveAll(p => data.Contains(p));
            grdProduct.DataSource = ProductList;
        }

        public List<LinhKienNhap> ProductList { get; set; }

        List<LinhKienNhap> _ProductNhapList;
        public List<LinhKienNhap> ProductNhapList 
        { 
            get 
            {
                if (_ProductNhapList == null) 
                    return new List<LinhKienNhap>();
                return _ProductNhapList; 
            } 
            set 
            {
                _ProductNhapList = value; 
            } 
        }
    }

    public class LinhKienNhap : LinhKien
    {
        public bool Checked { get; set; }
        public int SoLuongTon { get; set; }
        public int GiaNhap { get; set; }
        public int Soluong { get; set; }
    }
}
