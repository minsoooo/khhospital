<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã��</title>
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
					<th>���̵��Է�</th>
					<td><input type="text" name="id" class="input-medium"
						required="required" /></td>
				</tr>
				<tr>
					<th>����ã������</th>
					<td><select name="question">
							<option>������ �ʵ��б��� �̸���?</option>
							<option>���� ģ�� ģ����?</option>
							<option>���� �����ϴ� ������?</option>
							<option>���� �����ϴ� ����?</option>
							<option>���� �����ϴ� ������?</option>
					</select></td>
				</tr>
				<tr>
					<th>������ ��</th>
					<td><input type="text" class="input-medium" name="answer"
						required="required" /> 
					</td>
				</tr>
			</table>
			<input type="submit" value="��й�ȣã��"
						class="btn btn-warning"  style="margin-left: 60px; margin-top:20px"/>
		</form>
	</center>
	
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>