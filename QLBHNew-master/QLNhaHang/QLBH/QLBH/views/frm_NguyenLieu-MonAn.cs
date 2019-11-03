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
    public partial class frm_NguyenLieu_MonAn : DevExpress.XtraEditors.XtraForm
    {
        List<Class_NguyenLieu_MonAn> Test;
        List<Class_MonAn> MonAn = new List<Class_MonAn>();
        List<Class_NguyenLieu> NL = new List<Class_NguyenLieu>();
        ConnectAndQuery query = new ConnectAndQuery();
        public frm_NguyenLieu_MonAn()
        {
            InitializeComponent();
            fill();
        }
        private void fill()
        {
            DataTable data = query.DocBang("select * from NguyenLieu_MonAn");
            dataGridView1.DataSource = data;
        }
        private List<Class_NguyenLieu_MonAn> test1()
        {
            string sql = "SELECT * FROM NguyenLieu_MonAn";
            List<Class_NguyenLieu_MonAn> list = new List<Class_NguyenLieu_MonAn>();
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
                        string MaMonAn = reader.GetString(0);
                        string MaNguyenLieu = reader.GetString(1);
                        double SoLuong = reader.GetDouble(1);
                        Class_NguyenLieu_MonAn Test = new Class_NguyenLieu_MonAn(MaMonAn, MaNguyenLieu, SoLuong);
                        list.Add(Test);
                    }
                }
            }
            con.Close();
            return list;
        }

        private void labelControl1_Click(object sender, EventArgs e)
        {

        }

        private void Btn_Delete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("bạn có muốn xóa không ?", "thông báo", MessageBoxButtons.YesNo,
              MessageBoxIcon.Question) == DialogResult.Yes)
            {
                string sql = "delete from NguyenLieu_MonAn where MaMonAn=N'" + txt_LoaiBenh.Text + "' and MaNguyenLieu=N'" + txt_STT.Text + "'";
                query.CapNhatDuLieu(sql);
                fill();

                txt_LoaiBenh.Text = "";
                txt_STT.Text = "";
                textEdit1.Text = "";
            }
        }

        private void Btn_refesrh_Click(object sender, EventArgs e)
        {
            if (txt_LoaiBenh.Text.Trim() != "" && txt_STT.Text.Trim() != "" && textEdit1.Text.Trim() != "")
            {
                string sql = "UPDATE NguyenLieu_MonAn set SoLuong = '"+Convert.ToDouble(textEdit1.Text)+"' where MaMonAn=N'"+txt_LoaiBenh.Text+"' and MaNguyenLieu=N'"+txt_STT.Text+"'";
                query.CapNhatDuLieu(sql);
                fill();


                txt_LoaiBenh.Text = "";
                txt_STT.Text = "";
            }
            else
            {
                MessageBox.Show("vui lòng nhập đầy đủ thông tin");
            }
        }

        private void Btn_Add_Click(object sender, EventArgs e)
        {
            bool MA = false;
            bool nl = false;
            MonAn = new frm_MonAn().Select();
            NL = new frm_NguyenLieu().Select();
            for (int i = 0; i < MonAn.Count; i++)
            {
                if (MonAn[i].MaMonAn1.Equals(txt_LoaiBenh.Text))
                {
                    MA = true;
                    break;
                }
            }

            if (MA == false)
            {
                MessageBox.Show("Chưa có mã món ăn " + txt_LoaiBenh.Text, "Thông báo");
            }
            else
            {
                for (int i = 0; i < NL.Count; i++)
                {
                    if (NL[i].MaNguyenLieu1.Equals(txt_STT.Text))
                    {
                        nl = true;
                        break;
                    }
                }

                if (nl == false)
                {
                    MessageBox.Show("chưa có mã nguyên liệu " + txt_STT.Text, "Thông báo");
                }
            }

            

            if (MA == true && nl == true && txt_LoaiBenh.Text.Trim() != "" && txt_STT.Text.Trim() != "" && textEdit1.Text.Trim() != "")
            {
                string sql = "insert into NguyenLieu_MonAn values(N'" + txt_LoaiBenh.Text + "',N'" + txt_STT.Text + "','" + Convert.ToDouble(textEdit1.Text) + "')";
                query.CapNhatDuLieu(sql);
                fill();


                txt_LoaiBenh.Text = "1";
                txt_STT.Text = "1";
                textEdit1.Text = "1";
            }
            else
            {
                MessageBox.Show("vui lòng nhập đầy đủ thông tin");
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
            txt_STT.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            textEdit1.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
        }
    }
}