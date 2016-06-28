<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<style>
body {
	text-align: left;
}
</style>
</head>
<body>
	<center>
		<div style="margin-top: 50px"></div>
		<form class="form-search" method="post" action="/khhospital/control?cmd=SEARCHPASSPROC">
			<table>
				<tr>
					<th>아이디입력</th>
					<td><input type="text" name="id" class="input-medium"
						required="required" /></td>
				</tr>
				<tr>
					<th>계정찾기질문</th>
					<td><select name="question">
							<option>졸업한 초등학교의 이름은?</option>
							<option>가장 친한 친구는?</option>
							<option>가장 좋아하는 과일은?</option>
							<option>가장 좋아하는 색은?</option>
							<option>가장 좋아하는 음식은?</option>
					</select></td>
				</tr>
				<tr>
					<th>질문의 답</th>
					<td><input type="text" class="input-medium" name="answer"
						required="required" /> 
					</td>
				</tr>
			</table>
			<input type="submit" value="비밀번호찾기"
						class="btn btn-warning"  style="margin-left: 60px; margin-top:20px"/>
		</form>
	</center>
	
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>