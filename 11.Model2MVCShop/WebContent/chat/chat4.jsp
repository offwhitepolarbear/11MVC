<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://localhost:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>

</style>
	
    <script>
        $(document).ready(function() {
            var socket = io("http://localhost:82");
            socket.emit("joiner", "10001,10003,10005,25478,12587,92354");
            socket.emit("send_msg", $("#userId").text()+" 님이 접속하셨습니다 ");
            //msg에서 키를 누를떄
            $("#msg").keydown(function(key) {
                //해당하는 키가 엔터키(13) 일떄
                if (key.keyCode == 13) {
                    //msg_process를 클릭해준다.
                    msg_process.click();
                }
            });
 
            //msg_process를 클릭할 때
            $("#msg_process").click(function() {
                //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                socket.emit("send_msg", $("#userId").text()+" : "+$("#msg").val());
                socket.emit("send_who", $("#userId").text()+"콘솔에찍히는메시지임");
                //#msg에 벨류값을 비워준다.
                $("#msg").val("");
            });
 
            //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
            socket.on('send_msg', function(msg) {
                //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                if($("#chat_box").length){
                	
                }
                $('<div></div>').text(msg).appendTo("#chat_box");
                var msgArray = msg.split(" : ");
                //alert(msgArray[0]);
                //길이 체크로 태그가 있나 확인하는 방법임
                if($("#"+msgArray[0]+"").length){
                	//alert("있어요");
                	$('<div></div>').text(msg).appendTo("#"+msgArray[0]+"");
                }
                else{
                	var tagging = "</br><button type='button' class='btn btn-default' id='"+msgArray[0]+"'>"+msg+"</button>";
                	$("#multibox").append(tagging)
                	//$("#"+msgArray[0]+"").text(msg).appendTo("#multibox");
                }
            });
        });
    </script>
<meta charset="UTF-8">
<title>소켓 서버</title>
 
</head>
<body>
 <div class="col-md-2">
<div class="container-fluid">
 <div id='userId'>${user.userId}<br/></div>
 			<div class="panel panel-default" >
				<div class="panel-body">
					<p class="text-left" id="chat_box"></p>
				</div>
			</div>

    <div class="input-group">
  	<input type="text" class="form-control" placeholder="채팅을 입력해주세요" aria-describedby="basic-addon2" id="msg">
  		<span class="input-group-btn">
        <button class="btn btn-success" type="button" id="msg_process">전송!</button>
      </span>
	</div>
	
     <div id='multibox'></div>
    </div>
  </div>  
  <div class="col-md-2">
<div class="container-fluid">
 <div id='userId'>${user.userId}<br/></div>
 			<div class="panel panel-default" >
				<div class="panel-body">
					<p class="text-left" id="chat_box"></p>
				</div>
			</div>

    <div class="input-group">
  	<input type="text" class="form-control" placeholder="채팅을 입력해주세요" aria-describedby="basic-addon2" id="msg">
  		<span class="input-group-btn">
        <button class="btn btn-success" type="button" id="msg_process">전송!</button>
      </span>
	</div>
	
     <div id='multibox'></div>
    </div>
  </div>  
  <div class="col-md-2">
<div class="container-fluid">
 <div id='userId'>${user.userId}<br/></div>
 			<div class="panel panel-default" >
				<div class="panel-body">
					<p class="text-left" id="chat_box"></p>
				</div>
			</div>

    <div class="input-group">
  	<input type="text" class="form-control" placeholder="채팅을 입력해주세요" aria-describedby="basic-addon2" id="msg">
  		<span class="input-group-btn">
        <button class="btn btn-success" type="button" id="msg_process">전송!</button>
      </span>
	</div>
	
     <div id='multibox'></div>
    </div>
  </div>  
</body>
</html>
