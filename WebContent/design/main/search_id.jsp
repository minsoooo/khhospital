<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<style>
table {
	text-align: left
}
</style>
</head>
<body>
	<center>
		<div style="margin-top: 50px"></div>
		<form class="form-search" method="post" action="/khhospital/control?cmd=SEARCHIDPROC">
			<table>
				<tr>
					<th>�̸����Է�</th>
					<td><input type="text" name="email1" class="input-small" required="required" />
						@ <input type="text" name="email2" class="input-small" required="required" />
					</td>
				</tr>
				<tr>
					<th>�ֹε�Ϲ�ȣ�Է�&nbsp;</th>
					<td><input type="text" name="social1" class="input-small" required="required" />&nbsp;
						- &nbsp;<input type="password" name="social2" class="input-small"
						required="required" /> 
					</td>
				</tr>
			</table>
			<input type="submit" value="���̵�ã��" class="btn btn-warning" style="margin-left: 60px; margin-top:20px"/>
		</form>
	</center>
	
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>