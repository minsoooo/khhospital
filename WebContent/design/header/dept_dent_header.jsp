<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내과 헤더</title>
<style>
#empty{
 margin-left: 150px;
}

body {
	margin-top: 50px;
}

.nav {
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}

.nav-tabs {
	border-bottom: 0px;
}

[class*="span"] {
	float: left;
	min-height: 1px;
	margin-left: 10px
}

h1 {
	color: #595959;
}

a {
	color: #595959;
	text-decoration: none
}

a:hover,a:focus {
	color: #4197e0;
	background-color: #fff;
}
.nav-tabs .open .dropdown-toggle {
	color: #4197e0;
	background-color: #fff;
	border-color: #fff
}

</style>

<script>
	function fnLogin() {
		window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=200,top=+400,left=+600");
	}
</script>

</head>
<body>
<div class="container">
		<div class="row">
			<div class="span8" style="margin-left: 15px">
				<a href="/khhospital/control?cmd=DEPTINDEX&dept=DENT"><img src="/khhospital/design/images/denti_logo.jpg" /></a>
			</div>
		</div>
	</div>
<%
 	if(session.getAttribute("id") == null){
 %>

	<!-- 로그인 -->
	<div class="container">
		<div class="row">
			<div class="span8"></div>
			<div class="span2" style="margin-left: 60px">
				<a href="/khhospital/control?cmd=INDEX"> <img src="/khhospital/design/images/go_main.jpg"
					style="width: 130px; height: 35px;"></a>
			</div>
			<div class="span2">
				<a href="javascript:fnLogin()"><img src="/khhospital/design/images/login.jpg"
					style="width: 100px; height: 35px;"></a>
			</div>
		</div>
	</div>
<%
 	}
 	else{
%>
	<div class="container">
		<div class="row">
			<div class="span8"></div>
			<div class="span2" style="margin-left: 60px">
				<a href="/khhospital/control?cmd=INDEX"> <img src="/khhospital/design/images/go_main.jpg"
					style="width: 130px; height: 35px;"></a>
			</div>
			<div class="span2">
				<a href="/khhospital/control?cmd=LOGOUT"><img src="/khhospital/design/images/logout.jpg"
					style="width: 110px; height: 35px;"></a>
			</div>
		</div>
	</div>
<%		
 	}
%>
	<!-- 구분선 -->
	<div class="container">
		<div class="row">
			<div class="span12">
				<hr style="border: 3px solid #26699e" />
			</div>
		</div>
	</div>

	<!-- 메인메뉴 -->
	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="span3" id="empty"><a href="/khhospital/control?cmd=DENTNBOARDMAIN">공지사항</a></li>
					<li class="span3"><a href="/khhospital/control?cmd=DOCINFOSEARCH&dept_no=3&where=dent">진료일정조회/예약</a></li>
					<li class="span3"><a href="/khhospital/control?cmd=DENTQBOARDMAIN">온라인질문</a></li>
				</ul>
			</div>		
		</div>
	</div>

</body>
</html>