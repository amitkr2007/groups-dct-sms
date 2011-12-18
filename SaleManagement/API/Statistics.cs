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
    public partial class frmStatistics : FormBase
    {
        private List<ProductDTO> lstProduct = null;
        //private BindingSource pbind = new BindingSource();

        public frmStatistics()
        {
            InitializeComponent();
            dgProducts.AutoGenerateColumns = false;
            dgSatisticsResult.AutoGenerateColumns = false;
            grdResult.AutoGenerateColumns = false;
            lstProduct = ListItemsManagerBUS.GetAllProducts();
            //pbind = ConvertListToBindingSource(lstProduct);
        }

        private void frmStatistics_Load(object sender, EventArgs e)
        {
            dgProducts.DataSource = lstProduct;
            //dgProducts.DataSource = pbind;
            List<CategoryDTO> lstCates = ListItemsManagerBUS.GetAllCategories();
            lstCates.Insert(0, new CategoryDTO() {CategoryID="All", CategoryName = "All" });
            cmbCategories.DataSource = lstCates;
            cmbCategory.DataSource = lstCates;
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

        public BindingSource ConvertListToBindingSource(List<ProductDTO> lst)
        {
            BindingSource bs = new BindingSource();
            foreach (var item in lst)
            {
                bs.Add(item);
            }
            return bs;
        }

        private void bntStatistic_Click(object sender, EventArgs e)
        {
            CategoryDTO cate = cmbCategory.SelectedItem as CategoryDTO;
            List<ProductStatistic> data = StatisticBUS.GetProductSoldByPeriodTimeAndCategory(cate.CategoryID, dtpFromDate.Value, dtpToDate.Value);
            grdResult.DataSource = data;
            lblSumQuantity.Text = data.Select(r => r.Quantity).Sum().ToString();
            lblSumAmount.Text = data.Select(r => r.Amount).Sum().ToString("#,###.##");
        }

        public override int TabID
        {
            get
            {
                return tabControl1.TabIndex;
            }
            set
            {
                tabControl1.SelectedIndex = value;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            List<ProductStatistic> data = StatisticBUS.StatisticByQuantitySoldAndPeriodTime(dtpTuNgay.Value, dtpDenNgay.Value, Convert.ToInt32(quantityFrom.Value), Convert.ToInt32(QuantityTo.Value));
            grdKetQua.DataSource = data;
            lblTongSoLuong.Text = data.Select(r => r.Quantity).Sum().ToString();
            lblTongTien.Text = data.Select(r => r.Amount).Sum().ToString("#,###.##");
        }
    }
}
