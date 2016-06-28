<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<title>비밀번호가 틀렸을 때</title>
<style>
table{margin-top:100px; margin-bottom:70px;}
</style>
</head>
<body>
<center>
<div class="container">
	<div class="row">
		<div class="span12">
			<jsp:include page="/design/header/dept_dent_header.jsp"></jsp:include>
		</div>
	</div>
</div>
<div class="span1" style="margin-left: 40px"></div>
<div class="span10" style="margin-bottom: 40px"></div>
		<form class="form-search" method="post" action="/khhospital/control">
		<input type="hidden" name="cmd" value="DENTQBOARDREAD"/>
		<input type="hidden" name="num" value="${param.num}"/>
	
	<table>		
		<tr><td><h4>잘못된 입력입니다. 다시 입력해주세요.</h4></td></tr>
		<tr><td><input type="submit" value="돌아가기" class="btn" style="margin-left:100px; margin-top:30px"/></td></tr>
	</table>				
	</form>		
</center>
<div class="container">
		<div class="row">
			<div class="span12">				
				<jsp:include page="/design/footer/dept_footer.jsp"></jsp:include>				
			</div>
		</div>
	</div>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>