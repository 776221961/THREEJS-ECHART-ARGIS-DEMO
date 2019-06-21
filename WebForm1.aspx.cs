using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sample1_1
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        public int count = 0;
        public List<float> jd = new List<float>();
        public List<float> wd = new List<float>();
        public DataSet ds = new DataSet();
        public int len = 0;
        public int k = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select count(*) from jwd";
            count = dbhelper.excnonquery(sql);
            string sql2 = "select * from jwd";
            ds = dbhelper.exedataset(sql2);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                jd.Add(float.Parse(dr[0].ToString()));
                wd.Add(float.Parse(dr[1].ToString()));

            }
            len = jd.Count;


        }
    }
}