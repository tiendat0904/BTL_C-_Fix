﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using QLBH.Model_Class;
using QLBH.Repository;
using System.Data.SqlClient;
using System.Data.Common;

namespace QLBH
{
    public partial class frm_HoaDon : DevExpress.XtraEditors.XtraForm
    {
        List<Class_HoaDonNhap> hoaDonNhap;
        List<Class_NhanVien> nhanVien;
        List<Class_NhaCungCap> nhaCungCap;
        ConnectAndQuery query = new ConnectAndQuery();
        public frm_HoaDon()
        {
            InitializeComponent();
        }
        public new List<Class_HoaDonNhap> Select()
        {
            string sql = "Select * from HoaDonNhap";
            List<Class_HoaDonNhap> list = new List<Class_HoaDonNhap>();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=DESKTOP-RPK6PAD\SQLEXPRESS;Initial Catalog=QLNhaHang;Integrated Security=True";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            using (DbDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                    while (reader.Read())
                    {
                        String MaHoaDonNhap = reader.GetString(0);
                        DateTime NgayNhap = reader.GetDateTime(1);
                        String MaNhanVien = reader.GetString(2);
                        String MaNhaCungCap = reader.GetString(3);
                        decimal TongTien = reader.GetDecimal(4);
                        Class_HoaDonNhap hoaDonNhap1 = new Class_HoaDonNhap(MaHoaDonNhap, NgayNhap, MaHoaDonNhap, MaNhaCungCap, TongTien);
                        list.Add(hoaDonNhap1);
                    }
            }
            con.Close();
            return list;
        }
        private void fill()
        {
            dataGridView1.DataSource = query.DocBang("select * from HoaDonNhap");
        }

        private void add()
        {
            nhaCungCap = new frm_NCC().Select();
            nhanVien = new frm_HoSoNhanVien().Select();
            for(int i = 0; i < nhaCungCap.Count; i++)
            {
                cb_manhacc.Items.Add(nhaCungCap[i].MaNhaCungCap1);
            }
            for (int i = 0; i < nhanVien.Count; i++)
            {
                cb_manv.Items.Add(nhanVien[i].MaNhanVien1);
            }
        }

