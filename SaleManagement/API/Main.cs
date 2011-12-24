﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SaleManagement.API
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void quảnLýHãngSảnXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmLoaiSP frmCate = new frmLoaiSP();
            frmCate.MdiParent = this;
            frmCate.Show();
        }

        private void quảnLýSảnPhẩmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSanPham frm = new frmSanPham();
            frm.MdiParent = this;
            frm.Show();                
        }

        private void OpenForm(Type frmType, int tabID = -1)
        {
            foreach (var item in this.MdiChildren)
            {
                if (item.GetType() == frmType)
                {
                    if(tabID != -1) (item as FormBase).TabID = tabID;
                    item.WindowState = FormWindowState.Maximized;
                    item.Activate();
                    return;
                }
            }
            FormBase frmNew = (FormBase)Activator.CreateInstance(frmType);
            frmNew.MdiParent = this;
            frmNew.WindowState = FormWindowState.Maximized;
            if (tabID != -1) frmNew.TabID = tabID;
            frmNew.Show();
        }

        private void quảnLýHóaĐơnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmHoaDon),1);
        }

        private void lậpHóaĐơnMớiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmHoaDon),0);
        }

        private void sảnPhẩmToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmStatistics), 0);
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmStatistics), 1);
        }

        private void theoSảnPhẩmBánĐượcToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmStatistics), 2);
        }

        private void lậpPhiếuXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmPhieuNhap), 0);
        }

        private void quảnLýPhiếuXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.OpenForm(typeof(frmPhieuNhap), 1);
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            frmDangNhap frm = new frmDangNhap();
            frm.ShowDialog(this);
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < this.MdiChildren.Length; i++)
            {
                this.MdiChildren[i].WindowState = FormWindowState.Normal;
                this.MdiChildren[i].Close();
            }
            frmDangNhap frm = new frmDangNhap();
            frm.ShowDialog(this);
        }
    }
}
