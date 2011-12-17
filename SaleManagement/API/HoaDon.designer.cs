namespace SaleManagement.API
{
    partial class frmHoaDon : FormBase
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.btnXuatHD = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.grdProduct = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TenLinhKien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GiaSanPham = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SoLuongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dtOutputDate = new System.Windows.Forms.DateTimePicker();
            this.dtPostingDate = new System.Windows.Forms.DateTimePicker();
            this.txtTenKH = new System.Windows.Forms.TextBox();
            this.txtMaKH = new System.Windows.Forms.TextBox();
            this.txtPhiVanChuyen = new System.Windows.Forms.TextBox();
            this.txtTT = new System.Windows.Forms.TextBox();
            this.txtCount = new System.Windows.Forms.TextBox();
            this.txtMaHD = new System.Windows.Forms.TextBox();
            this.chkStatus = new System.Windows.Forms.CheckBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnLoc = new System.Windows.Forms.Button();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.grdInvoice = new System.Windows.Forms.DataGridView();
            this.MaHoaDon = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MaKH = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TongGiaTien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TrangThai = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.NgayLap = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NgayGiao = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DiaChiGiao = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GhiChu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cbxTrangThai = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column8 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column9 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column10 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.listView2 = new System.Windows.Forms.ListView();
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader8 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader10 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader11 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.btnThoat = new System.Windows.Forms.Button();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdProduct)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grdInvoice)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.groupBox6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 2);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1067, 505);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage1.Controls.Add(this.btnXuatHD);
            this.tabPage1.Controls.Add(this.groupBox3);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.ForeColor = System.Drawing.SystemColors.Control;
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1059, 479);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Hóa Đơn Mới";
            // 
            // btnXuatHD
            // 
            this.btnXuatHD.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnXuatHD.ForeColor = System.Drawing.Color.Navy;
            this.btnXuatHD.Location = new System.Drawing.Point(644, 443);
            this.btnXuatHD.Name = "btnXuatHD";
            this.btnXuatHD.Size = new System.Drawing.Size(94, 26);
            this.btnXuatHD.TabIndex = 2;
            this.btnXuatHD.Text = "Xuất Hóa Đơn";
            this.btnXuatHD.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.label13);
            this.groupBox3.Controls.Add(this.label11);
            this.groupBox3.Controls.Add(this.label10);
            this.groupBox3.Controls.Add(this.groupBox4);
            this.groupBox3.Controls.Add(this.dtOutputDate);
            this.groupBox3.Controls.Add(this.dtPostingDate);
            this.groupBox3.Controls.Add(this.txtTenKH);
            this.groupBox3.Controls.Add(this.txtMaKH);
            this.groupBox3.Controls.Add(this.txtPhiVanChuyen);
            this.groupBox3.Controls.Add(this.txtTT);
            this.groupBox3.Controls.Add(this.txtCount);
            this.groupBox3.Controls.Add(this.txtMaHD);
            this.groupBox3.Controls.Add(this.chkStatus);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.label6);
            this.groupBox3.Controls.Add(this.label9);
            this.groupBox3.Controls.Add(this.label12);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.ForeColor = System.Drawing.Color.Navy;
            this.groupBox3.Location = new System.Drawing.Point(533, 18);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(520, 419);
            this.groupBox3.TabIndex = 1;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Chi tiết hóa đơn";
            // 
            // label13
            // 
            this.label13.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label13.AutoSize = true;
            this.label13.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label13.Location = new System.Drawing.Point(274, 387);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(30, 13);
            this.label13.TabIndex = 5;
            this.label13.Text = "VND";
            // 
            // label11
            // 
            this.label11.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label11.Location = new System.Drawing.Point(274, 361);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(30, 13);
            this.label11.TabIndex = 5;
            this.label11.Text = "VND";
            // 
            // label10
            // 
            this.label10.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label10.AutoSize = true;
            this.label10.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label10.Location = new System.Drawing.Point(274, 335);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(21, 13);
            this.label10.TabIndex = 5;
            this.label10.Text = "SP";
            // 
            // groupBox4
            // 
            this.groupBox4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox4.Controls.Add(this.grdProduct);
            this.groupBox4.ForeColor = System.Drawing.Color.Navy;
            this.groupBox4.Location = new System.Drawing.Point(6, 144);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(508, 182);
            this.groupBox4.TabIndex = 4;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Danh sách sản phẩm";
            // 
            // grdProduct
            // 
            this.grdProduct.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdProduct.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.TenLinhKien,
            this.GiaSanPham,
            this.SoLuongBan,
            this.TT});
            this.grdProduct.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdProduct.Location = new System.Drawing.Point(3, 16);
            this.grdProduct.Name = "grdProduct";
            this.grdProduct.Size = new System.Drawing.Size(502, 163);
            this.grdProduct.TabIndex = 0;
            this.grdProduct.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdProduct_CellEndEdit);
            // 
            // Column1
            // 
            this.Column1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.Column1.HeaderText = "STT";
            this.Column1.Name = "Column1";
            this.Column1.Width = 53;
            // 
            // TenLinhKien
            // 
            this.TenLinhKien.DataPropertyName = "TenLinhKien";
            this.TenLinhKien.HeaderText = "Tên sản phẩm";
            this.TenLinhKien.Name = "TenLinhKien";
            // 
            // GiaSanPham
            // 
            this.GiaSanPham.DataPropertyName = "GiaSanPham";
            this.GiaSanPham.HeaderText = "Giá bán";
            this.GiaSanPham.Name = "GiaSanPham";
            // 
            // SoLuongBan
            // 
            this.SoLuongBan.DataPropertyName = "SoLuongBan";
            this.SoLuongBan.HeaderText = "Số lượng";
            this.SoLuongBan.Name = "SoLuongBan";
            // 
            // TT
            // 
            this.TT.DataPropertyName = "TT";
            this.TT.HeaderText = "Thành tiền";
            this.TT.Name = "TT";
            // 
            // dtOutputDate
            // 
            this.dtOutputDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtOutputDate.Location = new System.Drawing.Point(344, 95);
            this.dtOutputDate.Name = "dtOutputDate";
            this.dtOutputDate.Size = new System.Drawing.Size(157, 20);
            this.dtOutputDate.TabIndex = 3;
            // 
            // dtPostingDate
            // 
            this.dtPostingDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtPostingDate.Location = new System.Drawing.Point(111, 95);
            this.dtPostingDate.Name = "dtPostingDate";
            this.dtPostingDate.Size = new System.Drawing.Size(157, 20);
            this.dtPostingDate.TabIndex = 3;
            // 
            // txtTenKH
            // 
            this.txtTenKH.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTenKH.Location = new System.Drawing.Point(111, 69);
            this.txtTenKH.Name = "txtTenKH";
            this.txtTenKH.ReadOnly = true;
            this.txtTenKH.Size = new System.Drawing.Size(390, 20);
            this.txtTenKH.TabIndex = 2;
            // 
            // txtMaKH
            // 
            this.txtMaKH.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtMaKH.Location = new System.Drawing.Point(111, 43);
            this.txtMaKH.Name = "txtMaKH";
            this.txtMaKH.ReadOnly = true;
            this.txtMaKH.Size = new System.Drawing.Size(157, 20);
            this.txtMaKH.TabIndex = 2;
            // 
            // txtPhiVanChuyen
            // 
            this.txtPhiVanChuyen.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtPhiVanChuyen.Location = new System.Drawing.Point(111, 358);
            this.txtPhiVanChuyen.Name = "txtPhiVanChuyen";
            this.txtPhiVanChuyen.Size = new System.Drawing.Size(157, 20);
            this.txtPhiVanChuyen.TabIndex = 2;
            // 
            // txtTT
            // 
            this.txtTT.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTT.Location = new System.Drawing.Point(111, 384);
            this.txtTT.Name = "txtTT";
            this.txtTT.ReadOnly = true;
            this.txtTT.Size = new System.Drawing.Size(157, 20);
            this.txtTT.TabIndex = 2;
            // 
            // txtCount
            // 
            this.txtCount.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCount.Location = new System.Drawing.Point(111, 332);
            this.txtCount.Name = "txtCount";
            this.txtCount.ReadOnly = true;
            this.txtCount.Size = new System.Drawing.Size(157, 20);
            this.txtCount.TabIndex = 2;
            // 
            // txtMaHD
            // 
            this.txtMaHD.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtMaHD.Location = new System.Drawing.Point(111, 17);
            this.txtMaHD.Name = "txtMaHD";
            this.txtMaHD.Size = new System.Drawing.Size(157, 20);
            this.txtMaHD.TabIndex = 2;
            // 
            // chkStatus
            // 
            this.chkStatus.AutoSize = true;
            this.chkStatus.ForeColor = System.Drawing.SystemColors.WindowText;
            this.chkStatus.Location = new System.Drawing.Point(111, 121);
            this.chkStatus.Name = "chkStatus";
            this.chkStatus.Size = new System.Drawing.Size(94, 17);
            this.chkStatus.TabIndex = 1;
            this.chkStatus.Text = "Đã thanh toán";
            this.chkStatus.UseVisualStyleBackColor = true;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label7.Location = new System.Drawing.Point(283, 100);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(55, 13);
            this.label7.TabIndex = 0;
            this.label7.Text = "Ngày giao";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label6.Location = new System.Drawing.Point(56, 102);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(49, 13);
            this.label6.TabIndex = 0;
            this.label6.Text = "Ngày lập";
            // 
            // label9
            // 
            this.label9.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label9.AutoSize = true;
            this.label9.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label9.Location = new System.Drawing.Point(21, 361);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(83, 13);
            this.label9.TabIndex = 0;
            this.label9.Text = "Phí vận chuyển";
            // 
            // label12
            // 
            this.label12.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label12.Location = new System.Drawing.Point(23, 387);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(52, 13);
            this.label12.TabIndex = 0;
            this.label12.Text = "Tổng tiền";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label5.Location = new System.Drawing.Point(23, 73);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(86, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "Tên khách hàng";
            // 
            // label8
            // 
            this.label8.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label8.AutoSize = true;
            this.label8.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label8.Location = new System.Drawing.Point(23, 335);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(81, 13);
            this.label8.TabIndex = 0;
            this.label8.Text = "Tổng sản phẩm";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label4.Location = new System.Drawing.Point(23, 48);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(82, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "Mã khách hàng";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label3.Location = new System.Drawing.Point(40, 24);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Mã hóa đơn";
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox1.Controls.Add(this.btnLoc);
            this.groupBox1.Controls.Add(this.dateTimePicker1);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Controls.Add(this.cbxTrangThai);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.ForeColor = System.Drawing.Color.Navy;
            this.groupBox1.Location = new System.Drawing.Point(16, 18);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(496, 412);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin hóa đơn";
            // 
            // btnLoc
            // 
            this.btnLoc.ForeColor = System.Drawing.Color.Navy;
            this.btnLoc.Location = new System.Drawing.Point(352, 43);
            this.btnLoc.Name = "btnLoc";
            this.btnLoc.Size = new System.Drawing.Size(94, 26);
            this.btnLoc.TabIndex = 2;
            this.btnLoc.Text = "Lọc";
            this.btnLoc.UseVisualStyleBackColor = true;
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(103, 48);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(218, 20);
            this.dateTimePicker1.TabIndex = 2;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox2.Controls.Add(this.grdInvoice);
            this.groupBox2.ForeColor = System.Drawing.Color.Navy;
            this.groupBox2.Location = new System.Drawing.Point(6, 91);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(484, 315);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Danh sách hóa đơn";
            // 
            // grdInvoice
            // 
            this.grdInvoice.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdInvoice.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.MaHoaDon,
            this.MaKH,
            this.TongGiaTien,
            this.TrangThai,
            this.NgayLap,
            this.NgayGiao,
            this.DiaChiGiao,
            this.GhiChu});
            this.grdInvoice.Dock = System.Windows.Forms.DockStyle.Fill;
            this.grdInvoice.Location = new System.Drawing.Point(3, 16);
            this.grdInvoice.Name = "grdInvoice";
            this.grdInvoice.Size = new System.Drawing.Size(478, 296);
            this.grdInvoice.TabIndex = 1;
            this.grdInvoice.RowEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.grdInvoice_RowEnter);
            // 
            // MaHoaDon
            // 
            this.MaHoaDon.DataPropertyName = "MaHoaDon";
            this.MaHoaDon.HeaderText = "Mã hóa đơn";
            this.MaHoaDon.Name = "MaHoaDon";
            // 
            // MaKH
            // 
            this.MaKH.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells;
            this.MaKH.DataPropertyName = "MaKH";
            this.MaKH.HeaderText = "Mã khách hàng";
            this.MaKH.Name = "MaKH";
            this.MaKH.Width = 98;
            // 
            // TongGiaTien
            // 
            this.TongGiaTien.DataPropertyName = "TongGiaTien";
            this.TongGiaTien.HeaderText = "Total amount";
            this.TongGiaTien.Name = "TongGiaTien";
            // 
            // TrangThai
            // 
            this.TrangThai.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader;
            this.TrangThai.DataPropertyName = "TrangThai";
            this.TrangThai.HeaderText = "Paid";
            this.TrangThai.Name = "TrangThai";
            this.TrangThai.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.TrangThai.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.TrangThai.Width = 53;
            // 
            // NgayLap
            // 
            this.NgayLap.DataPropertyName = "NgayLap";
            this.NgayLap.HeaderText = "Postting date";
            this.NgayLap.Name = "NgayLap";
            // 
            // NgayGiao
            // 
            this.NgayGiao.DataPropertyName = "NgayGiao";
            this.NgayGiao.HeaderText = "Output date";
            this.NgayGiao.Name = "NgayGiao";
            // 
            // DiaChiGiao
            // 
            this.DiaChiGiao.DataPropertyName = "DiaChiGiao";
            this.DiaChiGiao.HeaderText = "Ship address";
            this.DiaChiGiao.Name = "DiaChiGiao";
            // 
            // GhiChu
            // 
            this.GhiChu.DataPropertyName = "GhiChu";
            this.GhiChu.HeaderText = "Note";
            this.GhiChu.Name = "GhiChu";
            // 
            // cbxTrangThai
            // 
            this.cbxTrangThai.FormattingEnabled = true;
            this.cbxTrangThai.Location = new System.Drawing.Point(103, 21);
            this.cbxTrangThai.Name = "cbxTrangThai";
            this.cbxTrangThai.Size = new System.Drawing.Size(218, 21);
            this.cbxTrangThai.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label2.Location = new System.Drawing.Point(39, 54);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(58, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Chọn ngày";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.SystemColors.WindowText;
            this.label1.Location = new System.Drawing.Point(18, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Chọn trạng thái";
            // 
            // tabPage2
            // 
            this.tabPage2.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage2.Controls.Add(this.groupBox6);
            this.tabPage2.Controls.Add(this.groupBox5);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1059, 479);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Quản Lý Hóa Đơn";
            // 
            // groupBox6
            // 
            this.groupBox6.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox6.Controls.Add(this.dataGridView2);
            this.groupBox6.Location = new System.Drawing.Point(509, 61);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(514, 363);
            this.groupBox6.TabIndex = 1;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Danh sách hóa đơn theo khách hàng";
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column6,
            this.Column7,
            this.Column8,
            this.Column9,
            this.Column10});
            this.dataGridView2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView2.Location = new System.Drawing.Point(3, 16);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.Size = new System.Drawing.Size(508, 344);
            this.dataGridView2.TabIndex = 0;
            // 
            // Column6
            // 
            this.Column6.HeaderText = "STT";
            this.Column6.Name = "Column6";
            // 
            // Column7
            // 
            this.Column7.HeaderText = "Mã HD";
            this.Column7.Name = "Column7";
            // 
            // Column8
            // 
            this.Column8.HeaderText = "Ngày lập";
            this.Column8.Name = "Column8";
            // 
            // Column9
            // 
            this.Column9.HeaderText = "Ngày giao";
            this.Column9.Name = "Column9";
            // 
            // Column10
            // 
            this.Column10.HeaderText = "Đã thanh toán";
            this.Column10.Name = "Column10";
            // 
            // groupBox5
            // 
            this.groupBox5.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox5.Controls.Add(this.listView2);
            this.groupBox5.Location = new System.Drawing.Point(24, 61);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(448, 363);
            this.groupBox5.TabIndex = 0;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Danh sách khách hàng";
            // 
            // listView2
            // 
            this.listView2.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader7,
            this.columnHeader8,
            this.columnHeader9,
            this.columnHeader10,
            this.columnHeader11});
            this.listView2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView2.GridLines = true;
            this.listView2.Location = new System.Drawing.Point(3, 16);
            this.listView2.Name = "listView2";
            this.listView2.Size = new System.Drawing.Size(442, 344);
            this.listView2.TabIndex = 0;
            this.listView2.UseCompatibleStateImageBehavior = false;
            this.listView2.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "Mã KH";
            // 
            // columnHeader8
            // 
            this.columnHeader8.Text = "Tên khách hàng";
            this.columnHeader8.Width = 200;
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "Địa chỉ";
            this.columnHeader9.Width = 200;
            // 
            // columnHeader10
            // 
            this.columnHeader10.Text = "Số điện thoại";
            this.columnHeader10.Width = 100;
            // 
            // columnHeader11
            // 
            this.columnHeader11.Text = "Email";
            this.columnHeader11.Width = 100;
            // 
            // btnThoat
            // 
            this.btnThoat.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnThoat.ForeColor = System.Drawing.Color.Navy;
            this.btnThoat.Location = new System.Drawing.Point(985, 513);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(94, 26);
            this.btnThoat.TabIndex = 2;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            // 
            // frmHoaDon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1091, 548);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.tabControl1);
            this.ForeColor = System.Drawing.Color.Navy;
            this.Name = "frmHoaDon";
            this.Text = "Hóa Đơn";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdProduct)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.grdInvoice)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.groupBox6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.groupBox5.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.DateTimePicker dtOutputDate;
        private System.Windows.Forms.DateTimePicker dtPostingDate;
        private System.Windows.Forms.TextBox txtTenKH;
        private System.Windows.Forms.TextBox txtMaKH;
        private System.Windows.Forms.TextBox txtCount;
        private System.Windows.Forms.TextBox txtMaHD;
        private System.Windows.Forms.CheckBox chkStatus;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cbxTrangThai;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button btnLoc;
        private System.Windows.Forms.Button btnXuatHD;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtPhiVanChuyen;
        private System.Windows.Forms.TextBox txtTT;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.DataGridView grdProduct;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column7;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column8;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column9;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column10;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.ListView listView2;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private System.Windows.Forms.ColumnHeader columnHeader8;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.ColumnHeader columnHeader10;
        private System.Windows.Forms.ColumnHeader columnHeader11;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.DataGridView grdInvoice;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn TenLinhKien;
        private System.Windows.Forms.DataGridViewTextBoxColumn GiaSanPham;
        private System.Windows.Forms.DataGridViewTextBoxColumn SoLuongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn TT;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaHoaDon;
        private System.Windows.Forms.DataGridViewTextBoxColumn MaKH;
        private System.Windows.Forms.DataGridViewTextBoxColumn TongGiaTien;
        private System.Windows.Forms.DataGridViewCheckBoxColumn TrangThai;
        private System.Windows.Forms.DataGridViewTextBoxColumn NgayLap;
        private System.Windows.Forms.DataGridViewTextBoxColumn NgayGiao;
        private System.Windows.Forms.DataGridViewTextBoxColumn DiaChiGiao;
        private System.Windows.Forms.DataGridViewTextBoxColumn GhiChu;
    }
}