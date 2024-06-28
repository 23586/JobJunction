using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Diagnostics;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using IronPython.Hosting;
using Microsoft.Scripting.Hosting;
using System.IO;
using System.Data.SqlClient;
using System.Web.Optimization;

namespace JobJunction
{
    public partial class Companies : System.Web.UI.Page
    {
        int id;
        string jobName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["text"] != null)
            {
                string job = HttpUtility.UrlDecode(Request.QueryString["text"]).Split('+')[0];
                jobName = "";
                id = Convert.ToInt32(job[0].ToString());
                int index = 1;
                while (index < job.Split(' ').Length)
                {
                    jobName += job.Split(' ')[index] + " ";
                    index++;
                }
                ExecutePythonFunction("C:\\Users\\ATOnline\\Desktop\\recommend_companies.py","\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\Resumes\\"+id.ToString()+"\"",jobName);
            }
            else
            {
                Response.Redirect("~/ErrorPage.aspx");
            }
            if (!IsPostBack)
            {
                var jobs = ReadJobsFromExcel("C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\Resumes\\" + id.ToString() + "\\Companies.xlsx");
                JobsRepeater.DataSource = jobs;
                JobsRepeater.DataBind();
            }
        }
        private List<CompanyItem> ReadJobsFromExcel(string filePath)
        {
            var companies = new List<CompanyItem>();
            var fileInfo = new System.IO.FileInfo(filePath);

            using (var package = new ExcelPackage(fileInfo))
            {
                var workbook = package.Workbook;
                var worksheet = workbook.Worksheets.First();
                int colCount = worksheet.Dimension.End.Column;
                int rowCount = worksheet.Dimension.End.Row;

                for (int row = 2; row <= rowCount; row++)
                {
                    var company = new CompanyItem
                    {
                        CompanyName = worksheet.Cells[row, 2].Text,
                        Experience = worksheet.Cells[row, 3].Text,
                        JD = worksheet.Cells[row, 4].Text,
                        City = worksheet.Cells[row, 5].Text,
                        Time = worksheet.Cells[row, 6].Text,
                        status = Convert.ToBoolean(Convert.ToInt32(worksheet.Cells[row,7].Text))
                    };
                    company.NT=company.CompanyName+"|"+company.Time;
                    companies.Add(company);
                }
            }

            return companies;
        }
        public void ExecutePythonFunction(string scriptPath, params string[] arguments)
        {
            ProcessStartInfo start = new ProcessStartInfo();
            start.FileName="python";
            start.Arguments = $"{scriptPath} {arguments[0]} {arguments[1]}";
            start.UseShellExecute = false;
            start.RedirectStandardOutput = true;
            start.RedirectStandardError=true;
            using (Process process = Process.Start(start))
            {
                process.WaitForExit();
                bool success=(process.ExitCode == 0);
                if (!success) 
                {
                    string error=process.StandardError.ReadToEnd();
                    return;
                }
            }
        }
        protected void ChangeStatus(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myDataItem = e.Item.DataItem as CompanyItem; // Cast to your data item type
                Button myButton = (Button)e.Item.FindControl("status");

                if (myDataItem != null && myButton != null)
                {
                    if (myDataItem.status)
                    {
                        myButton.Style["background-color"] = "green";
                        myButton.Text = "Open";
                    }
                    else
                    {
                        myButton.Style["background-color"] = "red";
                        myButton.Text = "Expired";
                    }
                    
                }
            }
        }

        protected void ApplyButton(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "apply")
            {
                string[] arguments = e.CommandArgument.ToString().Split('|');
                string companyName = arguments[0];
                string time = arguments[1];
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True");
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("insert into application (jobName,companyName,datePosted,userID) values (@Jname,@Cname,@Time,@ID)", conn);
                    cmd.Parameters.AddWithValue("@Jname", jobName);
                    cmd.Parameters.AddWithValue("@Cname", companyName);
                    cmd.Parameters.AddWithValue("@Time", time);
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert(\"You have already applied to this job.\")", true);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

    }

    public class CompanyItem
    {
        public string City { get; set; }
        public string CompanyName { get; set; }
        public string Experience { get; set; }
        public string Time { get; set; }
        public string JD { get; set; }
        public bool status { get; set; }    
        public string NT { get; set; }

    }
}