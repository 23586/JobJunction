﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AfterSignChat.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="JobJunction.Chat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="sign.css" rel="stylesheet" type="text/css" />
    <link href="chat.css" rel="stylesheet" type="text/css" />
    <link href="jobs.css" rel="stylesheet" type="text/css" />
    <!-- Include jQuery, if it's not already included -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
		<!-- Font awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" >
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="tailwindcss-colors.css">
    <link rel="stylesheet" href="chat-style.css?v=<%= DateTime.Now.Ticks %>">

    <!-- Select2 JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/jquery.signalR-2.4.3.min.js"></script>
	<script src="Scripts/WebForms/MSAjax/MicrosoftAjax.js"></script>
	<script src="Scripts/WebForms/MSAjax/MicrosoftAjaxWebForms.js"></script>
    <script src="signalr/hubs"></script>
    <%--<script src="Scripts/findControl.js"></script>--%>
    <script>
        $(function () {
            //localStorage.setItem('recId', 0);
            // Reference the auto-generated proxy for the SignalR hub.
            var chat1 = $.connection.chatHub;
            chat1.logging = true;
            var urlParams1 = new URLSearchParams(window.location.search);
            var myParam1 = urlParams1.get('text');
            $.connection.hub.qs = { 'userId': myParam1 };

            chat1.client.updateStatus = function (userId, isOnline) {
                if (userId == localStorage.getItem('recId1')) {
                    if (isOnline) {
                        $('#user-status').addClass('online');
                        $('#user-status').html('Online');
                    } else {
                        $('#user-status').removeClass('online');
                        $('#user-status').html('Offline');
                    }
                }
            };

            // Define the function that the hub calls to broadcast messages.
            chat1.client.receiveMessage = function (message,isDoc,isCall) {
                var currentDate = new Date();


                var year = currentDate.getFullYear();
                var month = currentDate.getMonth() + 1;
                var day = currentDate.getDate();
                var hours = currentDate.getHours();
                var minutes = currentDate.getMinutes();
                var seconds = currentDate.getSeconds();

                var currentDateTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
                var encodedMsg1 = $('<div />').text(message).html();
                if (isCall) {
                    $('#chatBox').append('<li class="conversation-item me"><div class="conversation-item-content"><div class="conversation-item-wrapper"><div class="conversation-item-box"><div class="conversation-item-text"><a href="' + encodedMsg1 + '" target="_blank">Audio/Video Call</a><div class="conversation-item-time">' + currentDateTime + '</div></div><div class="conversation-item-dropdown"><button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button><ul class="conversation-item-dropdown-list"><li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li><li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li></ul></div></div></div></div></li>');
                }
                else if (isDoc) {
                    var filename = encodedMsg1.split('/');
                    $('#chatBox').append('<li class="conversation-item me"><div class="conversation-item-content"><div class="conversation-item-wrapper"><div class="conversation-item-box"><div class="conversation-item-text"><a href="' + encodedMsg1 + '">' + filename[filename.length-1] + '</a><div class="conversation-item-time">' + currentDateTime + '</div></div><div class="conversation-item-dropdown"><button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button><ul class="conversation-item-dropdown-list"><li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li><li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li></ul></div></div></div></div></li>');
                }
                else {
                    $('#chatBox').append('<li class="conversation-item me"><div class="conversation-item-content"><div class="conversation-item-wrapper"><div class="conversation-item-box"><div class="conversation-item-text"><p style="color:black;">' + encodedMsg1 + '</p><div class="conversation-item-time">' + currentDateTime + '</div></div><div class="conversation-item-dropdown"><button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button><ul class="conversation-item-dropdown-list"><li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li><li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li></ul></div></div></div></div></li>');
                }
            };

            chat1.client.receiveLink = function (message) {
                var currentDate = new Date();


                var year = currentDate.getFullYear();
                var month = currentDate.getMonth() + 1;
                var day = currentDate.getDate();
                var hours = currentDate.getHours();
                var minutes = currentDate.getMinutes();
                var seconds = currentDate.getSeconds();

                var currentDateTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
                var encodedMsg1 = $('<div />').text(message).html();
                $('#chatBox').append('<li class="conversation-item"><div class="conversation-item-content"><div class="conversation-item-wrapper"><div class="conversation-item-box"><div class="conversation-item-text"><a href="' + encodedMsg1 + '" target="_blank">Audio/Video Call</a><div class="conversation-item-time">' + currentDateTime + '</div></div><div class="conversation-item-dropdown"><button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button><ul class="conversation-item-dropdown-list"><li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li><li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li></ul></div></div></div></div></li>');
                var win = window.open(encodedMsg1, '_blank');
                win.focus();
            };

            // Start the connection.
            $.connection.hub.start().done(function () {
                $('#users').on('click', 'li', function () {
                    var userId1 = $(this).attr('data-userid');
                    localStorage.setItem('recId1', userId1);
                    document.querySelector('#conversation-1').classList.add('active');
                    document.querySelector('.conversation-default').classList.remove('active');
                });

                //setInterval(async function () {
                //    await chat1.server.getStatus(localStorage.getItem('recId1'));
                //}, 3000);

                $('#emojis').on('click', 'li', function () {
                    var emojiText1 = $(this).text();
                    $('#textArea').append(emojiText1);
                });

                $('#textArea').keydown(function (event) {
                    if (event.keyCode == 13) {
                        event.preventDefault();
                        $('#sendMessage').click();
                    }
                });

                $('#sendMessage').click(async function () { // Ensure this matches your button's ID
                    var message1 = $('#textArea').val();
                    var userId1 = localStorage.getItem('recId1');
                    var fileInput = document.getElementById('fileInput');
                    var currentDate = new Date();


                    var year = currentDate.getFullYear();
                    var month = currentDate.getMonth() + 1;
                    var day = currentDate.getDate();
                    var hours = currentDate.getHours();
                    var minutes = currentDate.getMinutes();
                    var seconds = currentDate.getSeconds();

                    var currentDateTime = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
                    if (fileInput.files && fileInput.files.length > 0) {
                        var file = fileInput.files[0];
                        chat1.server.sendPrivateMessage(userId1, file.name, true,false);
                        $('#textArea').val(''); // Clear the message box
                        $('#chatBox').append('<li class="conversation-item"><div class="conversation-item-content"><div class="conversation-item-wrapper"><div class="conversation-item-box"><div class="conversation-item-text"><a href="temp/'+file.name+'">'+file.name+'</a><div class="conversation-item-time">' + currentDateTime + '</div></div><div class="conversation-item-dropdown"><button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button><ul class="conversation-item-dropdown-list"><li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li><li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li></ul></div></div></div></div></li>');
                    }
                    else if (message1 && userId1) {
                        chat1.server.sendPrivateMessage(userId1, message1,false,false);
                        $('#textArea').val(''); // Clear the message box
                        $('#chatBox').append('<li class="conversation-item"><div class="conversation-item-content"><div class="conversation-item-wrapper"><div class="conversation-item-box"><div class="conversation-item-text"><p style="color:black;">' + message1 + '</p><div class="conversation-item-time">' + currentDateTime + '</div></div><div class="conversation-item-dropdown"><button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button><ul class="conversation-item-dropdown-list"><li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li><li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li></ul></div></div></div></div></li>');
                    }
                });

                $('#startAVideo').click(async function () { // Ensure this matches your button's ID;
                    var userId1 = localStorage.getItem('recId1');
                    chat1.server.sendPrivateMessage(userId1, "", false,true);
                });
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<section class="chat-section">
        <div class="chat-container">
            <!-- start: Sidebar -->
            <aside class="chat-sidebar">
                <a href="#" class="chat-sidebar-logo">
                    <i class="ri-chat-1-fill"></i>
                </a>
                <ul class="chat-sidebar-menu">
                    <li class="active"><a href="#" data-title="Chats"><i class="ri-chat-3-line"></i></a></li>
                    <li><a href="#" data-title="Contacts"><i class="ri-contacts-line"></i></a></li>
                    <li><a href="#" data-title="Documents"><i class="ri-folder-line"></i></a></li>
                    <li><a href="#" data-title="Settings"><i class="ri-settings-line"></i></a></li>
                    <li class="chat-sidebar-profile">
                        <button type="button" class="chat-sidebar-profile-toggle">
                            <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVvcGxlfGVufDB8fDB8fHww&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60" alt="">
                        </button>
                        <ul class="chat-sidebar-profile-dropdown">
                            <li><a href="#"><i class="ri-user-line"></i> Profile</a></li>
                            <li><a href="#"><i class="ri-logout-box-line"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </aside>
            <!-- end: Sidebar -->
            <!-- start: Content -->
            <div class="chat-content">
                <!-- start: Content side -->
                <div class="content-sidebar">
                    <div class="content-sidebar-title">Chats</div>
                    <form action="" class="content-sidebar-form">
                        <input type="search" class="content-sidebar-input" placeholder="Search...">
                        <button type="submit" class="content-sidebar-submit"><i class="ri-search-line"></i></button>
                    </form>
                    <div class="content-messages">
                        <ul id="users" class="content-messages-list">
                            <li class="content-message-title"><span>Recently</span></li>
                            <asp:Repeater ID="rptEmployers" OnItemCommand="repeater1_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <li data-userid='<%# Eval("id")+"e" %>'">
                                        <img class="content-message-image" src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVvcGxlfGVufDB8fDB8fHww&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60" alt="">
                                        <span class="content-message-info">
                                            <asp:Button ID="user_click" CssClass="content-message-name" Text='<%# Eval("name") %>' CommandName="ChangeLabel" CommandArgument='<%# Eval("id")+"|"+Eval("name") %>' runat="server" />
                                            <span class="content-message-text">Employer</span>
                                        </span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <!-- end: Content side -->
                <!-- start: Conversation -->
                <div class="conversation conversation-default active">
                    <i class="ri-chat-3-line"></i>
                    <p>Select chat and view conversation!</p>
                </div>
                <div class="conversation" id="conversation-1">
                    <div class="conversation-top">
                        <button type="button" class="conversation-back"><i class="ri-arrow-left-line"></i></button>
                        <div class="conversation-user">
                            <img class="conversation-user-image" src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGVvcGxlfGVufDB8fDB8fHww&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60" alt="">
                            <div>
                                <div class="conversation-user-name"><asp:Label ID="user_card" Text="User" runat="server"></asp:Label></div>
                                <div id="user-status" class="conversation-user-status">Offline</div>
                            </div>
                        </div>
                        <div class="conversation-buttons">
                            <%--<button id="startACall" type="button"><i class="ri-phone-fill"></i></button>--%>
                            <button id="startAVideo" type="button"><i class="ri-vidicon-line"></i></button>
                            <button type="button"><i class="ri-information-line"></i></button>
                        </div>
                    </div>
                    <div class="conversation-main">
                        <ul id="chatBox" class="conversation-wrapper">
                            <asp:Repeater ID="chatMessages" runat="server">
				                <ItemTemplate>
                                    <li class='<%# GetDivClass(Eval("senderId")) %>'>
                                        <div class="conversation-item-content">
                                            <div class="conversation-item-wrapper">
                                                <div class="conversation-item-box">
                                                    <div class="conversation-item-text">
                                                        <%# GetDocFlag(Eval("isDoc"), Eval("messageSent"),Eval("isCall"))%>
                                                        <div class="conversation-item-time"><%# Eval("timeDate") %></div>
                                                    </div>
                                                    <div class="conversation-item-dropdown">
                                                        <button type="button" class="conversation-item-dropdown-toggle"><i class="ri-more-2-line"></i></button>
                                                        <ul class="conversation-item-dropdown-list">
                                                            <li><a href="#"><i class="ri-share-forward-line"></i> Forward</a></li>
                                                            <li><a href="#"><i class="ri-delete-bin-line"></i> Delete</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div class="conversation-form">
                        <button id="emojiButton" type="button" class="conversation-form-button"><i class="ri-emotion-line"></i></button>
                        <div id="emojiList" style="position:absolute;display: none; overflow-y:auto;z-index:1000;max-width:200px;max-height:200px;">
                            <ul id="emojiContainer">
                                <!-- Emojis will be dynamically added here -->
                            </ul>
                        </div>
                        <div class="conversation-form-group">
                            <textarea id="textArea" class="conversation-form-input" rows="1" placeholder="Type here..."></textarea>
                            <%--<input type="file" id="fileInput" value="+" class="conversation-form-record">--%>
                            <asp:FileUpload ID="fileInput" CssClass="conversation-form-record" ClientIDMode="Static" runat="server" />
                            <%--<input type="file" id= class="conversation-form-record"><i class="ri-mic-line"></i></input>--%>
                        </div>
                        <%--<button id="sendMessage" type="button" class="conversation-form-button conversation-form-submit ri-send-plane-2-line"><i class="ri-send-plane-2-line"></i></button>--%>
                        <asp:Button id="sendMessage" CssClass="conversation-form-button conversation-form-submit ri-send-plane-2-line" OnClick="fileSave" runat="server" ClientIDMode="Static"/>
                    </div>
                </div>
                <!-- end: Conversation -->
            </div>
            <!-- end: Content -->
        </div>
    </section>
    <script src="Scripts/script.js"></script>
    <script>
        function populateEmojiList() {
            var emojiContainer = document.getElementById('emojiContainer');
            // List of emojis (you can add more)
            var emojis = ['😀', '😃', '😄', '😁', '😆', '😅', '😂', '🤣', '😊', '😇', '🙂', '🙃', '😉', '😌', '😍', '🥰', '😘', '😗', '😙', '😚'];

            emojis.forEach(function (emoji) {
                var listItem = document.createElement('li');
                listItem.className = 'emoji';
                listItem.textContent = emoji;
                listItem.addEventListener('click', function () {
                    insertEmoji(emoji);
                });
                emojiContainer.appendChild(listItem);
            });
        }

        // Function to insert the selected emoji into the text area
        function insertEmoji(emoji) {
            var textArea = document.getElementById('textArea');
            var cursorPosition = textArea.selectionStart;
            var textBeforeCursor = textArea.value.substring(0, cursorPosition);
            var textAfterCursor = textArea.value.substring(cursorPosition);
            textArea.value = textBeforeCursor + emoji + textAfterCursor;
        }

        // Show/hide the emoji list when the button is clicked
        document.getElementById('emojiButton').addEventListener('click', function () {
            var emojiList = document.getElementById('emojiList');
            var buttonPosition = this.getBoundingClientRect();
            if (emojiList.style.display === 'none') {
                emojiList.style.display = 'block';
                emojiList.style.top = (buttonPosition.top - emojiList.offsetHeight) + 'px';
                emojiList.style.left = buttonPosition.left + 'px';
            } else {
                emojiList.style.display = 'none';
            }
        });

        document.addEventListener('click', function (event) {
            var emojiList = document.getElementById('emojiList');
            var emojiButton = document.getElementById('emojiButton');

            if (emojiList.style.display === 'block' && !emojiList.contains(event.target) && !emojiButton.contains(event.target)) {
                emojiList.style.display = 'none';
            }
        });

        // Populate the emoji list when the page loads
        populateEmojiList();
    </script>
</asp:Content>