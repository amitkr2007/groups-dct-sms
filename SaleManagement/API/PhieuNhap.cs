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
    public partial class frmPhieuNhap : FormBase
    {
        private List<ProductDTO> lstProduct = null;
        private List<ProductDTO> lstProductSelecteds = null;
        public frmPhieuNhap()
        {
            InitializeComponent();
            dgProducts.AutoGenerateColumns = false;
            grdProductNhap.AutoGenerateColumns = false;
        }

        private void frmPhieuNhap_Load(object sender, EventArgs e)
        {
            dgProducts.DataSource = lstProduct;
            lstProduct = ListItemsManagerBUS.GetAllProducts();
            List<CategoryDTO> lstCates = ListItemsManagerBUS.GetAllCategories();
            lstCates.Insert(0, new CategoryDTO() { CategoryID = "All", CategoryName = "All" });
            cmbCategories.DataSource = lstCates;
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

        private void cmbCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((cmbCategories.SelectedItem as CategoryDTO).CategoryName == "All")
            {
                dgProducts.DataSource = ListItemsManagerBUS.GetAllProducts();
                return;
            }
            var lstSearch = from p in lstProduct
                            where p.Category.CategoryID == (cmbCategories.SelectedItem as CategoryDTO).CategoryID
                            select p;
            dgProducts.DataSource = lstSearch.ToList();
            txtKeySearch.Text = string.Empty;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            lstProductSelecteds = new List<ProductDTO>();
            foreach (DataGridViewRow row in dgProducts.Rows)
            {
                if (Convert.ToBoolean(row.Cells[clmCheck.Name].Value) == true)
                {
                    ProductDTO selectedObj = row.DataBoundItem as ProductDTO;
                    lstProductSelecteds.Add(selectedObj);
                }
            }
            grdProductNhap.DataSource = lstProductSelecteds;
        }

        private void txtKeySearch_TextChanged(object sender, EventArgs e)
        {
            var lstSearch = from p in lstProduct
                            where p.ProductCode.ToLower().Contains(txtKeySearch.Text.Trim().ToLower()) || p.ProductName.ToLower().Contains(txtKeySearch.Text.Trim().ToLower())
                            select p;
            dgProducts.DataSource = lstSearch.ToList();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                ImportVoucher saveObj = CreatePhieuNhap();
                InvoiceBUS.InsertImportVoucher(saveObj);
                MessageBox.Show("Lưu thành công.", "Hoàn tất", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lưu thất bại.\nLỗi : " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public ImportVoucher CreatePhieuNhap()
        {
            ImportVoucher imp = new ImportVoucher();
            imp.CreatedDate = dtpNgayNhap.Value;
            imp.Description = txtGhiChu.Text;
            imp.VoucherID = txtMaPhieu.Text;
            imp.lstDetails = new List<ProductOnOrder>();
            for (int i = 0; i < grdProductNhap.Rows.Count; i++)
            {
                ProductOnOrder p = new ProductOnOrder();
                p.ProductID = int.Parse(grdProductNhap.Rows[i].Cells[0].Value.ToString());
                p.Price = int.Parse(grdProductNhap.Rows[i].Cells[3].Value.ToString());
                p.Quantity = int.Parse(grdProductNhap.Rows[i].Cells[4].Value.ToString());
                imp.lstDetails.Add(p);
            }
            return imp;
        }

        private void grdProductNhap_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }
    }
}
