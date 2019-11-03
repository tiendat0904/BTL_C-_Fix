using System;
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
using System.Data.SqlClient;
using QLBH.Repository;
using System.Data.Common;

namespace QLBH
{
    public partial class frm_chitietdatban : DevExpress.XtraEditors.XtraForm
    {
        List<Class_ChiTietPhieuDB> Test;
        List<Class_MonAn> MonAn;
        List<Class_LoaiMon> LM;
        List<Class_PhieuDatBan> DB;
        ConnectAndQuery query = new ConnectAndQuery();
        public frm_chitietdatban()
        {
            InitializeComponent();
            fill();
        }
        private List<Class_ChiTietPhieuDB> test1()
        {
            string sql = "SELECT * FROM ChiTietPhieuDB";
            List<Class_ChiTietPhieuDB> list = new List<Class_ChiTietPhieuDB>();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=DESKTOP-MFCIF4Q\SQLEXPRESS;Initial Catalog=QLNhaHang;Integrated Security=True";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            using (DbDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string MaPhieu = reader.GetString(0);
                        string MaMonAn = reader.GetString(1);
                        string MaLoai = reader.GetString(2);
                        double SoLuong = reader.GetDouble(3);
                        decimal GiamGia = reader.GetDecimal(4);
                        decimal ThanhTien = reader.GetDecimal(5);
                        Class_ChiTietPhieuDB Test = new Class_ChiTietPhieuDB(MaPhieu, MaMonAn, MaLoai, SoLuong, GiamGia, ThanhTien);
                        list.Add(Test);
                    }
                }
            }
            con.Close();
            return list;
        }
        private void fill()
        {
            DataTable data = query.DocBang("select * from ChiTietPhieuDB");
            dataGridView1.DataSource = data;
        }

        private void Btn_Add_Click(object sender, EventArgs e)
        {
            Test = test1();
            bool check = false;

            for (int i = 0; i < Test.Count; i++)
            {
                if (Test[i].MaPhieu1.Equals(txt_LoaiBenh.Text))
                {
                    check = true;
                    MessageBox.Show("đã có mã phiếu này, vui lòng nhập lại");
                    break;
                }
            }

            DB = new frm_DatBan().test1();
            bool db = false;
            for (int i = 0; i < DB.Count; i++)
            {
                if (DB[i].MaPhieu1.Equals(txt_STT.Text))
                {
                    db = true;
                    break;
                }
            }
            if (db == false)
            {
                MessageBox.Show("Chưa có phiếu đặt bàn này!", "Thông báo");
            }

            MonAn = new frm_MonAn().Select();
            LM = new frm_LoaiMonAn().Select();
            bool lm = false, MA = false;
            for (int i = 0; i < LM.Count; i++)
            {
                if (LM[i].MaLoai1.Equals(txt_STT.Text))
                {
                    lm = true;
                    break;
                }
            }
            if (lm == false)
            {
                MessageBox.Show("Chưa có mã loại món ăn này!", "Thông báo");
            }
            else
            {
                for (int i = 0; i < MonAn.Count; i++)
                {
                    if (MonAn[i].MaMonAn1.Equals(textEdit1.Text))
                    {
                        MA = true;
                        break;
                    }
                }
                if (MA == false)
                {
                    MessageBox.Show("Chưa có mã món ăn này!", "Thông báo");
                }
            }




            decimal x;
            if (check == false && !decimal.TryParse(textEdit3.Text, out x))
            {
                check = true;
                MessageBox.Show("Nhập sai dữ liệu giảm giá, vui lòng nhập lại!!");
            }

            if (check == false && !decimal.TryParse(textEdit4.Text, out x))
            {
                check = true;
                MessageBox.Show("Nhập sai dữ liệu thành tiền, vui lòng nhập lại!!");
            }
            double y;
            if (check == false && !double.TryParse(textEdit2.Text, out y))
            {
                check = true;
                MessageBox.Show("Nhập sai dữ liệu số lượng, vui lòng nhập lại!!");
            }

            if (check == false && lm==true && MA==true && db==true)
            {
                if (textEdit1.Text.Trim() != "" && txt_LoaiBenh.Text.Trim() != "" && txt_STT.Text.Trim() != "" && textEdit2.Text.Trim() != "" && textEdit3.Text.Trim() != "" && textEdit4.Text.Trim() != "")
                {
                    string sql = "insert into ChiTietPhieuDB values(" + "N'" + txt_LoaiBenh.Text + "',N'" + textEdit1.Text + "',N'" + txt_STT.Text + "','" + Convert.ToDouble(textEdit2.Text) + "','" + Convert.ToDecimal(textEdit3.Text) + "','" + Convert.ToDecimal(textEdit4.Text) + "')";
                    query.CapNhatDuLieu(sql);
                    fill();

                    //Test1.Add(new Class_PhieuDatBan(txt_LoaiBenh.Text, txt_STT.Text, textEdit1.Text, Convert.ToDateTime(textEdit2.Text), Convert.ToDateTime(textEdit3.Text), Convert.ToDecimal(textEdit4.Text)));
                    textEdit1.Text = "";
                    txt_LoaiBenh.Text = "";
                    txt_STT.Text = "";
                    textEdit4.Text = "";
                    textEdit3.Text = "";
                    textEdit2.Text = "";
                    textEdit1.Enabled = true;
                }
                else
                {
                    MessageBox.Show("vui lòng nhập đầy đủ thông tin");
                }
            }
        }

        private void Btn_refesrh_Click(object sender, EventArgs e)
        {
            Test = test1();
            bool check = false;

            MonAn = new frm_MonAn().Select();
            LM = new frm_LoaiMonAn().Select();
            bool lm = false, MA = false;
            for (int i = 0; i < LM.Count; i++)
            {
                if (LM[i].MaLoai1.Equals(txt_STT.Text))
                {
                    lm = true;
                    break;
                }
            }
            if (lm == false)
            {
                MessageBox.Show("Chưa có mã loại món ăn này!", "Thông báo");
            }
            else
            {
                for (int i = 0; i < MonAn.Count; i++)
                {
                    if (MonAn[i].MaMonAn1.Equals(textEdit1.Text))
                    {
                        MA = true;
                        break;
                    }
                }
                if (MA == false)
                {
                    MessageBox.Show("Chưa có mã món ăn này!", "Thông báo");
                }
            }


            decimal x;
            if (check == false && !decimal.TryParse(textEdit3.Text, out x))
            {
                check = true;
                MessageBox.Show("Nhập sai dữ liệu giảm giá, vui lòng nhập lại!!");
            }

            if (check == false && !decimal.TryParse(textEdit4.Text, out x))
            {
                check = true;
                MessageBox.Show("Nhập sai dữ liệu thành tiền, vui lòng nhập lại!!");
            }
            double y;
            if (check == false && !double.TryParse(textEdit2.Text, out y))
            {
                check = true;
                MessageBox.Show("Nhập sai dữ liệu số lượng, vui lòng nhập lại!!");
            }
            if (check == false && lm==true && MA ==true)
            {
                if (textEdit1.Text.Trim() != "" && txt_LoaiBenh.Text.Trim() != "" && txt_STT.Text.Trim() != "" && textEdit2.Text.Trim() != "" && textEdit3.Text.Trim() != "" && textEdit4.Text.Trim() != "")
                {
                    string sql = "UPDATE ChiTietPhieuDB set MaMonAn=N'" + textEdit1.Text + "',MaLoai=N'" + txt_STT.Text + "',SoLuong='" + Convert.ToDouble(textEdit2.Text) + "',GiamGia='" + Convert.ToDecimal(textEdit3.Text) + "',ThanhTien='" + Convert.ToDecimal(textEdit4.Text) + "' where MaPhieu=N'"+txt_LoaiBenh.Text+"'";
                    query.CapNhatDuLieu(sql);
                    fill();

                    //Test1.Add(new Class_PhieuDatBan(txt_LoaiBenh.Text, txt_STT.Text, textEdit1.Text, Convert.ToDateTime(textEdit2.Text), Convert.ToDateTime(textEdit3.Text), Convert.ToDecimal(textEdit4.Text)));
                    textEdit1.Text = "";
                    txt_LoaiBenh.Text = "";
                    txt_STT.Text = "";
                    textEdit4.Text = "";
                    textEdit3.Text = "";
                    textEdit2.Text = "";
                    textEdit1.Enabled = true;
                }
                else
                {
                    MessageBox.Show("vui lòng nhập đầy đủ thông tin");
                }
            }
        }

        private void Btn_Delete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("bạn có muốn xóa không ?", "thông báo", MessageBoxButtons.YesNo,
               MessageBoxIcon.Question) == DialogResult.Yes)
            {
                string sql = "delete from ChiTietPhieuDB where MaPhieu=N'" + txt_LoaiBenh.Text + "'";
                query.CapNhatDuLieu(sql);
                fill();
                textEdit1.Text = "";
                txt_LoaiBenh.Text = "";
                txt_STT.Text = "";
                textEdit4.Text = "";
                textEdit3.Text = "";
                textEdit2.Text = "";
                textEdit1.Enabled = true;
            }
        }

        private void Btn_close_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("ban co muon thoat khong ?", "thong bao", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void DataGridView1_DoubleClick(object sender, EventArgs e)
        {
            txt_LoaiBenh.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            textEdit1.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txt_STT.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            textEdit2.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            textEdit3.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            textEdit4.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
        }
    }
}