using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows.Documents;
using OfficeOpenXml;
using static IronPython.SQLite.PythonSQLite;

namespace JobJunction
{
    public partial class ExpiredJobs : System.Web.UI.Page
    {
        string cname;
        protected void Page_Load(object sender, EventArgs e)
        {
            cname = HttpUtility.UrlDecode(Request.QueryString["text"]);
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True");
            SqlCommand command = new SqlCommand("SELECT companyName FROM Employer where id=" + cname, conn);
            try
            {
                conn.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    cname = reader[0].ToString();
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            AppsRepeater.Visible = false;
            if (!IsPostBack)
            {
                var jobs = ReadJobsFromExcel();
                JobsRepeater.DataSource = jobs;
                JobsRepeater.DataBind();
            }
        }
        protected void CloseJob(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "close")
            {
                string[] arguments = e.CommandArgument.ToString().Split('|');
                string jobName = arguments[0];
                string time = arguments[1];
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True");
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("update job set status=1 where jobName=@Jname and companyName like @Cname and datePosted=@Time", conn);
                    cmd.Parameters.AddWithValue("@Jname", jobName);
                    cmd.Parameters.AddWithValue("@Cname", cname + "%");
                    cmd.Parameters.AddWithValue("@Time", time);
                    cmd.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);
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
            else if (e.CommandName == "showapp")
            {
                var apps=new List<Application>();
                string[] info=e.CommandArgument.ToString().Split('|');
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True");
                SqlCommand command = new SqlCommand("SELECT userID FROM Application where companyName like @Cname and jobName=@Jname and datePosted=@Time", conn);
                command.Parameters.AddWithValue("@Jname", info[0]);
                command.Parameters.AddWithValue("@Cname", info[1] + "%");
                command.Parameters.AddWithValue("@Time", info[2]);
                try
                {
                    conn.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        var app = new Application
                        {
                            userid = Convert.ToInt32(reader[0].ToString()),
                            jname = info[0],
                            cName = info[1],
                            time = info[2]
                        };
                        reader.Close();
                        command = new SqlCommand("SELECT name,email,contact,skills,address FROM Employee where Id=" + app.userid.ToString(), conn);
                        reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            app.Name = reader[0].ToString();
                            app.Email = reader[1].ToString();
                            app.Contact = reader[2].ToString();
                            app.Skill = reader[3].ToString();
                            app.Location = reader[4].ToString();
                        }
                        apps.Add(app);
                    }
                    AppsRepeater.DataSource = apps;
                    AppsRepeater.DataBind();
                    AppsRepeater.Visible=true;
                    reader.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
        private List<CompanyJob> ReadJobsFromExcel()
        {
            var jobs = new List<CompanyJob>();
            using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT jobName,experienceRequired,jobDesc,city,datePosted FROM Job where companyName like @Cname and status=0", conn);
                command.Parameters.AddWithValue("@Cname", cname+"%");
                try
                {
                    conn.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        var job = new CompanyJob
                        {
                            JobName = reader[0].ToString(),
                            JD = reader[2].ToString(),
                            Experience = reader[1].ToString(),
                            City = reader[3].ToString(),
                            Time = reader[4].ToString()
                        };
                        job.JT = job.JobName + "|" + job.Time;
                        job.application = job.JobName + "|" + cname + "|" + job.Time;
                        jobs.Add(job);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return jobs;
        }
    }
}
public class Application
{
    public string jname { get; set; }
    public string cName { get; set; }
    public string time { get; set; }
    public int userid { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Contact { get; set; }
    public string Skill { get; set; }
    public string Location { get; set; }
}