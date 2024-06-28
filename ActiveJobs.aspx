<%@ Page Title="" Language="C#" MasterPageFile="~/EmployerAfterSign.Master" AutoEventWireup="true" CodeBehind="ActiveJobs.aspx.cs" Inherits="JobJunction.ActiveJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="jobs.css" rel="stylesheet" type="text/css" />
    <link href="sign.css" rel="stylesheet" type="text/css" />--%>
    <!-- Include jQuery, if it's not already included -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

    <!-- Select2 JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script>
        document.getElementsByClassName('job-card')[0].addEventListener('click', function () {
        alert('Div clicked!');
    });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="discover" runat="server">
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Active Jobs</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div id="container" class="job-card-container" runat="server">
            <asp:Repeater ID="JobsRepeater" runat="server" OnItemCommand="CloseJob">
                <ItemTemplate>
                    <div id="card" class="job-card" runat="server">
                        <div id="name" class="job-header" runat="server"><%# Eval("JobName") %> </div>
                        <div class="job-info"><b> Job Description: </b> <%# Eval("JD") %></div>
                        <div class="job-info"><b>Experience Required:</b> <%# Eval("Experience") %></div>
                        <div class="job-info"><b>City: </b><%# Eval("City") %></div>
                        <div class="job-info">
                            Posted: <span class="status" data-status='<%# Eval("Time") %>'><%# Eval("Time") %></span>
                        </div>
                        <asp:Button ID="jobclick" CssClass="apply-see-btn" runat="server" Text="Close" CommandName="close" CommandArgument='<%# Eval("JT") %>' />
                        <asp:Button ID="applyclick" CssClass="apply-see-btn" runat="server" Text="Applicants" CommandName="showapp" CommandArgument='<%# Eval("application") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>--%>
        <div class="job-listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-4">
                        <section class="featured-job-area">
                            <h3 class="mb-30">Applicants</h3>
                            <div class="container">
                                <!-- single-job-content -->
                                <asp:Repeater ID="AppsRepeater" runat="server" Visible="false">
                                    <ItemTemplate>
                                        <div class="single-job-items mb-30">
                                            <div class="job-items">
                                                <div class="job-tittle job-tittle2">
                                                    <a>
                                                        <h4><%# Eval("Name") %></h4>
                                                    </a>
                                                    <ul>
                                                        <li>Skills: <%# Eval("Skill") %></li>
                                                        <li>Email: <%# Eval("Email") %></li>
                                                        <li>Contact: <%# Eval("Contact") %></li>
                                                        <li><i class="fas fa-map-marker-alt"></i><%# Eval("Location") %></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </section>
                    </div>
                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8">
                        <!-- Featured_job_start -->
                        <section class="featured-job-area">
                            <h3 class="mb-30">Jobs</h3>
                            <div class="container">
                                <!-- single-job-content -->
                                <asp:Repeater ID="JobsRepeater" runat="server" OnItemCommand="CloseJob">
                                    <ItemTemplate>
                                        <div class="single-job-items mb-30">
                                            <div class="job-items">
                                                <div class="job-tittle job-tittle2">
                                                    <a>
                                                        <h4><%# Eval("JobName") %></h4>
                                                    </a>
                                                    <ul>
                                                        <li>Job Description: <%# Eval("JD") %></li>
                                                        <li><i class="fas fa-map-marker-alt"></i><%# Eval("City") %></li>
                                                        <li>Experience Required: <%# Eval("Experience") %></li>
                                                        <li>Time: <span class="status" data-status='<%# Eval("Time") %>'><%# Eval("Time") %></span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="items-link items-link2 f-right">
                                                <asp:Button ID="jobclick" CssClass="genric-btn primary" runat="server" Text="Close" CommandName="close" CommandArgument='<%# Eval("JT") %>' />
                                                <asp:Button ID="applyclick" CssClass="genric-btn primary" runat="server" Text="Applicants" CommandName="showapp" CommandArgument='<%# Eval("application") %>' />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </section>
                        <!-- Featured_job_end -->
                    </div>
                </div>
            </div>
        </div>
        <%--<div id="Div1" class="job-card-container" runat="server">
            <asp:Repeater ID="AppsRepeater" runat="server" Visible="false" >
                <ItemTemplate>
                    <div class="job-card" runat="server">
                        <div class="job-header" runat="server"><%# Eval("jname") %> </div>
                        <div class="job-info">Company Name: <%# Eval("cName") %></div>
                        <div class="job-info">Posted: <%# Eval("time") %></div>
                        <div class="job-info">Applicant Name: <%# Eval("Name") %></div>
                        <div class="job-info">Applicant Email: <%# Eval("Email") %></div>
                        <div class="job-info">Applicant Contact: <%# Eval("Contact") %></div>
                        <div class="job-info">Applicant Skill: <%# Eval("Skill") %></div>
                        <div class="job-info">Applicant Address: <%# Eval("Location") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>--%>
    </div>
</asp:Content>




