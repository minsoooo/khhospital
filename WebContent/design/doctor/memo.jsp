<!-- 
	�ۼ��� : �ڹμ�
	�ۼ��� : 2016-06-20
	���� : �ǻ� ä�ý� ���� ���� �ۼ��� DB ���� �ϴ� textarea ����


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
			//������ ���� 
			$("#ta").css("border","2px solid #595959").css("height","120px")
			.css("width","300px").css("margin-left","30px").css("margin-top","20px");
			$("#saveCheck").css("margin-left","160px")
			$("body").css("background-color","#d8d8d8")
			//buttonŬ���� ���� Ȯ�� ����
			var $form = $("#form");
			$("#saveCheck").click(
				function(){
					if(confirm("�����Ͻðڽ��ϱ�")){
							$form.submit();
					}
				}		
			);
			
			// ���� �Ϸ� Ȯ��
			
			if($("#check").attr("value")=="success"){
				alert("������ �Ϸ� �Ǿ����ϴ�.")
			}
		}
	);	

</script>
</head>
<body>
<span id ="check" value ="${check}"></span>
<form method ="post" action="/khhospital/control?cmd=REGMEMO" id = "form">	
	<input type ="hidden" name ="pat_num" value ="${pat_num}"/>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
				<!-- �ؽ�Ʈ ���� ���� ���� -->
				<div class ="span4">
					<textarea id ="ta" name ="memo"></textarea>
				</div>
			</div>
		</div>
	</div>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
					<input type="button" id="saveCheck" value="����" style="width:50px;height:30px"/>
			</div>
		</div>
	</div>
</form>	
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>