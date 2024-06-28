$(function () {
    //localStorage.setItem('recId', 0);
    // Reference the auto-generated proxy for the SignalR hub.
    var chat = $.connection.chatHub;
    chat.logging = true;
    var urlParams = new URLSearchParams(window.location.search);
    var myParam = urlParams.get('text');
    $.connection.hub.qs = { 'userId': myParam };

    // Define the function that the hub calls to broadcast messages.
    chat.client.receiveMessage = function (message) {
        var encodedMsg = $('<div />').text(message).html();
        $('#chatBox').append('<div class="d-flex justify-content-start mb-4" > <div class="msg_cotainer">' + encodedMsg + '</div></div>');
    };

    // Start the connection.
    $.connection.hub.start().done(function () {
        $('#users').on('click', 'li', function () {
            var userId = $(this).attr('data-userid');
            localStorage.setItem('recId', userId);
        });
        $('#sendMessage').click(function () { // Ensure this matches your button's ID
            var message = $('#textArea').val();
            var userId = localStorage.getItem('recId');

            if (message && userId) {
                chat.server.sendPrivateMessage(userId, message);
                $('#textArea').val(''); // Clear the message box
                $('#chatBox').append('<div class="d-flex justify-content-end mb-4" > <div class="msg_cotainer">' + message + '</div></div>');
            }
        });
    });
});