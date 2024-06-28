using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobJunction
{
    public partial class EmployerAfterSign : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SeeActive(object sender, EventArgs e)
        {
            Response.Redirect("~/ActiveJobs.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeExpired(object sender, EventArgs e)
        {
            Response.Redirect("~/ExpiredJobs.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeChats(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployerChat.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]+"e"));
        }
        protected void SeeGraph(object sender, EventArgs e)
        {
            Response.Redirect("~/RatingGraph.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeFeatures(object sender, EventArgs e)
        {
            Response.Redirect("~/Feat.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void ContactUs(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact2.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
        protected void SeeHome(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployerHome.aspx?text=" + HttpUtility.UrlDecode(Request.QueryString["text"]));
        }
    }
}