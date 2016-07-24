using System;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketballManager
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Players_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                Players.Insert();
                Players.DataBind();
                GridView1.DataSource = Players;
                GridView1.DataBind();
                Response.Write("<script>alert('New player inserted!');</script>");
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error Occured please insert player again');</script>");
                throw;
            }
           
        }
    }
}