<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
</head>
<script>
	function fnLogin() {
		window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
	}
	
	function fnCheck(){
		var checkLogin=	$("#checkLogin").attr("value");
		if(checkLogin =="patient"){
			location.href ="/khhospital/control?cmd=SEARCHDOC&check=RESERVE";
		}else if (checkLogin =="doctor"){
			alert("ȯ�ڸ� ��밡���մϴ�.")
		}else if(checkLogin =="manager"){
			alert("ȯ�ڸ� ��밡���մϴ�.")
		}else{
			alert("�α����� �ʿ��մϴ�.");
			window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
		}
	}
	
	function fnRegiOpen(){
		window.open("/khhospital/control?cmd=REGI","","width=800,height=700,top=+100,left=+500");
	}
	
	function fnLogIn_id(){
		window.open("/khhospital/control?cmd=SEARCHID","","width=500,height=200,top=+400,left=+600");
	}
	
	function fnLogIn_password(){
		window.open("/khhospital/control?cmd=SEARCHPASS","","width=500,height=200,top=+400,left=+600");
	}
</script>

<style>
#title{
	margin-top:60px;
	margin-bottom:20px;
	font-size: 30px;
}

#table{
	color: #595959;
	margin-top:50px;
	margin-bottom:100px;
	margin-left:20px;
	width:980px;
}

#tr1{
	height:50px;
	color:#26699e;
	font-size:20px;
	text-align: left;
}

#tr1 th{
	padding-left:30px;
	border-right: 1px solid #d8d8d8;
	vertical-align: top;
}

#table td{
	width:150px;
	font-size:16px;
	vertical-align: top;
	font-weight:bold;
	padding-left:30px;
	border-right: 1px solid #d8d8d8;
}
</style>

<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12">	
				<div class="span1"></div>
				<div class="span10">	
					<div id="title"><font>����Ʈ��</font></div>
					<hr style="border:1px solid #26699e" />
					
					<table id="table">
						<tr id="tr1">
							<th>��������</th><th>�����</th><th>��� �� ����</th><th>���� �Ҹ�</th><th style="border:0px">��Ÿ ���</th>
						</tr>
						<tr>
							<td>
								<a href="/khhospital/control?cmd=INTRO">���� �Ұ�</a><br/><br/>
								<a href="/khhospital/control?cmd=DOCINFOSEARCH">�Ƿ��� �Ұ�</a><br/><br/>
								<a href="/khhospital/control?cmd=MAP">���� ���� ��</a><br/><br/>
								<a href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&nowPage=0&nowBlock=0">���� ����</a><br/><br/>
								<a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=0&nowBlock=0">���� �ҽ�</a><br/><br/>
								<a href="#">���� ����</a><br/><br/>
							</td>
							<td>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=SURG">�ܰ�</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=INTER">����</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=DENT">ġ��</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=OPTI">�Ȱ�</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=SKIN">�Ǻΰ�</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=PSY">�Ű��</a><br/><br/>
							</td>
							<td>
								<a href="/khhospital/control?cmd=CHECKLISTSTART">�ڰ� �����ϱ�</a><br/><br/>
								<a href="/khhospital/control?cmd=STEP1">�ǽð� ����ϱ�</a><br/><br/>
								<a href="/khhospital/control?cmd=SEARCHDOC&check=SEARCHWORK">�������� ��ȸ</a><br/><br/>
								<a href="javascript:fnCheck()">���� �����ϱ�</a><br/><br/>
							</td>
							<td>
								<a href="/khhospital/control?cmd=MGROQBOARDMAIN&nowPage=0&nowBlock=0">���� ���� ����</a><br/><br/>
								<a href="/khhospital/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0">�����ϱ�</a><br/><br/>
								<a href="/khhospital/control?cmd=ADBOARDMAIN&nowPage=0&nowBlock=0">�������� ���մϴ�</a><br/><br/>
							</td>
							<td style="border:0px">
								<a href="javascript:fnLogin()">�α���</a><br/><br/>
								<a href="javascript:fnRegiOpen()">ȸ������</a><br/><br/>
								<a href="javascript:fnLogIn_id()">���̵� ã��</a><br/><br/>
								<a href="javascript:fnLogIn_password()">��й�ȣ ã��</a><br/><br/>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
</body>
</html>