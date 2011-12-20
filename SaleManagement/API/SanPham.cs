using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SaleManagement.DTO;
using SaleManagement.BUL;

namespace SaleManagement.API
{
    public partial class frmSanPham : Form
    {        
        public frmSanPham()
        {
            InitializeComponent();
        }

        IProduct _Product;
        public frmSanPham(IProduct product)
        {
            InitializeComponent();
            _Product = product;
        }

        public void LoadProducts()
        {
            List<ProductDTO> lst = ListItemsManagerBUS.GetAllProducts();
            foreach (var item in lst)
            {
                lstvProducts.Items.Add(ConvertDTOtoListViewItem(item));
            }
        }

        public ListViewItem ConvertDTOtoListViewItem(ProductDTO item)
        {
            ListViewItem keyItem = new ListViewItem(item.ProductID.ToString());
            keyItem.SubItems.Add(item.ProductCode);
            keyItem.SubItems.Add(item.ProductName);
            keyItem.SubItems.Add(item.Price.ToString("#,###.##"));
            keyItem.SubItems.Add(item.Description);
            return keyItem;
        }

        private void frmSanPham_Load(object sender, EventArgs e)
        {
            List<CategoryDTO> lst = ListItemsManagerBUS.GetAllCategories();
            cbxLoaiSP.DataSource = lst;
            cbxLoaiSP.DisplayMember = "CategoryName";
            cbxLoaiSPearch.DataSource = lst;
            cbxLoaiSPearch.DisplayMember = "CategoryName";
            LoadProducts();
        }

        public void ViewProduct(ProductDTO objDto)
        {
            txtMSP.Tag = objDto.ProductID;
            txtDescription.Text = objDto.Description;
            txtGiaBan.Text = objDto.Price.ToString();
            txtMSP.Text = objDto.ProductCode;
            txtTenSP.Text = objDto.ProductName;
            cbxLoaiSP.Text = objDto.Category.CategoryName;
            if (objDto.Image != null)
	        {
		        System.IO.MemoryStream ms = new System.IO.MemoryStream(objDto.Image);
                this.imgProduct.Image = new Bitmap(ms);
	        }
            chkIsNew.Checked = objDto.IsNew;
        }

        private void lstvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSave.Tag = SaveState.Update;
            ListView lstV = sender as ListView;
            if (lstV.FocusedItem == null) return;
            int index = lstV.FocusedItem.Index;
            if (index < 0) return;
            ListViewItem itemSelected = lstV.Items[index];
            if (!string.IsNullOrEmpty(itemSelected.Text) || string.Compare(itemSelected.Text,"0") != 0)
            {
                ProductDTO objDto = ListItemsManagerBUS.GetProductByID(int.Parse(itemSelected.Text));
                if (objDto != null)
	            {
                    ViewProduct(objDto);
	            }
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        public void CleanControls()
        {
            txtMSP.Tag = null;
            txtDescription.Text = string.Empty;
            txtGiaBan.Text = string.Empty;
            txtMSP.Text = string.Empty;
            txtTenSP.Text = string.Empty;
            cbxLoaiSP.SelectedIndex = 0;
            imgProduct.Image = global::SaleManagement.API.Properties.Resources.defaultImage;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            btnSave.Tag = SaveState.Add;
            CleanControls();
        }

        public ProductDTO CollectedDataObj()
        {
            ProductDTO objDto = new ProductDTO();
            if ((SaveState)btnSave.Tag == SaveState.Update)
	        {
                objDto.ProductID = (int)txtMSP.Tag;
	        }
            objDto.Description = txtDescription.Text;
            objDto.Price = int.Parse(txtGiaBan.Text);
            objDto.ProductCode = txtMSP.Text;
            objDto.ProductName = txtTenSP.Text;
            objDto.Category = cbxLoaiSP.SelectedItem as CategoryDTO;
            objDto.IsNew = chkIsNew.Checked == true ? true : false;
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            imgProduct.Image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            objDto.Image = ms.ToArray();
            return objDto;
        }

        private void btnBrowseImage_Click(object sender, EventArgs e)
        {
            this.openFileDialogImg.Filter = "Image Files(*.jpg; *.jpeg; *.gif; *.bmp)|*.jpg; *.jpeg; *.gif; *.bmp";
            if (this.openFileDialogImg.ShowDialog() == DialogResult.OK)
            {
                this.imgProduct.Image = new Bitmap(this.openFileDialogImg.FileName);
            }
        }

        public ListViewItem FindListViewItem()
        {
            foreach (ListViewItem item in lstvProducts.Items)
            {
                if (int.Parse(item.Text) == (int)txtMSP.Tag)
                {
                    return item;
                }
            }
            return null;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ProductDTO objDto = CollectedDataObj();
                if ((SaveState)this.btnSave.Tag == SaveState.Add)
                {
                    ListItemsManagerBUS.InsertNewProduct(objDto);
                    lstvProducts.Items.Add(ConvertDTOtoListViewItem(objDto));
                    MessageBox.Show("Thêm thành công", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    ListItemsManagerBUS.UpdateProduct(objDto);
                    lstvProducts.Items.Remove(FindListViewItem());
                    lstvProducts.Items.Add(ConvertDTOtoListViewItem(objDto));
                    MessageBox.Show("Cập nhật thành công", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Không thành công\nLỗi : " + ex.Message, "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtMSP.Tag != null)
                {
                    ListItemsManagerBUS.DeleteProduct((int)txtMSP.Tag);
                    if (FindListViewItem() != null)
                    {
                        lstvProducts.Items.Remove(FindListViewItem());
                    }
                    MessageBox.Show("Xóa thành công", "Sell Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);//+ ex.InnerException == null ? "" : ex.InnerException.Message
            }
        }

        private void cbxLoaiSPearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
