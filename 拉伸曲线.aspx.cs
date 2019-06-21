using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sample1_1
{
    public partial class 拉伸曲线 : System.Web.UI.Page
    {
        public int count = 0;
        public List<float> x = new List<float>();
        public List<float> y = new List<float>();
        public List<float> z = new List<float>();
        public DataSet ds = new DataSet();
        public int len = 0;
        public int k = 0;

        public int count2 = 0;
        public List<float> x2 = new List<float>();
        public List<float> y2 = new List<float>();
        public List<float> z2 = new List<float>();
        public DataSet ds2 = new DataSet();
        public int len2 = 0;
        public int k2 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select count(*) from xyz";
            count = dbhelper.excnonquery(sql);
            string sql2 = "select * from xyz";
            ds = dbhelper.exedataset(sql2);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                x.Add(float.Parse(dr[0].ToString()));
                y.Add(float.Parse(dr[1].ToString()));
                z.Add(float.Parse(dr[2].ToString()));

            }
            len = x.Count;
            ///////////
            string sql3 = "select count(*) from xyz2";
            count = dbhelper.excnonquery(sql3);
            string sql4 = "select * from xyz2";
            ds2 = dbhelper.exedataset(sql4);
            foreach (DataRow dr in ds2.Tables[0].Rows)
            {
                x2.Add(float.Parse(dr[0].ToString()));
                y2.Add(float.Parse(dr[1].ToString()));
                z2.Add(float.Parse(dr[2].ToString()));

            }
            len2 = x2.Count;

        }
    }
}