<!-- 
	 작성자 : 박민수
	 작성일 : 2016-06-21
	 설명 : ajax를 통한 광고이미지 자동으로 가져오기 
 -->


<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<style>

#adDiv img{
	border: 1px solid #d8d8d8;
	width: 400px;
	height: 200px;
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

</style>

<script>
	function fnLogin() {
		window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
	}
	// 상담 환자만 가능하게/ 환자 레벨이 낮을경우 추가정보 입력창으로 이동하기.
	function fnSangdamCheck(){
		var checkLogin=	$("#checkLogin").attr("value");
		if(checkLogin =="patient"){
			var pat_level = $("#checkLevel").attr("value");
			if(pat_level == "2"){
				location.href ="/khhospital/control?cmd=STEP1";				
			}else{
				window.open("/khhospital/design/main/regi_question.jsp","","width=390,height=320,top=+200,left=+480");
			}
		}else if (checkLogin =="doctor"){
			alert("환자만 사용가능합니다.")
		}else if(checkLogin =="manager"){
			alert("환자만 사용가능합니다.")
		}else{
			alert("로그인이 필요합니다.");
			window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
		}
	}
	// 진료 예약은 환자만 가능하게/ 로그인 시에만 가능 하게 하기 
	function fnCheck(){
		var checkLogin=	$("#checkLogin").attr("value");
		if(checkLogin =="patient"){
			var pat_level = $("#checkLevel").attr("value");
			if(pat_level == "2"){
				location.href ="/khhospital/control?cmd=SEARCHDOC&check=RESERVE";				
			}else{
				window.open("/khhospital/design/main/regi_question.jsp","","width=390,height=320,top=+200,left=+480");
			}
		}else if (checkLogin =="doctor"){
			alert("환자만 사용가능합니다.")
		}else if(checkLogin =="manager"){
			alert("환자만 사용가능합니다.")
		}else{
			alert("로그인이 필요합니다.");
			window.open("/khhospital/control?cmd=LOGIN", "", "width=400,height=250,top=+400,left=+600");
		}
	}
	var ad_name ="";
	$(document).ready(
		function(){
			$.post("/khhospital/ad.do","","xml").done(
					function(xml){
						var adv = $(xml).find("adv");
						if(adv.length){
							$(adv).each(
								function(){
									// 하나의 스트링으로 묶어준다 
									ad_name += "/"+$(this).find("name").text();

								}		
							);
							
						}
						//스플릿 해서  각각 이름 가져오기 
						var name1 = ad_name.split("/")[1];
						var name2 = ad_name.split("/")[2];
						var name3 = ad_name.split("/")[3];
						//src를 만들어 준다 
						var src1 = "/khhospital/upload/"+name1;
						var src2 = "/khhospital/upload/"+name2;
						var src3 = "/khhospital/upload/"+name3;
						// 슬라이드쇼 src 속성 수정 
						$("#ad1").attr("src",src1);
						$("#ad2").attr("src",src2);
						$("#ad3").attr("src",src3);
						
					}
			);
		}		
	);
	
</script>
</head>
<body>

