<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
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

a {
	color: #595959;
	text-decoration: none
}

a:hover, a:focus {
	color: #4197e0;
	text-decoration: none;
}

.nav-tabs .open .dropdown-toggle {
	color: #4197e0;
	background-color: #fff;
	border-color: #fff
}

.dropdown-menu>li>a {
	padding: 15px;
	color: #595959;
}

.dropdown-menu>li>a:hover, .dropdown-menu>li>a:focus {
	color: #fff;
}

footer {
	background-color: #595f6a;
}

.foot1>a, .foot1 .caret, .foot2>a, .foot2 .caret {
	color: #fff;
}

.foot1>a:hover, .foot1>a:focus, .foot2>a:hover, .foot2>a:focus {
	color: #8be4ce;
}

.foot1 .caret, .foot2 .caret {
	margin-top: 8px;
	margin-left: 3px;
	border-top: 4px solid #fff;
}

.dropdown {
	margin-left :80px
}
</style>
</head>

<body>
<header style="background-color: #fff;">
		<!-- 로고 & 광고 -->
		<div class="container">
			<div class="row" style="margin-top: 50px">
				<div class="span8" style="margin-left: 15px">
					<a href="/khhospital/control?cmd=MGRINDEX"><img
						src="/khhospital/design/images/mgr_logo.jpg" /></a>
				</div>				
			</div>
		</div>

		<!-- 로그아웃 -->
		<div class="container">
			<div class="row">
				<div class="span8"></div>
				<div class="span2">
					<a href="/khhospital/control?cmd=INDEX"><img src="/khhospital/design/images/go_main.jpg"
						style="width: 130px; height: 35px; margin-left:60px"></a>
				</div>				
				<div class="span2">
					<a href="/khhospital/control?cmd=LOGOUT"><img src="/khhospital/design/images/logout.jpg"
						style="width: 130px; height: 35px ; margin-left:50px"></a>
				</div>
			</div>
		</div>

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
					<div class ="span2"></div>
					<ul class="nav nav-tabs">
						<li class="dropdown span2 "><a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판 관리</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&mgr=true" >공지 사항</a></li>
								<li><a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&mgr=true" >병원 소식</a></li>
								<li><a href="/khhospital/control?cmd=MGRMEDICALNEWSBOARDMAIN&mgr=true" >관련 뉴스</a></li>
								<li><a href="/khhospital/control?cmd=MGROQBOARDMAIN&mgr=true" >자주묻는 질문</a></li>
							</ul></li>
						
						<li class="dropdown span2"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">의사정보관리</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=REGDOC" >의사등록</a></li>
								<li><a href="/khhospital/control?cmd=SEARCHDOC&check=DOC" >의사정보수정</a></li>
								<li><a href="/khhospital/control?cmd=SEARCHDOC&check=WORK" >의사근태관리</a></li>
							</ul></li>
						
						<li class="dropdown span2"><a href=""
							class="dropdown-toggle" data-toggle="dropdown">광고 설정</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=REGAD" >광고등록/수정</a></li>
							</ul></li>	
						</ul>			
				</div>
		</div>
	</div>
	</header>
</body>
</html>