<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting Page</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js" integrity="sha512-5yJ548VSnLflcRxWNqVWYeQZnby8D8fJTmYRLyvs445j1XmzR8cnWi85lcHx3CUEeAX+GrK3TqTfzOO6LKDpdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body style="text-align:center;">
	<textarea id="msgArea"  wrap="hard"  readonly ="readonly"  style="height:550px; width:320px;resize:none"></textarea>
	<div id="chatForm" style="position:sticky; margin-top:40px; ">
		<input type ="text"  id="chatMsg"/>
		<input type ="button" id="disconnectBtn" value="나가기"  onclick="disconnect(); return false;"/>
		<input type ="button" id="sendBtn" value="전송" />
	</div>
	
	
</body>
<script>
	var msg="";
	$('input[type="text"]').keydown(function() {
	    if (event.keyCode === 13) {
	    	msg=$('#chatMsg').val();
			sendMessage(msg);
			$('#chatMsg').val('');
	    }
	});
	$("#sendBtn").click(function() {
		msg=$('#chatMsg').val();
		sendMessage(msg);
		$('#chatMsg').val('');
	});

	var sock = new SockJS("http://localhost:8180/spring/chatting/");
	var user = "${member.userId}";
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage(msg) {
		sock.send(user+" : "+msg+"\r\n");
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#msgArea").append(data + "<br/>");
	}
	// 서버 연결했을 때
	function onOpen(){
		sock.send(user+"님이 접속하셨습니다.\r\n");	 
	}
	
	// 서버와 연결을 끊었을 때
	function disconnect(){
		sock.send(user+"님이 퇴장하셨습니다.\r\n");
		onClose();
	}
	function onClose() {
		window.close();
	}
		
</script>
</html>