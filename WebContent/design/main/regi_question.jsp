<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	function fnRegisecond(){
		window.close();
		window.open("/khhospital/control?cmd=REGI&check=second","","width=390,height=350,top=+200,left=+480");
	}
	
	function fnBack(){
		window.close();
	}
</script>
<style>
	#btnDiv{
		margin-top: 10px;
		margin-left: 18px;
	}
	
	#btnInsert{
		margin-bottom:10px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span12" style="margin-top:20px">
				<img src="/khhospital/design/images/regi_banner.jpg" />
				<div id="btnDiv">
					<a href="javascript:fnRegisecond()"><img src="/khhospital/design/images/btn_insert.jpg" id="btnInsert"/></a>&nbsp;
					<a href="javascript:fnBack()"><img src="/khhospital/design/images/btn_back.jpg" id="btn"/></a>
				</div>
			</div>
		</div>
	</div>


<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>