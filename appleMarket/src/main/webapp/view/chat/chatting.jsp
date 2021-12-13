<!-- SocketJs CDN -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<script type="text/javascript">
//websocket을 지정한 URL로 연결
var sock = new SockJS("<c:url value="/echo"/>");
//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sck.onmessage = onMessage;
//websocket 과 연결을 끊고 싶을 때 실행하는 메소드
sock.onclose = onClose;

$(function(){
	$("#sendBtn").click(function(){
		console.log('send message...');
		sendMessage();
	});	
});

function sendMessage(){
	//websocket으로 메시지를 보내겠다.
	sock.send($("#message").val());
}

//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){	// 변수 안에 function 자체를 넣음.
	var data = evt.data;
	var sessionid = null;
	var message = null;
	
	//문자열을 splite
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' +strArray[i]);
	}
	
	
	
}

</script>