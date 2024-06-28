<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeSign.Master" AutoEventWireup="true" CodeBehind="EmployerSignUp.aspx.cs" Inherits="JobJunction.EmployerSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <%--<link href="sign.css" rel="stylesheet" type="text/css" />--%>
	<style>
		.row {
			display: flex;
			align-items: center;
			flex-wrap: wrap;
			justify-content: center;
			height: 100%;
		}
		.backpic1 {
			width: 1470px;
			height: 150%;
			position: absolute;
			opacity: 0.5;
			z-index: -1;
			top: 67%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="slider-area ">
		<div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Create An Employer Account</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <img class="backpic1" src="signup.jpg" >


     <%--<div class="row">
                <div class="col-1">
                    <div class="form-box2">
                        <div class="form">

                            <form class="login-form">                                

				               <asp:TextBox class="input" ID="TextBox1" runat="server" placeholder="First Name*"></asp:TextBox>

                               <asp:TextBox class="input" ID="TextBox2" runat="server" placeholder="Last Name*"></asp:TextBox>
                                
                                <asp:TextBox class="input" ID="TextBox3" runat="server" placeholder="Email*"></asp:TextBox>
                                <asp:RegularExpressionValidator class="sign23" ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Textbox3" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>


				                <asp:TextBox class="input" ID="Password" TextMode="password" runat="server" placeholder="Password*"></asp:TextBox>

                                <asp:TextBox class="input" ID="ConfirmP" TextMode="password" runat="server" placeholder="Confirm Password*"></asp:TextBox>

                               <asp:CompareValidator class="sign23" ID="CompareValidator1" runat="server" 
                                            ControlToCompare="Password" ControlToValidate="ConfirmP" 
                                            ErrorMessage="Password does not match."></asp:CompareValidator>

                               <asp:TextBox class="input" ID="TextBox4" runat="server" placeholder="Contact*"></asp:TextBox>

                               <asp:TextBox class="input" ID="TextBox5" runat="server" placeholder="Address*"></asp:TextBox>


				               <asp:Button class="button12" ID="button1" Text="Get Registered" runat="server" OnClick="SignUp_Click" />

                                 <div class="sign23" id="message1" runat="server"> </div>
                                
                               <p class="message"> Already Have An Account? <a href="SignIn.aspx" > Sign In </a></p>


				            </form>

                            </div>
                        </div>
                    </div>
            </div>--%>
    <div class="section-top-border">
				<div class="row">
					<div class="col-lg-8 col-md-8">
						<h3 class="mb-30">Enter your Information:</h3>
						<form>
							<div class="mt-10">
								<asp:TextBox CssClass="single-input" ID="TextBox1" placeholder="First Name*" runat="server"></asp:TextBox>
							</div>
							<div class="mt-10">
								<asp:TextBox CssClass="single-input" ID="TextBox2" placeholder="Last Name*" runat="server"></asp:TextBox>
								
							</div>
							<div class="mt-10">
								<asp:TextBox class="single-input" ID="TextBox3" placeholder="Email*" runat="server"></asp:TextBox>
								<asp:RegularExpressionValidator class="sign23" ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Textbox3" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
							</div>
							<div class="mt-10">
								<asp:TextBox class="single-input" ID="Password" TextMode="password" placeholder="Password*" runat="server"></asp:TextBox>
							</div>
							<div class="mt-10">
								<asp:TextBox class="single-input" ID="ConfirmP" TextMode="password" placeholder="Confirm Password*" runat="server"></asp:TextBox>
								<asp:CompareValidator class="sign23" ID="CompareValidator1" runat="server" 
												ControlToCompare="Password" ControlToValidate="ConfirmP" 
												ErrorMessage="Password does not match."></asp:CompareValidator>
							</div>
							<div class="mt-10">
								<asp:TextBox class="single-input" ID="CompanyName" runat="server" placeholder="Company Name*"></asp:TextBox>
							</div>
							<div class="mt-10">
								<asp:TextBox class="single-input" ID="TextBox4"  placeholder="Contact*" runat="server"></asp:TextBox>
							</div>
							<div class="mt-10">
								<asp:TextBox class="single-input" ID="TextBox5" placeholder="Address*" runat="server"></asp:TextBox>
							</div>
							<div class="mt-10">
								<asp:Button CssClass="genric-btn primary" ID="button1" Text="Get Registered" runat="server" OnClick="SignUp_Click" />
								<div class="sign23" id="message1" runat="server"> </div>
								<p class="message"> Already Have An Account? <a href="SignIn.aspx" > Sign In </a></p>
							</div>
						</form>
					</div>
				</div>
			</div>        
    <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
     

</asp:Content>


