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
    public partial class frmStatistics : Form
    {
        private List<ProductDTO> lstProduct = null;
        //private BindingSource pbind = new BindingSource();

        public frmStatistics()
        {
            InitializeComponent();
            dgProducts.AutoGenerateColumns = false;
            dgSatisticsResult.AutoGenerateColumns = false;
            lstProduct = ListItemsManagerBUS.GetAllProducts();
            //pbind = ConvertListToBindingSource(lstProduct);
        }

        private void frmStatistics_Load(object sender, EventArgs e)
        {
            dgProducts.DataSource = lstProduct;
            //dgProducts.DataSource = pbind;
            List<CategoryDTO> lstCates = ListItemsManagerBUS.GetAllCategories();
            lstCates.Insert(0, new CategoryDTO() { CategoryName = "All" });
            cmbCategories.DataSource = lstCates;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            var lstSearch = from p in lstProduct
                            where p.ProductCode.Contains(txtKeySearch.Text.Trim()) || p.ProductName.Contains(txtKeySearch.Text.Trim())
                            select p;
            dgProducts.DataSource = lstSearch.ToList();
        }

        private void bntThongKe_Click(object sender, EventArgs e)
        {
            List<ProductDTO> lstSelectedProducts = new List<ProductDTO>();
            foreach (DataGridViewRow row in dgProducts.Rows)
            {
                if (Convert.ToBoolean(row.Cells[clmCheck.Name].Value) == true)
                {
                    ProductDTO selectedObj = row.DataBoundItem as ProductDTO;
                    lstSelectedProducts.Add(selectedObj);
                }
            }
            dgSatisticsResult.DataSource = StatisticBUS.StatisticStoredWithQuantityAndDate(lstSelectedProducts, dtpChooseDate.Value);
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

        private void dgSatisticsResult_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        public BindingSource ConvertListToBindingSource(List<ProductDTO> lst)
        {
            BindingSource bs = new BindingSource();
            foreach (var item in lst)
            {
                bs.Add(item);
            }
            return bs;
        }
    }
}
