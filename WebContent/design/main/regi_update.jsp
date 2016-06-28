<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Regi.html</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/khhospital/js/check_text.js"></script>
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

<style>
.table{width:750px}
th{background-color: #C4DEFF; width:150px}

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

.table th {
	text-align: center;
}

</style>

<script>
	$(document).ready(
		function(){
			$("#btn").click(
				function(){
					if($("#pass").attr("value") == $("#pass1").val() && $("#check").attr("value") == "true"){
						alert("�����Ͻðڽ��ϱ�?");
						$("#form1").submit();
					}
					else if($("#check").attr("value") == "false"){
						alert("��й�ȣ ������ �����ּ���!");
					}
					else{
						alert("���� ��й�ȣ�� �ٽ� �Է��� �ּ���!");						
					}
				}		
			);	
			
			$("#pass2").keyup(
					function(){
						var flag = Event.checkText($("input[name='pass2']").val());
						
						if(!flag){
							$("#check_pass2").text("��й�ȣ ������ ���� �ּ���!").css("color", "red");	
							$("#check").attr("value", "false");
						}				
						else if(flag){
							$("#check_pass2").text("��� ������ ��й�ȣ�Դϴ�.").css("color", "#4197e0");
							$("#check").attr("value", "true");
						}
					}		
			);
			
			var phone = "#"+$("#p1").attr("value").trim();
			$(phone).attr("selected","selected");
			
			var question = $("#q").attr("value").trim();
			
			for(var i = 0; i < 5; i++){
				var id = "#"+i;
				if($(id).text() == question){
					 $(id).attr("selected","selected");
				 }
			} 
		}
	);
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>

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
						<form class="form-search" method="post" action="/khhospital/control?cmd=REGIUPDATEPROC" id ="form1" style="margin-left:70px">
									<input type="hidden" id="pass" value="${patient.pat_pass}" />
									<input type="hidden" id="p1" value="${patient.pat_phone1}" />
									<input type="hidden" id="q" value="${patient.pat_question}" />
									<input type="hidden" id="check" value="" />
									<table class="table table-bordered">
										<tr><h1 style="margin-left:260px">�� ���� ����</h1></tr>
										<tr>
											<th>����</th>
											<td><input type="text" name="name" class="input-small" required="required" readonly="readonly" value="${patient.pat_name}"/></td>
										</tr>	
										<tr>
											<th>���̵�</th>
											<td><input type="text" name="id" class="input-small" required="required" readonly="readonly" value="${patient.pat_id}"/></td>
										</tr>
										<tr>
											<th>���� ��й�ȣ</th>
											<td><input type="password" id="pass1" name="pass1" class="input-small" required="required" /></td>
										</tr>		
										<tr>
											<th>���� �� ��й�ȣ</th>
											<td><input type="password" id="pass2" name="pass2" class="input-small" required="required" />&nbsp;&nbsp;* 6~12�ڷ� �Է��ϼ���.
												<div id="check_pass2"></div>
											</td>
										</tr>
										<tr>
											<th>����ó</th>
											<td>
											
												<select class="span2" name="phone1">
													<option id="010" >010</option>
													<option id="011">011</option>
													<option id="016">016</option>
													<option id="017">017</option>
													<option id="018">018</option>
													<option id="019">019</option>
												</select>&nbsp;&nbsp;-&nbsp;
												<input type="text" class="input-small" required="required" name="phone2" value="${patient.pat_phone2}"/>&nbsp;&nbsp;-&nbsp;
												<input type="text" class="input-small" required="required" name="phone3" value="${patient.pat_phone3}"/>
											</td>
										</tr>		
										<tr>
											<th>�̸���</th>
											<td><input type="text" name="email1" class="input-medium" required="required" value="${patient.pat_email1}"/> @ 
												<input type="text" name="email2" class="input-medium" required="required" value="${patient.pat_email2}"/>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<th>���� ã�� ����</th>
											<td>
												<select name="question" >								
													<option id="0">������ �ʵ��б��� �̸���?</option>
													<option id="1">���� ģ�� ģ����?</option>
													<option id="2">���� �����ϴ� ������?</option>
													<option id="3">���� �����ϴ� ����?</option>
													<option id="4">���� �����ϴ� ������?</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>������ ��</th>
											<td><input type="text" name="answer" class="input-large" required="required" value="${patient.pat_answer}"/></td>
										</tr>
										<tr>
											<th>�ּ�</th>
											<td>
												<input type="text" name="addr1" id="sample6_postcode" placeholder="�����ȣ" value="${patient.pat_addr1}">
												<input type="button" value="�����ȣ �˻�" class="btn" 	onclick="sample6_execDaumPostcode()" /><br/><br/>				
												<input type="text" id="sample6_address" name="addr2" placeholder="�ּ�" class="input-xxlarge" value="${patient.pat_addr2}"><br/>			
												<input type="text" id="sample6_address2" name="addr3"placeholder="���ּ�" class="input-xlarge"value="${patient.pat_addr3}">				
											</td>
										</tr>
									</table>
									<div style="margin-left:270px">
										<input type="button" id="btn" value="�����Ϸ�" class="btn btn-large"/>
										<input type="reset" value="�ٽþ���" class="btn btn-large" />
									</div>
								</form>
							</div>
				</div>
			</div>
		</div>
	</div>
			

	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>

	<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>