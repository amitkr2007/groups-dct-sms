using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SaleManagement.BUL;
using SaleManagement.DAL;

namespace SaleManagement.API
{
    public partial class frmHoaDon :  FormBase
    {
        private InvoiceBUS _InvoicePresenter;
        public frmHoaDon()
        {
            InitializeComponent();
            _InvoicePresenter = new InvoiceBUS();
            this.AutoLoadData();
        }

        public void AutoLoadData()
        {
            
            this.grdInvoice.AutoGenerateColumns = false;
            this.grdInvoice.DataSource = _InvoicePresenter.GetListInvoice();
        }

        private void grdInvoice_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            var invoie = ((HoaDon)grdInvoice.Rows[e.RowIndex].DataBoundItem);
            txtMaHD.Text = invoie.MaHoaDon;
            dtOutputDate.Value = invoie.NgayGiao.Value;
            dtPostingDate.Value = invoie.NgayLap.Value;
            txtMaKH.Text = invoie.MaKH;
            txtTenKH.Text = _InvoicePresenter.GetCustomerByID(invoie.MaKH).TenKH;
            this.grdProduct.DataSource = _InvoicePresenter.GetInvoidDetailByInviceID(invoie.MaHoaDon);
        }

        private void grdProduct_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            this.grdProduct["TT", e.RowIndex].Value = (decimal)this.grdProduct["GiaSanPham", e.RowIndex].Value * (decimal)this.grdProduct["SoLuongBan", e.RowIndex].Value;
        }

        public override int TabID
        {
            get
            {
                return this.tabControl1.SelectedIndex;
            }
            set
            {
                this.tabControl1.SelectedIndex = value;
            }
        }

        private void btnXuatHD_Click(object sender, EventArgs e)
        {

        }
    }
}
