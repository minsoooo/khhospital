<!-- 
	�ۼ��� : �ڹμ�
	�ۼ��� : 2016-06-21
	���� : ���� ���� �ǻ� ������ �˻��ϱ� ���� �˻� ȭ�� 

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
			$("#deptTable").css("margin-left","260px").css("margin-top","50px")
			.css("font-size","30px").css("text-align","center").css("margin-bottom","50px")
			$("#deptTable td").css("width","300px").css("height","50px")
			$("#deptTable a").css("border-bottom","1px solid #d8d8d8")
			$("#deptTable li").css("color","#4197e0")
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

	<div class ="container">
		<div class ="row">
			<div class ="span12">
				<table  id ="deptTable">
					<tr>
						<td><ul><li><a href="/khhospital/control?cmd=DOCINFODEPT&dept_no=1&where=main">�ܰ�</a></li></ul></td>
						<td><ul><li><a href="/khhospital/control?cmd=DOCINFODEPT&dept_no=2&where=main" >����</a></li></ul></td>
					</tr>
					<tr>
						<td><ul><li><a href="/khhospital/control?cmd=DOCINFODEPT&dept_no=5&where=main" >�Ȱ�</a></li></ul></td>
						<td><ul><li><a href="/khhospital/control?cmd=DOCINFODEPT&dept_no=3&where=main" >ġ��</a></li></ul></td>
					</tr>

					<tr>
						<td><ul><li><a href="/khhospital/control?cmd=DOCINFODEPT&dept_no=6&where=main">�Ű��</a></li></ul></td>
						<td><ul><li><a href="/khhospital/control?cmd=DOCINFODEPT&dept_no=4&where=main">�Ǻΰ�</a></li></ul></td>
					</tr>
									
				</table>

			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>