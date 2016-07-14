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
<script>
	$(document).ready(
		function(){		
			$("#btnReset").click(
				function(){
					var $form = $("#form1")
					$form.reset();
				}		
			);
			
			$("#btnUpdate").click(
					function(){
						var $form = $("#form1")
						$form.submit();
					}		
			);
			
			$("#oldPass").keyup(
					function(){				
						if($("#oldPass").val()== $("#pat_pass").attr("value")){
							$("#check_oldPass").attr("src", "/khhospital/design/images/check_green.png");	
							$("#check").attr("value", "true");
						}				
						else{
							$("#check_oldPass").attr("src", "/khhospital/design/images/check_red.png");	
							$("#check").attr("value", "false");
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
	
	function fnRegiSecond(){
		location.href="/khhospital/control?cmd=INDEX";
		window.open("/khhospital/control?cmd=REGI&check=second","","width=390,height=350,top=+200,left=+480");
	}
</script>
<style>
#tbl td {
	padding-top: 5px;
}

#id, #pass1, #pass2,#oldPass{
	width: 400px
}

#email1, #email2 {
	width: 182px
}

#email_check {
	width: 190px
}

#submenu>li>a {
	margin-top:20px;
	color: #347fd0;
	font-size: 17px;
	font-weight: bold;
}

#submenu> .active >a {
	margin-top:20px;
	color: #595959;
}

#banner2{
	margin-top:40px;
	margin-left:10px;
	 width:380px;
	 border: 4px solid #c1c1c1;
}

#banner2:hover{
	border: 4px solid #2a71bc;
}
</style>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<span id ="pat_pass" value ="${sessionScope.pass }"></span>
	<span id ="check" value ="false"></span>
	<span id ="checkCode" value =""></span>
	<div class="container" style="margin-top:50px; margin-bottom:50px">
		<div class="row">
			<div class="span12">	
				<div class="tabbable tabs-left" >
					<ul class="nav nav-tabs" id="submenu" style="margin-top:100px">
						<li class="active"><a href="#">내정보수정</a></li>
						<li><a href="/khhospital/control?cmd=MYRESERVE">진료예약조회</a></li>
						<li><a href="/khhospital/control?cmd=REGIDELETE">회원 탈퇴</a></li>
					</ul>
		
					<div class="tab-content">	
						<form id="form1" class="form-search" method="post" style="margin-left:250px" action="/khhospital/control?cmd=REGIUPDATEPROC">
						<input type ="hidden" name ="pat_level" value ="${patient.pat_level }"/>
							<img src="/khhospital/design/images/regi_update_banner.jpg" style="margin-left:90px"/>
							<table id="tbl">
								<tr>	
									<td>
										<input type="text" id="id" name="id" required="required" placeholder="아이디" readonly="readonly" value ="${patient.pat_id }"/>					
									</td>
								</tr>
								<tr>		
									<td>
										<input type="password" id="oldPass" placeholder="현재 비밀번호" required="required" /><br/>							
									</td>
									<td><img src="" id="check_oldPass"/></td>
								</tr>
								<tr>
									<td>
										<input type="password" id="pass1" name="pass1" placeholder="새 비밀번호 (6~12자로 입력해주세요)" required="required" />
									</td>
									<td><img src="" id="check_pass1"/></td>
								</tr>
								<tr>
									<td>
										<input type="password" id="pass2" name="pass2" placeholder="새 비밀번호 확인 " required="required" />
									</td>
									<td><img src="" id="check_pass2"/></td>
								</tr>
								<tr>
									<td>
										<input type="text" id="email1" name="email1" placeholder="이메일" required="required" value="${patient.pat_email1 }"/> @ 
										<input type="text" id="email2" name="email2"required="required" value="${patient.pat_email2 }" />		
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
										<img src="/khhospital/design/images/btn_store.jpg" id="btnUpdate" style="width:200px"/>&nbsp;
										<img src="/khhospital/design/images/btn_reset.jpg" id="btnReset" style="width:200px"/>
									</td>
									<td></td>
								</tr>
							</table>
							
							<!-- 추가개인정보입력 버튼 -->
							<a href="javascript:fnRegiSecond()"><img src="/khhospital/design/images/regi_update_banner2.jpg" id="banner2"/></a>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
	
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>