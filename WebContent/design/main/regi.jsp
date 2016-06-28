<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/khhospital/js/check_text.js"></script>
<script src="/khhospital/js/ajax.js"></script>
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){						
			$("#checkId").click(
				function() {
					  
					  if($("#id").val() == ""){ 
						  alert("���̵� �Է��ϼ���");
						  $("#check").attr("value", "false");
					  }
					  
					  $.get("/khhospital/design/main/check_id.jsp", {"id":$("#id").val()},
						  function(data){
						  	if($(data).find("result").text() == "true"){
							  	$("#check_result").text($(data).find("data").text()).css("color", "#4197e0");
							  	$("#check").attr("value", "true");
					  		}
					  		else{
					  			$("#check_result").text($(data).find("data").text()).css("color", "red");
					  			$("#check").attr("value", "false");
						  	}
					  	}						  
					  );
				  }				
			);
			
			$("#pass1").keyup(
				function(){
					var flag = Event.checkText($("input[name='pass1']").val());
					
					if(!flag){
						$("#check_pass1").text("��й�ȣ ������ ���� �ּ���!").css("color", "red");	
						$("#check").attr("value", "false");
					}				
					else if(flag){
						$("#check_pass1").text("��� ������ ��й�ȣ�Դϴ�.").css("color", "#4197e0");
						$("#check").attr("value", "true");
					}
				}		
			);
			
			$("#pass2").blur(
				function(){
					if($("#pass1").val().length >= 6 && $("#pass1").val().length <= 12 && 
							($("#pass1").val() == $("#pass2").val())){
						$("#check_pass2").text("��й�ȣ�� Ȯ�εǾ����ϴ�.").css("color", "#4197e0");	
						$("#check").attr("value", "true");
					}
					else if($("#pass1").val().length > 0 && ($("#pass1").val() != $("#pass2").val())){
						$("#check_pass2").text("������ ��й�ȣ�� �Է��� �ּ���!").css("color", "red");	
						$("#check").attr("value", "false");
					}
				}			
			);
		}
	);
</script>

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
<style>
.table{width:750px}
th{background-color: #C4DEFF; width:100px}
#regisubmit1{text-align:center}
</style>
</head>
<body>
<form class="form-search" method="post" action="/khhospital/control?cmd=REGIPROC" style="margin-left:40px" name="form1">
	<input type="hidden" id="check" name="check" value="" />
	<h1 style="color:#595959; margin-left:300px; margin-top:10px;">ȸ������</h1>
	<table class="table table-bordered">
		<tr>
			<th>����</th>
			<td><input type="text" name="name" class="input-small" required="required"/></td>
		</tr>
		<tr>
			<th>���̵�</th> 
			<td><input type="text" name="id" id="id" class="input-small" required="required" />			
				<input type="button" value="�ߺ�Ȯ��" class="btn" id="checkId" />&nbsp;&nbsp;  * 6~12�ڷ� �Է��ϼ���.
				<div id="check_result"></div>
			</td>
		</tr>
		<tr>
			<th>��й�ȣ</th>
			<td><input type="password" name="pass1" id="pass1" class="input-small" required="required" />&nbsp;&nbsp; * 6~12�ڷ� �Է��ϼ���. 
				<div id="check_pass1"></div>
			</td>
		</tr>
		<tr>
			<th>��й�ȣȮ��</th>
			<td><input type="password" name="pass2" id="pass2" class="input-small" required="required" />
			<div id="check_pass2"></div>
			</td>
		</tr>
		<tr>
			<th>�ֹε�Ϲ�ȣ</th>
			<td><input type="text" name="social1" class="input-small" required="required" maxlength="6"/>
				-&nbsp;<input type="password" name="social2" class="input-small" required="required" maxlength="7"/>
			</td>
		</tr>
		<tr>
			<th>����ó</th>
			<td>
				<select class="span2" name="phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>&nbsp;&nbsp;-&nbsp;
				<input type="text" name="phone2" class="input-small" required="required" maxlength="4"/>&nbsp;&nbsp;-&nbsp;
				<input type="text" name="phone3" class="input-small" required="required" maxlength="4"/>
			</td>
		</tr>		
		<tr>
			<th>�̸���</th>
			<td><input type="text" name="email1" class="input-medium" required="required" /> @ 
				<input type="text" name="email2" class="input-medium" required="required" />&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<th>���� ã�� ����</th>
			<td>
				<select name="question">								
					<option>������ �ʵ��б��� �̸���?</option>
					<option>���� ģ�� ģ����?</option>
					<option>���� �����ϴ� ������?</option>
					<option>���� �����ϴ� ����?</option>
					<option>���� �����ϴ� ������?</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>������ ��</th>
			<td><input type="text" name="answer" class="input-large" required="required" /></td>
		</tr>
		<tr>
			<th>�ּ�</th>
			<td>
				<input type="text" name="addr1" id="sample6_postcode" placeholder="�����ȣ">
				<input type="button" value="�����ȣ �˻�" class="btn" 	onclick="sample6_execDaumPostcode()" /><br/><br/>				
				<input type="text" name="addr2" id="sample6_address" placeholder="�ּ�" class="input-xxlarge">		
				<input type="text" name="addr3" id="sample6_address2" placeholder="���ּ�" class="input-xlarge">				
			</td>
		</tr>
	</table>
	<div style="margin-left:260px">
		<input type="submit" value="�����ϱ�" class="btn btn-large" />
		<input type="reset" value="���" class="btn btn-large" />
	</div>
</form>

<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>