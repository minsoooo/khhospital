<!-- 
	작성자 : 박민수 
	작성일 :2016-06-18
	설명 : 주기적 ajax 요청을 통한 채팅 구현
	수정자 : 박민수
	수정일 : 2016-06-19
	설명 :scrollTop을 이용한 채팅 스크롤 맨아래 고정 .
	
	수정자 : 박민수
	수정일 : 2016_07_16
	설명 : 1:1 채팅을 위한 chatMember 받아 오기 
	
 -->



<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
$(document).ready(	
		function(){
			// 디자인 		
			    $("#msgField").css("border", "2px solid #595959").css("width","300px").css("height", "250px")
				.css("overflow","auto").css("margin-top","20px").css("background-color","#ECEBFF");
				$("#chat").css("margin-left","25px");
				$("#msg").css("margin-left","35px").css("margin-top","10px")
				$("body").css("background-color","#d8d8d8")
			// 보내는 메세지 아아디 parameter 초기화 
			 var sendID ="";
			 var user = $("#user").attr("value");
			 var sendMSG ="님이 접속하셨습니다.";
			// 접속자에 따라 이름을 가져와서 ID에 등록한다.
			 if($("#user").attr("value")=="doctor"){
				sendID = $("#doc_name").attr("value");
			}else{
				sendID = $("#pat_name").attr("value");
			}
				
			// 주기적 요청을 보내 xml 파일을 가져온다.
		
			setInterval(
				function(){
					$.post("/khhospital/chat.do",{"id":sendID,"msg":sendMSG,"user":user},"xml").done(
						function(xml){
							// 중복작성을 방지하기 위해 추가됨 동적 태그를 모두 삭제한다.
							$("#msgField").empty();
							var xmlData = $(xml).find("info");
							if(xmlData.length){
								$(xmlData).each(
									function(){
										var cnt =$(this).find("cnt").text();
										var id =$(this).find("id").text();
										var msg =$(this).find("msg").text();
										var user =$(this).find("user").text();
										//환자와 의사를 구분하여 글자 색을 바꿔준다.
										if(user == "doctor"){
											var content ="<p style='color:#272f66;font-weight:bold;font-size:20px'>"+id +" : " +msg+"</p>";						
										}else{
											var content ="<p style='color:#a52e36;font-weight:bold;font-size:20px'>"+id +" : " +msg+"</p>";							
										}
										//동적으로 태그를 추가하여 채팅을 구현한다.
										// 태그 추가 
											$(content).appendTo("#msgField")
									}		
								);
								
							}
							// ajax 요청을 완료하면 다시 parameter를 초기화 해준다.
							sendMSG =""
							//스크롤을 항상 아래로 내려준다.
							$("#msgField").scrollTop(3000);
						}		
					
					);
				
				},1000);
			
			// 스크롤바 가 생기면 항상 맨아래로 이동한다.
			
			
			// 버튼을 클릭하면 parameter를 변경
			$("#btn").click(
					function(){
						sendMSG = $("#msg").val();
						$("#msg").val("");
					}
				
			);
			
			//text에 엔터키 치면 입력 됨 
			$("#msg").keydown(
				function(){
					if(window.event.keyCode==13) {
						if(window.event){ 
							event.returnValue = false;
						}else {
							e.preventDefault();
						} 

						sendMSG = $("#msg").val();
						///text field 지우기 
						$("#msg").val("");
					
					}	
				}		
			);
			
		}
	);


</script>
</head>
<body>
<span id ="user" value ="${sessionScope.user}"></span>
<span id ="doc_name" value ="${sessionScope.doc_name }"></span>
<span id ="pat_name" value ="${sessionScope.pat_name }"></span>
<span id ="chat_member" value ="${sessionScope.chat_member }"></span>
<div class="container">
		<div class="row">
			<div class="span12">
				<div id ="chat">
					<div id="msgField">
					
					</div>
					<div class ="input-append">
						<input type="text" name="msg" id=msg  /> 
						<input type="button" id="btn" value="전송" class ="btn add-on" style="width:50px;height:30px;margin-top:10px"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>