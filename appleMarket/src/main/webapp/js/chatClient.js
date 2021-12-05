function connect() {
    var socket = new SockJS('/endpoint');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function () {
        stompClient.subscribe('/subscribe/' + sender, function (e) {
            showMessage(JSON.parse(e.body));
            alertClosing('comeMessage',2000);
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
}

function send() {
    data = {'chatRoom_id': chatRoom_id, 'sender' : sender, 'receiver': receiver,'message': $("#message").val()};
    stompClient.send("/publish/endpoint/send", {}, JSON.stringify(data));
    showMessage(data);
    $("#message").val('');
    alertClosing('successMessage',2000);
}


function showMessage(e) {
    space = document.getElementById("space");
    space.innerHTML = "<div class='row'> <div class='col-lg-12'> <div class='media'> <div class='media-body'> <h4 class='media-heading'>" +
        e.sender + "</h4><h4 class='small pull-right'>방금</h4> </div> <p>" +
        e.message + "</p> </div> </div> </div> <hr>" + space.innerHTML;
};
window.onbeforeunload = function(e){
    disconnect();
}

function alertClosing(selector, delay){
    console.log(selector);
    document.getElementById(selector).style.display = "block";
    window.setTimeout(function(){
        document.getElementById(selector).style.display = "none";
    },delay);
}