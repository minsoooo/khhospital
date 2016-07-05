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
			<th>병원정보</th>
			<th>진료과</th>
			<th>상담 및 예약</th>
			<th>고객의 소리</th>
			<th style="border: 0px">기타 기능</th>
		</tr>
		<tr>
			<td><a href="/khhospital/control?cmd=INTRO">병원 소개</a><br />
			<br /> <a href="/khhospital/control?cmd=DOCINFOSEARCH">의료진 소개</a><br />
			<br /> <a href="/khhospital/control?cmd=MAP">병원 오는 길</a><br />
			<br /> <a
				href="/khhospital/control?cmd=MGRNOTICEBOARDMAIN&nowPage=0&nowBlock=0">공지
					사항</a><br />
			<br /> <a
				href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=0&nowBlock=0">병원
					소식</a><br />
			<br /> <a href="#">관련 뉴스</a><br />
			<br /></td>
			<td><a href="/khhospital/control?cmd=DEPTINDEX&dept=SURG">외과</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=INTER">내과</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=DENT">치과</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=OPTI">안과</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=SKIN">피부과</a><br />
			<br /> <a href="/khhospital/control?cmd=DEPTINDEX&dept=PSY">신경과</a><br />
			<br /></td>
			<td><a href="/khhospital/control?cmd=CHECKLISTSTART">자가 진단하기</a><br />
			<br /> <a href="/khhospital/control?cmd=STEP1">실시간 상담하기</a><br />
			<br /> <a href="/khhospital/control?cmd=SEARCHDOC&check=SEARCHWORK">진료일정
					조회</a><br />
			<br /> <a href="javascript:fnCheck()">진료 예약하기</a><br />
			<br /></td>
			<td><a
				href="/khhospital/control?cmd=MGROQBOARDMAIN&nowPage=0&nowBlock=0">자주
					묻는 질문</a><br />
			<br /> <a
				href="/khhospital/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0">문의하기</a><br />
			<br /> <a
				href="/khhospital/control?cmd=ADBOARDMAIN&nowPage=0&nowBlock=0">간병인을
					구합니다</a><br />
			<br /></td>
			<td style="border: 0px"><a href="javascript:fnLogin()">로그인</a><br />
			<br /> <a href="javascript:fnRegiOpen()">회원가입</a><br />
			<br /> <a href="javascript:fnLogIn_id()">아이디 찾기</a><br />
			<br /> <a href="javascript:fnLogIn_password()">비밀번호 찾기</a><br />
			<br /></td>
		</tr>
	</table>

</body>
</html>