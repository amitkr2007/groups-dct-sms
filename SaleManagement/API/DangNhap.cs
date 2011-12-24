using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SaleManagement.API
{
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                MessageBox.Show("Bạn phải nhập Username và Password.", "Đăng nhập thất bại", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (string.Compare(txtUserName.Text, txtPassword.Text) == 0)
            {
                this.Close();
            }
            else
            {
                MessageBox.Show("Username và Password không đúng.", "Đăng nhập thất bại", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
