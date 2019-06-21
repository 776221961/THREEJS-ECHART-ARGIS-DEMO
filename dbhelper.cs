using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Management;
using System.Text;


namespace Sample1_1
{
    public static class dbhelper
    {
        //   private readonly static string constr = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        private readonly static string constr = @"data source=DESKTOP-5T6FUVV;initial catalog=jxc;user id=sa;password=sanyjbz";
        public static int excnonquery(string sql, params SqlParameter[] pms)
        {
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand scd = new SqlCommand(sql, conn))
                {
                    if (pms != null)
                    {
                        scd.Parameters.AddRange(pms);
                    }
                    conn.Open();
                    return scd.ExecuteNonQuery();
                }

            }
        }

        public static Object excscalar(string sql, params SqlParameter[] pms)
        {
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand scd = new SqlCommand(sql, conn))
                {
                    if (pms != null)
                    {
                        scd.Parameters.AddRange(pms);
                    }
                    conn.Open();
                    return scd.ExecuteScalar();
                }

            }
        }

        public static SqlDataReader exereader(string s, params SqlParameter[] pms)
        {
            SqlConnection con = new SqlConnection(constr);
            using (SqlCommand cmd = new SqlCommand(s, con))
            {
                if (pms != null)
                {
                    cmd.Parameters.AddRange(pms);
                }
                try
                {
                    con.Open();
                    return cmd.ExecuteReader(CommandBehavior.CloseConnection);
                }
                catch
                {
                    con.Close();
                    con.Dispose();
                    throw;
                }

            }
        }

        public static DataTable exedatatable(string sql, params SqlParameter[] pms)
        {
            DataTable table = new DataTable();
            using (SqlDataAdapter sdp = new SqlDataAdapter(sql, constr))
            {
                if (pms != null)
                {
                    sdp.SelectCommand.Parameters.AddRange(pms);
                }
                sdp.Fill(table);
            }
            return table;

        }
        public static DataSet exedataset(string sql, params SqlParameter[] pms)
        {
            DataSet ds = new DataSet();
            using (SqlDataAdapter sdp = new SqlDataAdapter(sql, constr))
            {
                if (pms != null)
                {
                    sdp.SelectCommand.Parameters.AddRange(pms);
                }
                sdp.Fill(ds);
            }
            return ds;
        }
    }
}