<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
 #docImg {
 	border: 2px solid #595959;
 	width : 200px;
 	height : 200px;
 }
 
 #doc_name{
	 color:#4197e0;
	font-weight:bold;
	font-size:40px;
 } 
 
#dept_name{
font-weight: bold;
font-size :25px;
color:#595959;

}

#dept{
font-weight:bold;
font-size:25px;
color:#595959;
}

#doc_part{
font-weight:bold;
font-size:25px;
color:#595959;
}
				
#part{
font-weight:bold;
font-size:20px;
color:#595959;

}

#mainDiv{
	margin-top:40px;
	margin-left:150px;
}
 
</style>
</head>
</head>
<body>
	<%!//시작일을 저장하는 constant
		public static final int START_DATE = 1;
	%>

	<%
		Calendar cal = Calendar.getInstance(); 
		int now_month = cal.get(Calendar.MONTH)+1;
		 int now_year = cal.get(Calendar.YEAR);
		 request.setAttribute("now_month", now_month);
		 request.setAttribute("now_year", now_year);
	%>

	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/dept_dent_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class ="container">
		<div class ="row">
			<div class ="span12" id="mainDiv">
				<c:forEach items="${docList }" var="list">
					<div class ="row">		
						<div class ="span4">
							<a href ="/khhospital/control?cmd=SEARCHWORK&doc_num=${list.doc_num}&now_month=${now_month }&now_year=${now_year}&where=dent">
							<img src ="/khhospital/upload/${list.doc_img }" id ="docImg"/></a>
						</div>
						<div class ="span4">
							<br/><br/>		
							<span id="doc_name">${list.doc_name}</span><span id="dept_name">교수</span><span id ="dept">[${list.dept_name }]</span>
							<br/><br/><br/>			
								<p id ="doc_part">[진료분야]</p> 
								<br/>
							<span id ="part">: ${list.doc_part }</span>						
						</div>	
					</div>
					<br/><br/>
				</c:forEach>
			</div>
		</div>
	</div>
<div class="container">
		<div class="row">
			<div class="span12">				
				<jsp:include page="/design/footer/dept_footer.jsp"></jsp:include>				
			</div>
		</div>
	</div>	
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>