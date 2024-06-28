using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobJunction
{
    public partial class AfterSignChat : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RateComp(object sender, EventArgs e)
        {
            Response.Redirect("~/Rate.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeJobs(object sender, EventArgs e)
        {
            Response.Redirect("~/Jobs.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeChats(object sender, EventArgs e)
        {
            Response.Redirect("~/Chat.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]+"em"));
        }
        protected void SeeFeatures(object sender, EventArgs e)
        {
            Response.Redirect("~/Feat2.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void ContactUs(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact3.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeProfile(object sender, EventArgs e)
        {
            Response.Redirect("~/Prof.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeHome(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployeeHome.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
    }
}