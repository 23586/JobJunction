using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobJunction
{
    public partial class EmployerSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            if(Password.Text!=ConfirmP.Text)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "Error! Password not confirmed.", true);
                return;
            }
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True");
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into employer (email,name,password,companyName,contact,address) values (@Email,@Name,@Password,@CompanyName,@Contact,@Address)", conn);
                cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Password", Password.Text);
                cmd.Parameters.AddWithValue("@CompanyName", CompanyName.Text);
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text+" "+TextBox2.Text);
                cmd.Parameters.AddWithValue("@Contact", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Address", TextBox5.Text);
                cmd.ExecuteNonQuery();
                Response.Redirect("~/SignIn.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}