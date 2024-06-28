using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobJunction
{
    public partial class EmployeeHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                username.InnerText="Hi, " + Session["username"]+". Find out the latest Jobs with us.";
            }
        }

        protected void Get_Button_Click(object sender, EventArgs e)
        {
            // Redirect to home.axpx
            Response.Redirect("SignUp.aspx");
        }
         protected void Get_Button_ClickEmp(object sender, EventArgs e)
        {
            // Redirect to home.axpx
            Response.Redirect("EmployerSignUp.aspx");
        }
        protected void Len_Button_Click(object sender, EventArgs e)
        {
            // Redirect to home.axpx
            Response.Redirect("Work.aspx");
        }
    }
}