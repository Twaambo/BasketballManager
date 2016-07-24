using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BasketballManager
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)Statistics.Select(args);
            DataTable dt = view.ToTable();
            List<GamePlayed> gpl = new List<GamePlayed>();


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GamePlayed g = new GamePlayed(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString(), int.Parse(dt.Rows[i][2].ToString()));
                gpl.Add(g);
            }

            gpl.ForEach(z => z.Points =
            gpl.Where(x => x.Firstname == z.Firstname).Sum(y => y.Points) + 0);

            List<GamePlayed> distinctItems = gpl.GroupBy(x => x.Firstname).Select(y => y.First()).ToList();
            distinctItems.Sort((s2, s1) => s1.Points.CompareTo(s2.Points));

            DataTable dtx = new DataTable();
            dtx.Columns.Add("First Name", typeof(string));
            dtx.Columns.Add("Last Name", typeof(string));
            dtx.Columns.Add("Points total", typeof(int));


            if (distinctItems != null)
            {
                foreach (GamePlayed g in distinctItems)
                {

                    DataRow row1 = dtx.NewRow();
                    row1["First Name"] = g.Firstname;
                    row1["Last Name"] = g.Lastname;
                    row1["Points total"] = g.Points;
                    dtx.Rows.Add(row1);

                }
            }

            GridView1.DataSource = dtx;
            GridView1.DataBind();

        }
        
    }


}