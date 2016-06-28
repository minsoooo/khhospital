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
			alert("환자만 사용가능합니다.")
		}else if(checkLogin =="manager"){
			alert("환자만 사용가능합니다.")
		}else{
			alert("로그인이 필요합니다.");
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
					<div id="title"><font>사이트맵</font></div>
					<hr style="border:1px solid #26699e" />
					
					<table id="table">
						<tr id="tr1">
							<th>병원정보</th><th>진료과</th><th>상담 및 예약</th><th>고객의 소리</th><th style="border:0px">기타 기능</th>
						</tr>
						<tr>
							<td>
								<a href="/khhospital/control?cmd=INTRO">병원 소개</a><br/><br/>
								<a href="/khhospital/control?cmd=DOCINFOSEARCH">의료진 소개</a><br/><br/>
								<a href="/khhospital/control?cmd=MAP">병원 오는 길</a><br/><br/>
								<a href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&nowPage=0&nowBlock=0">공지 사항</a><br/><br/>
								<a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=0&nowBlock=0">병원 소식</a><br/><br/>
								<a href="#">관련 뉴스</a><br/><br/>
							</td>
							<td>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=SURG">외과</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=INTER">내과</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=DENT">치과</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=OPTI">안과</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=SKIN">피부과</a><br/><br/>
								<a href="/khhospital/control?cmd=DEPTINDEX&dept=PSY">신경과</a><br/><br/>
							</td>
							<td>
								<a href="/khhospital/control?cmd=CHECKLISTSTART">자가 진단하기</a><br/><br/>
								<a href="/khhospital/control?cmd=STEP1">실시간 상담하기</a><br/><br/>
								<a href="/khhospital/control?cmd=SEARCHDOC&check=SEARCHWORK">진료일정 조회</a><br/><br/>
								<a href="javascript:fnCheck()">진료 예약하기</a><br/><br/>
							</td>
							<td>
								<a href="/khhospital/control?cmd=MGROQBOARDMAIN&nowPage=0&nowBlock=0">자주 묻는 질문</a><br/><br/>
								<a href="/khhospital/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0">문의하기</a><br/><br/>
								<a href="/khhospital/control?cmd=ADBOARDMAIN&nowPage=0&nowBlock=0">간병인을 구합니다</a><br/><br/>
							</td>
							<td style="border:0px">
								<a href="javascript:fnLogin()">로그인</a><br/><br/>
								<a href="javascript:fnRegiOpen()">회원가입</a><br/><br/>
								<a href="javascript:fnLogIn_id()">아이디 찾기</a><br/><br/>
								<a href="javascript:fnLogIn_password()">비밀번호 찾기</a><br/><br/>
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