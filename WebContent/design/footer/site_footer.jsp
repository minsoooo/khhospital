<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>

#footer_table {
	color: #595959;
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left:100px;
	width: 980px;
}

#footer_tr1 {
	height: 50px;
	color: #d8d8d8;
	font-size: 20px;
	text-align: left;
}

#footer_tr1 th {
	padding-left: 30px;
	border-right: 1px solid #d8d8d8;
	vertical-align: top;
}

#footer_table td {
	width: 150px;
	font-size: 16px;
	vertical-align: top;
	font-weight: bold;
	padding-left: 30px;
	border-right: 1px solid #d8d8d8;
}

#footer_table td>a {
	color: #d8d8d8;
}

#footer_table td>a:hover {
	color: #8be4ce;
	text-decoration: none;
}
</style>
</head>

<body>
	<table id="footer_table">
		<tr id="footer_tr1">
			<th>��������</th>
			<th>�����</th>
			<th>��� �� ����</th>
			<th>���� �Ҹ�</th>
			<th style="border: 0px">��Ÿ ���</th>
		</tr>
		<tr>
			<td><a href="/khhospital/control?cmd=INTRO">���� �Ұ�</a><br />
			<br /> <a href="/khhospital/control?cmd=DOCINFOSEARCH">�Ƿ��� �Ұ�</a><br />
			<br /> <a href="/khhospital/control?cmd=MAP">���� ���� ��</a><br />
			<br /> <a
				href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&nowPage=0&nowBlock=0">����
					����</a><br />
			<br /> <a
				href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=0&nowBlock=0">����
					�ҽ�</a><br />
			<br /> <a href="#">���� ����</a><br />
			<br /></td>
			<td><a href="/khhospital/control?cmd=DEPTINDEX&dept=SURG">�ܰ�</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=INTER">����</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=DENT">ġ��</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=OPTI">�Ȱ�</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=SKIN">�Ǻΰ�</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=PSY">�Ű��</a><br />
			<br /></td>
			<td><a href="/khhospital/control?cmd=CHECKLISTSTART">�ڰ� �����ϱ�</a><br />
			<br /> <a href="/khhospital/control?cmd=STEP1">�ǽð� ����ϱ�</a><br />
			<br /> <a href="/khhospital/control?cmd=SEARCHDOC&check=SEARCHWORK">��������
					��ȸ</a><br />
			<br /> <a href="javascript:fnCheck()">���� �����ϱ�</a><br />
			<br /></td>
			<td><a
				href="/khhospital/control?cmd=MGROQBOARDMAIN&nowPage=0&nowBlock=0">����
					���� ����</a><br />
			<br /> <a
				href="/khhospital/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0">�����ϱ�</a><br />
			<br /> <a
				href="/khhospital/control?cmd=ADBOARDMAIN&nowPage=0&nowBlock=0">��������
					���մϴ�</a><br />
			<br /></td>
			<td style="border: 0px"><a href="javascript:fnLogin()">�α���</a><br />
			<br /> <a href="javascript:fnRegiOpen()">ȸ������</a><br />
			<br /> <a href="javascript:fnLogIn_id()">���̵� ã��</a><br />
			<br /> <a href="javascript:fnLogIn_password()">��й�ȣ ã��</a><br />
			<br /></td>
		</tr>
	</table>

</body>
</html>