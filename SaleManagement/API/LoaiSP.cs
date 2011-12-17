using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SaleManagement.BUL;
using SaleManagement.DTO;

namespace SaleManagement.API
{
    public partial class frmLoaiSP : Form
    {
        public frmLoaiSP()
        {
            InitializeComponent();
        }

        private void frmLoaiSP_Load(object sender, EventArgs e)
        {
            try
            {
                LoadCategory();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + ex.InnerException == null ? "" : ex.InnerException.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void LoadCategory()
        {
            lstvCategories.Items.Clear();
            List<CategoryDTO> lstCates = ListItemsManagerBUS.GetAllCategories();
            foreach (var item in lstCates)
            {
                ListViewItem keyItem = new ListViewItem(item.CategoryID);
                keyItem.SubItems.Add(item.CategoryName);
                keyItem.SubItems.Add(item.Description);
                lstvCategories.Items.Add(keyItem);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void lstvCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnLuu.Tag = SaveState.Update;
            ListView lstV = sender as ListView;
            txtMaLoai.ReadOnly = true;
            if (lstV.FocusedItem == null) return;
            int index = lstV.FocusedItem.Index;
            if (index < 0) return;
            ListViewItem itemSelected = lstV.Items[index];
            txtMaLoai.Text = itemSelected.Text;
            txtTenLoai.Text = itemSelected.SubItems[0].Text;
            txtMoTa.Text = itemSelected.SubItems[1].Text;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            btnLuu.Tag = SaveState.Add;
            txtMaLoai.Enabled = true;
            txtMaLoai.ReadOnly = false;
            txtMaLoai.Text = string.Empty;
            txtTenLoai.Text = string.Empty;
            txtMoTa.Text = string.Empty;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                ListItemsManagerBUS.DeleteCategory(txtMaLoai.Text.Trim());
                LoadCategory();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);//+ ex.InnerException == null ? "" : ex.InnerException.Message
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                CategoryDTO cate = new CategoryDTO();
                cate.CategoryID = txtMaLoai.Text.Trim();
                cate.CategoryName = txtTenLoai.Text.Trim();
                cate.Description = txtMoTa.Text.Trim();
                if (string.IsNullOrEmpty(txtMaLoai.Text))
                {
                    MessageBox.Show("Mã sản phẩm phải được nhập ", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                if ((SaveState)btnLuu.Tag == SaveState.Add)
                {
                    if (ListItemsManagerBUS.CheckExistCategoryID(txtMaLoai.Text))
                    {
                        MessageBox.Show("Mã loại đã tồn tại", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                    ListItemsManagerBUS.InsertNewCategory(cate);
                    MessageBox.Show("Thêm thành công", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    ListItemsManagerBUS.UpdateCategory(cate);
                }
                txtMaLoai.ReadOnly = true;
                LoadCategory();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Thêm không thành công\nLỗi : " + ex.Message, "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            lstvCategories.Items.Clear();
            List<CategoryDTO> lstCates = SearchingBUS.SearchCategoriesByKey(txtKey.Text);
            foreach (var item in lstCates)
            {
                ListViewItem keyItem = new ListViewItem(item.CategoryID);
                keyItem.SubItems.Add(item.CategoryName);
                keyItem.SubItems.Add(item.Description);
                lstvCategories.Items.Add(keyItem);
            }
        }
    }
}