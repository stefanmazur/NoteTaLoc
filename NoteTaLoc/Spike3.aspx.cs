using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NoteTaLoc
{
    public partial class Spike3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Response.Redirect("Spike3.aspx?lon=" + row.Cells[2].Text.Replace(",","_") + "&lat=" + row.Cells[3].Text.Replace(",","_"));
        }


    }
}