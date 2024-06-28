<%@ Page Title="" Language="C#" MasterPageFile="~/AfterSign.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="JobJunction.Companies" %>

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
		                        <h2>Get Your Job</h2>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <%-- <div id="container" class="job-card-container" runat="server">
            <asp:Repeater ID="JobsRepeater" runat="server" OnItemCommand="ApplyButton" OnItemDataBound="ChangeStatus">
                <ItemTemplate>
                    <div id="card" class="job-card" runat="server">
                        <div class="job-header"><%# Eval("CompanyName") %></div>
                        <div class="job-info"><b> Job Description: </b><%# Eval("JD") %></div>
                        <div class="job-info"><b>Experience Required:</b> <%# Eval("Experience") %></div>
                        <div class="job-info"><b>City: </b><%# Eval("City") %></div>
                        <div class="job-info">
                            Time: <span class="status" data-status='<%# Eval("Time") %>'><%# Eval("Time") %></span>
                        </div>
                        <asp:Button ID="jobclick" CssClass="apply-see-btn" runat="server" Text="Apply" CommandName="apply" Visible='<%# Eval("status") %>' CommandArgument='<%# Eval("NT") %>'/>
                        <asp:Button ID="status" CssClass="status-btn" runat="server" Text="Apply" CommandName="apply" Enabled="false" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>--%>
        <div class="job-listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8">
                        <!-- Featured_job_start -->
                        <section class="featured-job-area">
                            <div class="container">
                                <!-- single-job-content -->
                                <asp:Repeater ID="JobsRepeater" runat="server" OnItemCommand="ApplyButton" OnItemDataBound="ChangeStatus">
                                    <ItemTemplate>
                                        <div class="single-job-items mb-30">
                                            <div class="job-items">
                                                <div class="job-tittle job-tittle2">
                                                    <a>
                                                        <h4><%# Eval("CompanyName") %></h4>
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
                                                <asp:Button ID="jobclick" CssClass="genric-btn primary" runat="server" Text="Apply" CommandName="apply" Visible='<%# Eval("status") %>' CommandArgument='<%# Eval("NT") %>'/>
                                                <asp:Button ID="status" CssClass="genric-btn primary" runat="server" Text="Apply" CommandName="apply" Enabled="false" />
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
    </div>
</asp:Content>




