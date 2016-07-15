<!-- 
	작성자 :양진원
	작성일 :2016-07-06
	설명 : 회원가입양식 및 중복확인 코드 제작
	
	수정자 : 박민수
	수정일 : 2016-07-11
	설명 : 메일 인증코드 발송 및 확인 코드 작성.
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<script>
	$(document).ready(
		function(){			

			$("#btnIdCheck").click(
				function() {		
					  if($("#id").val() == ""){ 
						  alert("아이디를 입력하세요");
						  $("#check_result").attr("src", "/khhospital/design/images/check_red.png");
						  $("#check").attr("value", "false");
					  }else{
						  $.get("/khhospital/design/main/check_id.jsp", {"id":$("#id").val()},
								function(data){
									if($(data).find("result").text() == "true"){
									  	alert($(data).find("data").text());
									 	$("#check_result").attr("src", "/khhospital/design/images/check_green.png");
									  	$("#check").attr("value", "true");
							  			}
							  		else{
							  			alert($(data).find("data").text());
							  			$("#check_result").attr("src", "/khhospital/design/images/check_red.png");
							  			$("#check").attr("value", "false");
								  	}
							  	}						  
							);
					  }	  				  
				  }				
			);
			
			$("#pass1").keyup(
				function(){				
					if($("#pass1").val().length >= 6 && $("#pass1").val().length <= 12){
						$("#check_pass1").attr("src", "/khhospital/design/images/check_green.png");	
						$("#check").attr("value", "true");
					}				
					else{
						$("#check_pass1").attr("src", "/khhospital/design/images/check_red.png");	
						$("#check").attr("value", "false");
					}
				}		
			);
			
			$("#pass2").blur(
				function(){
					if($("#pass1").val().length >= 6 && $("#pass1").val().length <= 12 && ($("#pass1").val() == $("#pass2").val())){
						$("#check_pass2").attr("src", "/khhospital/design/images/check_green.png");
						$("#check").attr("value", "true");
					}
					else if($("#pass1").val().length > 0 && ($("#pass1").val() != $("#pass2").val())){
						$("#check_pass2").attr("src", "/khhospital/design/images/check_red.png");	
						$("#check").attr("value", "false");
					}
				}			
			);
		
			$("#btnIdCheck").hover(
				function(){
					$("#btnIdCheck").attr("src", "/khhospital/design/images/btn_id_check2.jpg");				
				},
				function(){
					$("#btnIdCheck").attr("src", "/khhospital/design/images/btn_id_check.jpg");				
				}
			);
			
			$("#btnSendCode").hover(
				function(){
					$("#btnSendCode").attr("src", "/khhospital/design/images/btn_send_code2.jpg");				
				},
				function(){
					$("#btnSendCode").attr("src", "/khhospital/design/images/btn_send_code.jpg");				
				}
			);
			
			$("#btnCheckCode").hover(
				function(){
					$("#btnCheckCode").attr("src", "/khhospital/design/images/btn_check_code2.jpg");				
				},
				function(){
					$("#btnCheckCode").attr("src", "/khhospital/design/images/btn_check_code.jpg");				
				}
			);
			
			$("#btnRegi").click(
				function(){
					var check = $("#check").attr("value");
				 	var	$form = $("#form1");
					if(check == "true"){
						$form.submit();
					}
				}		
			);
			
			$("#btnSendCode").click(
					function(){
						var email1 = $("#email1").val();
						var email2 = $("#email2").val();
						if(email1 != "" && email2 !=""){
							$.post("/khhospital/sendMail.do",{"email1":email1,"email2":email2},"xml").done(
									function(xml){
										var code = $(xml).find("code");
										if(code.length){
											$(code).each(
												function(){
													$("#checkCode").attr("value",$(this).text());
								
												}		
											);
											
										}
									}
							);				
						}else{
							alert("이메일 주소를 정확히 입력해 주세요")
							
						}
						
					}
			);
			
			$("#btnCheckCode").click(
				function(){
					var sendCode = $("#checkCode").attr("value");
					var inputCode = $("#email_check").val()
					if(sendCode == inputCode){
						$("#check_email").attr("src", "/khhospital/design/images/check_green.png");
						$("#check").attr("value", "true");
					}else{
						alert("인증번호를 확인해 주세요!")
						$("#check").attr("value", "false");
					}
				}		
			);
		}
	);
</script>
<style>
#form1 {
	margin-top: 20px;
}

td {
	padding-top: 5px;
}

#id {
	width: 225px
}

#pass1, #pass2 {
	width: 300px
}

#email1, #email2 {
	width: 132px
}

#email_check {
	width: 90px
}
</style>
<body>
<input type ="hidden" id = "checkCode" value =""/>
<form id="form1" class="form-search" method="post" action="/khhospital/control?cmd=REGIPROC">
	<input type ="hidden" id ="check" name="check"  value ="false"/>
	<table>
		<tr>		
			<td>
				<input type="text" id="id" name="id" placeholder="아이디  (6~12자로 입력해주세요)" required="required" />			
				<img src="/khhospital/design/images/btn_id_check.jpg" id="btnIdCheck"/><br/>		
			</td>
			<td><img src="" id="check_result"/></td>
		</tr>
		<tr>		
			<td>
				<input type="password" id="pass1" name ="pass1" placeholder="비밀번호 (6~12자로 입력해주세요) " required="required" /><br/>
							
			</td>
			<td><img src="" id="check_pass1"/></td>
		</tr>
		<tr>
			<td>
				<input type="password" id="pass2" name="pass2" placeholder="비밀번호 확인" required="required" />
			</td>
			<td><img src="" id="check_pass2"/></td>
		</tr>
		<tr>
			<td>
				<input type="text" id="email1" name ="email1" placeholder="이메일" required="required" /> @ 
				<input type="text" id="email2" name ="email2" class="input-medium" required="required" />		
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<img src="/khhospital/design/images/btn_send_code.jpg" id="btnSendCode"/>
				<input type="text" id="email_check" class="input-medium" required="required" /> 
				<img src="/khhospital/design/images/btn_check_code.jpg" id="btnCheckCode"/>
			</td>
			<td><img src="" id="check_email"/></td>
		</tr>
		<tr>
			<td>
				<img src="/khhospital/design/images/btn_regi.jpg" id="btnRegi"/>
			</td>
			<td></td>
		</tr>
	</table>
</form>
	
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>