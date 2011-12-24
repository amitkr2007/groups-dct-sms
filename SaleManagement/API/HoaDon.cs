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
            this.grdInvoice.AutoGenerateColumns = false;
            this.grdProduct.AutoGenerateColumns = false;
            _InvoicePresenter = new InvoiceBUS();
            this.AutoLoadData();
        }

        public void AutoLoadData()
        {
            cbxTrangThai.SelectedIndex = 0;
            this.grdInvoice.DataSource = _InvoicePresenter.GetListInvoice();
        }

        private void grdInvoice_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            var invoie = ((HoaDon)grdInvoice.Rows[e.RowIndex].DataBoundItem);
            txtMaHD.Text = invoie.MaHoaDon;
            dtOutputDate.Value = invoie.NgayGiao.Value;
            dtPostingDate.Value = invoie.NgayLap.Value;
            txtMaKH.Text = invoie.MaKH;
            bntXuatHD.Enabled = !(bool)invoie.TrangThai;
            chkStatus.Checked = (bool)invoie.TrangThai;
            CustomerDAO cus = new CustomerDAO();
            txtTenKH.Text = cus.GetByID(invoie.MaKH).TenKH;
            txtTenKH.Text = _InvoicePresenter.GetCustomerByID(invoie.MaKH).TenKH;
            var lst = InvoiceBUS.GetProductsOnOrder(invoie.MaHoaDon);
            this.grdProduct.DataSource = lst;
            txtCount.Text = lst.Sum(r => r.Quantity).ToString();
            txtTT.Text = lst.Sum(r => r.Amount).ToString();
        }

        private void grdProduct_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            this.grdProduct["TT", e.RowIndex].Value = (decimal)this.grdProduct["GiaSanPham", e.RowIndex].Value * (decimal)this.grdProduct["SoLuongBan", e.RowIndex].Value;
        }

        private void btnXuatHD_Click(object sender, EventArgs e)
        {
            try
            {
                //if (InvoiceBUS.CheckEnoughQuantity() == 0)
                //{

                InvoiceBUS.CheckOutInvoice(txtMaHD.Text);
                MessageBox.Show("Thành công", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                //}
            }
            catch (Exception ex)
            {
                MessageBox.Show("Không thành công\nLỗi : " + ex.Message, "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cbxTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            var lst = _InvoicePresenter.GetListInvoice();
            switch (cbxTrangThai.SelectedIndex)
            {
                case 0:
                    grdInvoice.DataSource = lst;
                    break;
                case 1:
                    grdInvoice.DataSource = lst.Where(i => i.TrangThai == false).ToList();
                    break;
                case 2:
                    grdInvoice.DataSource = lst.Where(i => i.TrangThai == true).ToList();
                    break;
            }
        }
    }
}