<span id ="checkLogin" value ="${sessionScope.user}"></span>
<span id ="checkLevel" value ="${sessionScope.pat_level }"></span>
<!-- 로고 & 광고 -->
		<div class="container">
			<div class="row" style="margin-top: 50px">
				<div class="span8" style="margin-left: 15px">
					<a href="/khhospital/control?cmd=INDEX"><img
						src="/khhospital/design/images/hospital_logo.jpg" /></a>
				</div>
				<div class="span4" align="center">
					<div id="ad" class="carousel slide" style="height: 220px;">
						<ol class="carousel-indicators">
							<li data-target="#ad" data-slide-to="0" class="active"></li>
							<li data-target="#ad" data-slide-to="1"></li>
							<li data-target="#ad" data-slide-to="2"></li>
						</ol>
						<!-- Carousel items -->
						<div class="carousel-inner" id ="adDiv">
							<div class="active item">
								<img src="/khhospital/design/images/sample.jpg" id ="ad1"/>
							</div>
							<div class="item">
								<img src="/khhospital/design/images/sample.jpg" id ="ad2"/>
							</div>
							<div class="item">
								<img src="/khhospital/design/images/sample.jpg" id ="ad3"/>
							</div>
						</div>
						<!-- Carousel nav -->
						<a class="carousel-control left" href="#ad" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#ad" data-slide="next">&rsaquo;</a>
					</div>
				</div>
			</div>
		</div>


 <%
 	if(session.getAttribute("id") == null){
 %>
		<!-- 사이트맵 & 로그인 -->
		<div class="container">
			<div class="row">
				<div class="span8"></div>
				<div class="span2" style="margin-left:0px">
					<div style="margin-left:70px">	
						<a href="/khhospital/control?cmd=SITEMAP"> <img src="/khhospital/design/images/sitemap.jpg"
							style="width: 100px; height: 35px;"></a>
					</div>
				</div>
				<div class="span2" style="margin-left:0px">
					<div style="margin-left:50px">					
						<a href="javascript:fnLogin()"><img
							src="/khhospital/design/images/login.jpg"
							style="width: 100px; height: 35px;"></a>
					</div>
				</div>
			</div>
		</div>
<%
 	}
 	else if(session.getAttribute("user").equals("patient")){
%>
		 <div class="container">
			<div class="row">
				<div class="span5"></div>
				<div class="span2" style="margin-left:170px">
					<div  style="margin-left:80px">
						<a href="/khhospital/control?cmd=SITEMAP"> <img src="/khhospital/design/images/sitemap.jpg"
							style="width: 100px; height: 35px;"></a>					
					</div>
				</div>
				<div class="span2">
					<div  style="margin-left:40px">
						<a href="/khhospital/control?cmd=REGIUPDATE"> <img src="/khhospital/design/images/mypage.jpg"
							style="width: 110px; height: 35px;"></a>
						</div>
				</div>
				<div class="span2">
					<div  style="margin-left:10px">
						<a href="/khhospital/control?cmd=LOGOUT"><img
							src="/khhospital/design/images/logout.jpg"
							style="width: 110px; height: 35px;"></a>
					</div>
				</div>
			</div>
		</div>
<%		
 	}else if(session.getAttribute("user").equals("doctor")){	
 %>
 		<div class="container">
			<div class="row">
				<div class="span5"></div>
				<div class="span2" style="margin-left:170px">
					<div  style="margin-left:80px">
						<a href="/khhospital/control?cmd=SITEMAP"> <img src="/khhospital/design/images/sitemap.jpg"
							style="width: 100px; height: 35px;"></a>					
					</div>
				</div>
				<div class="span2">
					<div  style="margin-left:40px">
						<a href="/khhospital/control?cmd=DOCINDEX"> <img src="/khhospital/design/images/doc_page.jpg"
							style="width: 130px; height: 35px;"></a>
						</div>
				</div>
				<div class="span2">
					<div  style="margin-left:10px">
						<a href="/khhospital/control?cmd=LOGOUT"><img
							src="/khhospital/design/images/logout.jpg"
							style="width: 110px; height: 35px;"></a>
					</div>
				</div>
			</div>
		</div>
<%		
 	}else{
 %>		
 		<div class="container">
			<div class="row">
				<div class="span5"></div>
				<div class="span2" style="margin-left:170px">
					<div  style="margin-left:80px">
						<a href="/khhospital/control?cmd=SITEMAP"> <img src="/khhospital/design/images/sitemap.jpg"
							style="width: 100px; height: 35px;"></a>					
					</div>
				</div>
				<div class="span2">
					<div  style="margin-left:40px">
						<a href="/khhospital/control?cmd=MGRINDEX"> <img src="/khhospital/design/images/mgr_page.jpg"
							style="width: 130px; height: 35px;"></a>
						</div>
				</div>
				<div class="span2">
					<div  style="margin-left:10px">
						<a href="/khhospital/control?cmd=LOGOUT"><img
							src="/khhospital/design/images/logout.jpg"
							style="width: 110px; height: 35px;"></a>
					</div>
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
				<div class="span9">
					<ul class="nav nav-tabs">
						<li class="dropdown span2"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">병원정보</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=INTRO">병원 소개</a></li>
								<li><a href="/khhospital/control?cmd=DOCINFOSEARCH&where=main">의료진 소개</a></li>
								<li><a href="/khhospital/control?cmd=MAP">병원 오는 길</a></li>
								<li><a href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&nowPage=0&nowBlock=0">공지사항</a>
								<li><a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=0&nowBlock=0">병원소식</a></li>
								<li><a href="/khhospital/control?cmd=MGRMEDICALNEWSBOARDMAIN&nowPage=0&nowBlock=0">관련뉴스</a></li>
							</ul></li>
						<li class="divider-vertical"></li>
						<li class="dropdown span2"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">진료과</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=DEPTINDEX&dept=SURG">외과</a></li>
								<li><a href="/khhospital/control?cmd=DEPTINDEX&dept=INTER">내과</a></li>
								<li><a href="/khhospital/control?cmd=DEPTINDEX&dept=DENT">치과</a></li>
								<li><a href="/khhospital/control?cmd=DEPTINDEX&dept=OPTI">안과</a></li>
								<li><a href="/khhospital/control?cmd=DEPTINDEX&dept=SKIN">피부과</a></li>
								<li><a href="/khhospital/control?cmd=DEPTINDEX&dept=PSY">신경과</a></li>
							</ul></li>
						<li class="divider-vertical"></li>
						<li class="dropdown span2"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">상담 및 예약</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=CHECKLISTSTART">자가 진단하기</a></li>
								<li><a href="javascript:fnSangdamCheck()">실시간 상담하기</a></li>
								<li><a href="/khhospital/control?cmd=SEARCHDOC&check=SEARCHWORK">진료일정 조회</a></li>
								<li><a href="javascript:fnCheck()" >진료 예약하기</a></li>
							</ul></li>
						<li class="divider-vertical"></li>
						<li class="dropdown span2"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">고객의 소리</a>
							<ul class="dropdown-menu">
								<li><a href="/khhospital/control?cmd=MGROQBOARDMAIN&nowPage=0&nowBlock=0">자주 묻는 질문</a></li>
								<li><a href="/khhospital/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0">문의하기</a></li>
								<li><a href="/khhospital/control?cmd=ADBOARDMAIN&nowPage=0&nowBlock=0">간병인을 구합니다</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="span3">
					<div class="input-append">
						<input type="text" /> <span class="btn add-on"> <img
							src="/khhospital/design/images/search2.png" style="width: 22px">
						</span>
					</div>
				</div>
			</div>
		</div>

</body>
</html>