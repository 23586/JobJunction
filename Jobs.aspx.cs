using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows.Documents;
using OfficeOpenXml;

namespace JobJunction
{
    public partial class Jobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string fullpath= "C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\Resumes\\" + HttpUtility.UrlDecode(Request.QueryString["text"]) + "\\Recommended Jobs.xlsx";
                var jobs = ReadJobsFromExcel(fullpath);
                JobsRepeater.DataSource = jobs;
                JobsRepeater.DataBind();
            }
        }
        protected void seeCompanies(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "GetData")
            {
                Response.Redirect("~/Companies.aspx?text=" + Request.QueryString["text"]+Server.UrlEncode(" "+e.CommandArgument.ToString()));
                return;
            }
        }
        public void ExecutePythonFunction(string scriptPath, string arguments)
        {
            ProcessStartInfo start = new ProcessStartInfo();
            start.FileName = "python";
            start.Arguments = $"{scriptPath} {arguments}";
            start.UseShellExecute = false;
            start.RedirectStandardOutput = true;
            start.RedirectStandardError = true;
            using (Process process = Process.Start(start))
            {
                process.WaitForExit();
                bool success = (process.ExitCode == 0);
                if (!success)
                {
                    string error = process.StandardError.ReadToEnd();
                    return;
                }
            }
        }
        private List<Job> ReadJobsFromExcel(string filePath)
        {
            var jobs = new List<Job>();
            var fileInfo = new System.IO.FileInfo(filePath);
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (var package = new ExcelPackage(fileInfo))
            {
                var workbook = package.Workbook;
                var worksheet = workbook.Worksheets.First();
                int colCount = worksheet.Dimension.End.Column;
                int rowCount = worksheet.Dimension.End.Row;

                for (int row = 2; row <= rowCount; row++)
                {
                    var job = new Job
                    {
                        Experience = worksheet.Cells[row, 1].Text,
                        JD = worksheet.Cells[row, 2].Text,
                        JobName = worksheet.Cells[row, 3].Text
                    };
                    jobs.Add(job);
                }
            }

            return jobs;
        }
    }

    public class Job
    {
        public string JobName { get; set; }
        public string JD { get; set; }
        public string Experience { get; set; }
    }
}