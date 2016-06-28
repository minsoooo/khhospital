<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<title>글 수정 대기화면</title>
<style>
table{text-align:left; margin-top:150px; margin-bottom:150px;}
input[type=password]{width:200px; height:30px;}
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

<!-- 글을 수정하기위해서, 받아온 글번호와 기존에 입력되어있던 DB의 비밀번호를 새로 입력한 비밀번호와 같이 전송한다. -->
<div class="container">
	<div class="row">
		<div class="span12">
			<div style="margin-top:50px; margin-left:400px">
				<form class="form-search" method="post" action="/khhospital/control">
					<input type="hidden" name="cmd" value="ADBOARDUPDATEREAD"/>		
					<input type="hidden" name="num" value="${param.num}"/>
					<input type="hidden" name="realpass" value="${param.realpass}"/>
				<table>
					<caption><strong>작성시 입력한 비밀번호와 일치해야 수정됩니다.<br/><br/><br/><br/></strong></caption>
					<tr><th>비밀번호입력</th>
						<td><input type="password" required="required" name="userpass" />
						<input type="submit" value="전송" class="btn" /></td></tr>
				</table>				
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>