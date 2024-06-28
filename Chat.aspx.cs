﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using CsvHelper;
using Newtonsoft.Json;
using OfficeOpenXml;
using Twilio.Http;
using WebGrease.Css.Ast;
using static IronPython.Modules.PythonWeakRef;
using static JobJunction.Company;
using Microsoft.AspNet.SignalR;
using System.Threading;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Calendar.v3;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;

namespace JobJunction
{
    public partial class Chat : System.Web.UI.Page
    {
        string recId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployers();
            }
            else
            {
                string script = @"
                    document.querySelector('#conversation-1').classList.add('active');
                    document.querySelector('.conversation-default').classList.remove('active');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "postbackScript", script, true);
                //ClientScript.RegisterStartupScript(this.GetType(), "window.onload=function() { chat1.server.getStatus(localStorage.getItem('recId1')); };");
                Thread.Sleep(1000);
                recId = ViewState["recId"] as string;
                LoadChat(recId, HttpUtility.UrlDecode(Request.QueryString["text"]));
            }
        }
        private void LoadEmployers()
        {
            string query = "select id, name from Employer";

            using (SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        rptEmployers.DataSource = reader;
                        rptEmployers.DataBind();
                    }
                    reader.Close();
                }
            }
        }

        protected void user_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            user_card.Text = btn.Text;
        }
        protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ChangeLabel")
            {
                // Get the value of the clicked button's command argument (assuming it's the ID)
                string[] args = e.CommandArgument.ToString().Split('|');
                recId = args[0]+"e";
                ViewState["recId"]=recId;
                string name = args[1];
                user_card.Text = name;
                chatMessages.DataSource = null;
                chatMessages.DataBind();
                LoadChat(recId, HttpUtility.UrlDecode(Request.QueryString["text"]));
            }
        }
        private void LoadChat(string id, string from)
        {
            using (var connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\ATOnline\\Desktop\\Job Recommender\\JobJunction\\JobJunction\\App_Data\\Employees.mdf\";Integrated Security=True"))
            {
                var query = "select messageSent,timeDate,senderId,isDoc,isCall from Message where (recieverId = '" + id + "' and senderId = '" + from + "') or (recieverId = '" + from + "' and senderId = '" + id + "')";
                using (var command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            chatMessages.DataSource = reader;
                            chatMessages.DataBind();
                        }
                    }
                }
            }
        }
        protected string GetDivClass(object sender)
        {
            // Your condition to determine the CSS class
            // For example, if text is not null and date is null, return "text-only"
            // If both text and date are not null, return "text-and-date"
            // Otherwise, return a default class
            if (Convert.ToString(sender)==(HttpUtility.UrlDecode(Request.QueryString["text"])))
            {
                return "conversation-item";
            }
            else
                return "conversation-item me";
        }
        protected string GetDocFlag(object sender,object message,object call)
        {
            if(Convert.ToBoolean(call))
            {
                string link = Convert.ToString(message);
                return string.Format("<a href='{0}' >{1}</a>", link, "Audio/Video Call");
            }
            else if(Convert.ToBoolean(sender))
            {
                string filename=Convert.ToString(message);
                return string.Format("<a href='{0}' >{1}</a>",filename,filename.Split('/')[filename.Split('/').Length-1]);
            }
            else
                return string.Format("<p style=\"color:black;\">{0}</p>", Convert.ToString(message));
        }
        protected string GetFileName(object sender)
        {
            string filename=Convert.ToString(sender);
            return filename.Split('/')[filename.Length - 1];
        }

        protected void fileSave(object sender, EventArgs e)
        {
            if(fileInput.HasFile)
            {
                fileInput.SaveAs(Server.MapPath("~/temp/" + fileInput.FileName));
            }
        }
    }
}