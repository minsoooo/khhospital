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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 주소검색 -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script>
	$(document).ready(
		function(){		
			$("#btnReset").click(
				function(){
					var	$form = $("#form1")
					$form.reset();
				}		
			);
			
			$("#btnUpdate").click(
					function(){
						var	$form = $("#form1")
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
			
			$("#btnAddr").click(
					function(){
						sample6_execDaumPostcode();
					}
				);
				
				$("#btnAddr").hover(
					function(){
						$("#btnAddr").attr("src", "/khhospital/design/images/btn_addr2.jpg");				
					},
					function(){
						$("#btnAddr").attr("src", "/khhospital/design/images/btn_addr.jpg");				
					}
				);

		}
	);
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

#social1, #social2 {
	width: 186px;
}

.addr1{
	width: 274px;
}

.addr2, .addr3{
	margin-top:5px;
	width: 400px;
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
						<form id="form1" class="form-search" method="post" style="margin-left:250px" action ="/khhospital/control?cmd=REGIUPDATEPROC">
							<input type ="hidden" name ="pat_level" value ="${patient.pat_level }"/>
							<img src="/khhospital/design/images/regi_update_banner.jpg" style="margin-left:90px"/>
							<table id="tbl">
								<tr>	
									<td>
										<input type="text" id="id" name ="name" required="required" placeholder="이름" readonly="readonly"
										value ="${patient.pat_name }"/>					
									</td>
								</tr>
								<tr>	
									<td>
										<input type="text" id="id" name="id" required="required" placeholder="아이디" readonly="readonly" 
										value ="${patient.pat_id }"/>					
									</td>
								</tr>
								<tr>		
									<td>
										<input type="password" id="oldPass" name="oldPass" placeholder="현재 비밀번호" required="required" /><br/>							
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
										<input type="text" id="social1" name="social1" placeholder="주민번호" required="required" readonly="readonly" value="${patient.pat_social1 }"/> - 
										<input type="text" id="social2" name="social2" required="required" readonly="readonly" value="${patient.pat_social2 }" />		
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="text" id="email1" name="email1" placeholder="이메일" required="required" value="${patient.pat_email1 }" /> @ 
										<input type="text" id="email2" name="email2" required="required" value="${patient.pat_email2 }" />		
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
										<input type="text" id="sample6_postcode" placeholder="우편번호" class="addr1" name="addr1" value="${patient.pat_addr1 }">
										<img src="/khhospital/design/images/btn_addr.jpg" id="btnAddr" /><br/>			
										<input type="text" id="sample6_address" placeholder="주소" class="addr2" name="addr2" value="${patient.pat_addr2 }"><br/>
										<input type="text" id="sample6_address2" placeholder="상세주소" class="addr2" name="addr3" value="${patient.pat_addr3 }">			
									</td>
								</tr>
								<tr>
									<td>
										<img src="/khhospital/design/images/btn_store.jpg" id="btnUpdate" style="width:200px"/>&nbsp;
										<img src="/khhospital/design/images/btn_reset.jpg" id="btnReset" style="width:200px"/>
									</td>
									<td></td>
								</tr>
							</table>
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