        private void Btn_close_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                this.Close();

        }

        private void Btn_Add_Click(object sender, EventArgs e)
        {
            nhaCungCap = new frm_NCC().Select();
            nhanVien = new frm_HoSoNhanVien().Select();
            hoaDonNhap = Select();
            bool ncc = false, nv = false;
            bool check = false;
            for (int i = 0; i < hoaDonNhap.Count; i++)
            {
                if (hoaDonNhap[i].MaHoaDonNhap1.Equals(txt_MaHoaDon.Text))
                {
                    check = true;
                    MessageBox.Show("Đã có dữ liệu");
                    break;
                }
            }

            for (int i = 0; i < nhaCungCap.Count; i++)
            {
                if (nhaCungCap[i].MaNhaCungCap1.Equals(cb_manhacc.Text))
                {
                    ncc = true;
                    break;
                }
            }
            if (ncc == false)
            {
                MessageBox.Show("Bạn chưa có mã nhà cung cấp này");
            }
            else
            {
                for (int i = 0; i < nhanVien.Count; i++)
                {
                    if (nhanVien[i].MaNhanVien1.Equals(cb_manv.Text))
                    {
                        nv = true;
                        break;
                    }
                }
                if (nv == false)
                {
                    MessageBox.Show("Bạn chưa có mã nhân viên này");
                }
            }
            decimal x;
            bool number = false;
            if (!decimal.TryParse(txt_TongTien.Text, out x))
            {
                number = true;
                MessageBox.Show("Bạn cần nhập số");

            }



            if (check == false && nv == true && ncc == true && number == false)
            {
                if (txt_MaHoaDon.Text.Trim() != "" && cb_manhacc.Text.Trim() != "" && cb_manv.Text.Trim() != ""  && txt_TongTien.Text.Trim() != "")
                {

                    string sql = "insert into HoaDonNhap values(N'" + txt_MaHoaDon.Text + "',N'" + dateTimePicker1.Value + "',N'" + cb_manv.Text + "',N'" + cb_manhacc.Text + "',N'" + txt_TongTien.Text + "')";
                    query.CapNhatDuLieu(sql);
                    fill();
                    hoaDonNhap.Add(new Class_HoaDonNhap(txt_MaHoaDon.Text, dateTimePicker1.Value, cb_manv.Text, cb_manhacc.Text, Convert.ToDecimal(txt_TongTien.Text)));
                    txt_MaHoaDon.Text = "";
                    cb_manhacc.Text = "";
                    cb_manv.Text = "";
                    dateTimePicker1.Value = DateTime.Today;
                    txt_TongTien.Text = "";
                    txt_MaHoaDon.Focus();

                }
                else
                {
                    MessageBox.Show("Vui lòng nhập đầy đủ thông tin");
                }
            }
        }

        private void Btn_Delete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                string sql = "delete from HoaDonNhap where MaHoaDonNhap=N'" + txt_MaHoaDon.Text + "'";
                query.CapNhatDuLieu(sql);
                fill();
                txt_MaHoaDon.Enabled = true;
                cb_manhacc.Text = "";
                cb_manv.Text = "";
                dateTimePicker1.Value = DateTime.Today;
                txt_TongTien.Text = "";
                txt_MaHoaDon.Text = "";
            }
        }

        private void DataGridView1_DoubleClick(object sender, EventArgs e)
        {
            txt_MaHoaDon.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            dateTimePicker1.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            cb_manv.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            cb_manhacc.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txt_TongTien.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
        }

        private void Btn_refesrh_Click(object sender, EventArgs e)
        {
            nhaCungCap = new frm_NCC().Select();
            nhanVien = new frm_HoSoNhanVien().Select();
            hoaDonNhap = Select();
            bool ncc = false, nv = false;


            for (int i = 0; i < nhaCungCap.Count; i++)
            {
                if (nhaCungCap[i].MaNhaCungCap1.Equals(cb_manhacc.Text))
                {
                    ncc = true;
                    break;
                }
            }
            if (ncc == false)
            {
                MessageBox.Show("Bạn chưa có mã nhà cung cấp này");
            }
            else
            {
                for (int i = 0; i < nhanVien.Count; i++)
                {
                    if (nhanVien[i].MaNhanVien1.Equals(cb_manv.Text))
                    {
                        nv = true;
                        break;
                    }
                }
                if (nv == false)
                {
                    MessageBox.Show("Bạn chưa có mã nhân viên này");
                }
            }
            decimal x;
            bool number = false;
            if (!decimal.TryParse(txt_TongTien.Text, out x))
            {
                number = true;
                MessageBox.Show("Bạn cần nhập số");

            }

            if (number == false && ncc == true && nv == true && txt_MaHoaDon.Text.Trim() != "" && cb_manhacc.Text.Trim() != "" && cb_manv.Text.Trim() != "" && txt_TongTien.Text.Trim() != "")
            {
                String sql = "update HoaDonNhap set NgayNhap=N'" + dateTimePicker1.Value + "', MaNhanVien=N'" + cb_manv.Text + "', MaNhaCungCap=N'" + cb_manhacc.Text + "', TongTien=N'" + "' where MaHoaDonNhap = N'" + txt_MaHoaDon.Text + "'";
                query.CapNhatDuLieu(sql);
                fill();
                hoaDonNhap.Add(new Class_HoaDonNhap(txt_MaHoaDon.Text,dateTimePicker1.Value, cb_manv.Text, cb_manhacc.Text, Convert.ToDecimal(txt_TongTien.Text)));
                txt_MaHoaDon.Text = "";
                dateTimePicker1.Value = DateTime.Today;
                cb_manhacc.Text = "";
                cb_manv.Text = "";
                txt_TongTien.Text = "";
                txt_MaHoaDon.Enabled = true;
                txt_MaHoaDon.Focus();
            }
            else
            {
                MessageBox.Show("Bạn hãy nhập đủ thông tin khách hàng");
            }
        }

        private void Frm_HoaDon_Load(object sender, EventArgs e)
        {
            fill();
            txt_MaHoaDon.Focus();
            add();
            txt_TongTien.Enabled = false;
        }
    }
}