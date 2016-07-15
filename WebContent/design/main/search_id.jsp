<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			
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
				
			
		}		
	);

	function fnSearchId(){
		var $form = $("#form")
		var check = $("#check").attr("value")
		
		if(check == "true"){
			$form.submit();
		}else{
			alert("이메일 및 인증번호를 확인하세요")
		}
	}



</script>

<style>
table {
	text-align: left
}

#email1, #email2{
	width: 160px
}

</style>
</head>
<body>
	<span id ="checkCode" value=""></span>
	<span id ="check" value ="false"></span>
	<div style="margin-top: 50px"></div>
	<form class="form-search" method="post" id="form"
		action="/khhospital/control?cmd=SEARCHIDPROC">
		<table id ="searchTable">
			<tr>
				<td><input type="text" name="email1" id="email1"
					required="required" placeholder="이메일 입력"  /> @ <input type="text" name="email2"
				id="email2" required="required"/></td>
			</tr>
			<tr>
				<td>
				<img src="/khhospital/design/images/btn_send_code.jpg" id="btnSendCode"/>
				<input type="text" id="email_check" class="input-medium" required="required" placeholder="인증번호를 입력하세요 "/> 
				<img src="/khhospital/design/images/btn_check_code.jpg" id="btnCheckCode"/>
				</td>
				<td><td><img src="" id="check_email"/></td></td>
			</tr>
		</table>
		<a href="javascript:fnSearchId()"><img src="/khhospital/design/images/btn_search_id.jpg" style="width:373px;height:50px;margin-top:10px"/></a>

	</form>


	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>