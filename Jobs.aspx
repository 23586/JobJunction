<%@ Page Title="" Language="C#" MasterPageFile="~/AfterSign.Master" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="JobJunction.Jobs" %>

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
        <%--<div id="container" class="job-card-container" runat="server">
            <asp:Repeater ID="JobsRepeater" runat="server" OnItemCommand="seeCompanies">
                <ItemTemplate>
                    <div id="card" class="job-card" runat="server">
                        <div id="name" class="job-header" runat="server"><%# Eval("JobName") %> </div>
                        <asp:Button ID="jobclick" CssClass="apply-see-btn" runat="server" Text="See Companies ➔" CommandName="GetData" CommandArgument=<%# Eval("JobName") %>/>
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
                                    <asp:Repeater ID="JobsRepeater" runat="server" OnItemCommand="seeCompanies">
                                        <ItemTemplate>
                                            <div class="single-job-items mb-30">
                                                <div class="job-items">
                                                    <div class="job-tittle job-tittle2">
                                                        <a>
                                                            <h4><%# Eval("JobName") %></h4>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="items-link items-link2 f-right">
                                                    <asp:Button ID="jobclick" CssClass="genric-btn primary" runat="server" Text="See Companies ➔" CommandName="GetData" CommandArgument=<%# Eval("JobName") %>/>
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




