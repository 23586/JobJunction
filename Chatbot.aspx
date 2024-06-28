<%@ Page Title="" Language="C#" MasterPageFile="~/AfterSign.Master" AutoEventWireup="true" CodeBehind="Chatbot.aspx.cs" Inherits="JobJunction.Chatbot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <link href="sign.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>
            <div class="slide-left">
            
            <h1 class="sign1"> Chat<span>bot </span> </h1>

        </div>

        <img class="backpic4" src="1234.png" >
        
        <div class="background-container">
            
            <div class="chatbox" id="chat-container">
                <div id="chat-messages"></div>
                <div id="user-input">
                    <input type="text" id="user-message" placeholder="Type your message...">
                    <button id="send-button" onclick="sendMessage()">Send</button>
                </div>
            </div>
        </div>
    

        <div class="chatbox" id="chat-container">
            <div id="chat-messages">
                <div class="message received">
                    <p><span class="bot-label">BOT:</span><br> Hello! Welcome to Job Junction. How can I assist you today?</p>
                </div>
                <div class="message sent">
                    <p><span class="user-label">User:</span> <br> I'm looking for job opportunities in the tech industry.</p>
                </div>
                <div class="message received">
                    <p><span class="bot-label">BOT:</span><br> Great! We have various tech-related positions available. Can you specify your skills or preferences?</p>
                </div>
                <div class="message sent">
                    <p><span class="user-label">User:</span><br> Sure! I have experience in web development, specifically with HTML, CSS, and JavaScript.</p>
                </div>
                <div class="message received">
                    <p><span class="bot-label">BOT:</span><br> That's fantastic! We have several web developer positions open. Do you have any preferred location or type of company?</p>
                </div>
                <div class="message sent">
                    <p><span class="user-label">User:</span><br> I'm open to remote opportunities and prefer startups with an innovative environment.</p>
                </div>
                <div class="message received">
                    <p><span class="bot-label">BOT:</span><br> Great choice! Many startups value the skills you mentioned. I'll find suitable positions for you. Anything else you'd like to add?</p>
                </div>
                <div class="message sent">
                    <p><span class="user-label">User:</span><br> No, that's all. Thank you for your assistance!</p>
                </div>
                <div class="message received">
                    <p><span class="bot-label">BOT:</span><br> You're welcome! If you have any more questions or need further help, feel free to ask. Good luck with your job search!</p>
                </div>
            </div>
            <div id="user-input">
                <input type="text" id="user-message" placeholder="Type your message...">
                <button id="send-button" onclick="sendMessage()">Send</button>
            </div>
        </div>        
     </div>  
</asp:Content>
