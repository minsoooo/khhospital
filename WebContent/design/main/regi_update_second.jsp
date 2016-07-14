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
<!-- �ּҰ˻� -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('sample6_address').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
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
								alert("�̸��� �ּҸ� ��Ȯ�� �Է��� �ּ���")
								
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
							alert("������ȣ�� Ȯ���� �ּ���!")
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
						<li class="active"><a href="#">����������</a></li>
						<li><a href="/khhospital/control?cmd=MYRESERVE">���Ό����ȸ</a></li>
						<li><a href="/khhospital/control?cmd=REGIDELETE">ȸ�� Ż��</a></li>
					</ul>
		
					<div class="tab-content">	
						<form id="form1" class="form-search" method="post" style="margin-left:250px" action ="/khhospital/control?cmd=REGIUPDATEPROC">
							<input type ="hidden" name ="pat_level" value ="${patient.pat_level }"/>
							<img src="/khhospital/design/images/regi_update_banner.jpg" style="margin-left:90px"/>
							<table id="tbl">
								<tr>	
									<td>
										<input type="text" id="id" name ="name" required="required" placeholder="�̸�" readonly="readonly"
										value ="${patient.pat_name }"/>					
									</td>
								</tr>
								<tr>	
									<td>
										<input type="text" id="id" name="id" required="required" placeholder="���̵�" readonly="readonly" 
										value ="${patient.pat_id }"/>					
									</td>
								</tr>
								<tr>		
									<td>
										<input type="password" id="oldPass" name="oldPass" placeholder="���� ��й�ȣ" required="required" /><br/>							
									</td>
									<td><img src="" id="check_oldPass"/></td>
								</tr>
								<tr>
									<td>
										<input type="password" id="pass1" name="pass1" placeholder="�� ��й�ȣ (6~12�ڷ� �Է����ּ���)" required="required" />
									</td>
									<td><img src="" id="check_pass1"/></td>
								</tr>
								<tr>
									<td>
										<input type="password" id="pass2" name="pass2" placeholder="�� ��й�ȣ Ȯ�� " required="required" />
									</td>
									<td><img src="" id="check_pass2"/></td>
								</tr>
								<tr>
									<td>
										<input type="text" id="social1" name="social1" placeholder="�ֹι�ȣ" required="required" readonly="readonly" value="${patient.pat_social1 }"/> - 
										<input type="text" id="social2" name="social2" required="required" readonly="readonly" value="${patient.pat_social2 }" />		
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="text" id="email1" name="email1" placeholder="�̸���" required="required" value="${patient.pat_email1 }" /> @ 
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
										<input type="text" id="sample6_postcode" placeholder="�����ȣ" class="addr1" name="addr1" value="${patient.pat_addr1 }">
										<img src="/khhospital/design/images/btn_addr.jpg" id="btnAddr" /><br/>			
										<input type="text" id="sample6_address" placeholder="�ּ�" class="addr2" name="addr2" value="${patient.pat_addr2 }"><br/>
										<input type="text" id="sample6_address2" placeholder="���ּ�" class="addr2" name="addr3" value="${patient.pat_addr3 }">			
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