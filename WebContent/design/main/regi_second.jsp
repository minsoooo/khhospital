<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.css" />
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
			
			$("#btnInput").click(
				function(){
					var $form = $("#form1")
					$form.submit();
				}		
			);
		}
	);
</script>
<style>
#phone1 {
	width: 70px;
}

#form1 {
	margin-top: 20px;
}

td {
	padding-top: 5px;
}

#name {
	width: 300px;
}

#social1, #social2 {
	width: 136px;
}

.addr1{
	width: 175px;
}

.addr2, .addr3{
	margin-top:5px;
	width: 300px;
}
</style>

</head>
<body>
<form id="form1" class="form-search" method="post" action="/khhospital/control?cmd=REGISECOND">
	<input type ="hidden" name ="pat_num"  value ="${sessionScope.pat_num }"/>
	<a href="#"> &nbsp;�� ����������޹�ħ</a>
	<table>
		<tr>		
			<td>
				<input type="text" id="name" name ="name"placeholder="�̸�" required="required" />
			</td>
		</tr>
		<tr>		
			<td>
				<input type="text" id="social1" name ="social1" placeholder="�ֹι�ȣ" required="required" /> - 
				<input type="text" id="social2" name ="social2" required="required" />
			</td>
		</tr>
		<tr>
			<td>
				<select id="phone1" name="phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>&nbsp;-&nbsp;
				<input type="text" name="phone2" class="input-small" required="required" maxlength="4"/>&nbsp;-&nbsp;
				<input type="text" name="phone3" class="input-small" required="required" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="sample6_postcode" placeholder="�����ȣ" class="addr1" name="addr1">
				<img src="/khhospital/design/images/btn_addr.jpg" id="btnAddr" /><br/>			
				<input type="text" id="sample6_address" placeholder="�ּ�" class="addr2" name="addr2"><br/>
				<input type="text" id="sample6_address2" placeholder="���ּ�" class="addr2" name="addr3">			
			</td>
		</tr>
		<tr>
			<td>
				<img src="/khhospital/design/images/btn_input.jpg" id="btnInput" />
			</td>
		</tr>
	</table>
</form>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>