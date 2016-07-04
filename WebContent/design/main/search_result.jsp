<%@page import="bean.DocDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri ="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			$("#resultTable").css("text-align","center").css("margin-left","350px").css("font-weight","bold")
			.css("font-size","20px").css("color","#595959").css("vertical-align","middle");
			$("th").css("width","150px");
			$("#mainDiv").css("margin-top","50px").css("margin-bottom","50px");
			$("#headTr").css("font-size","30px").css("border-bottom","2px solid #595959").css("height","60px");;
			$("#nameTd a").css("color","#4197e0")
			$("li").css("color","#4197e0")
			$("#resultTable tr").css("height","50px")
		}		

	);

</script>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
	String now_month =Integer.toString(cal.get(Calendar.MONTH)+1);
	String now_year =Integer.toString(cal.get(Calendar.YEAR));
	request.setAttribute("now_month", now_month);
	request.setAttribute("now_year", now_year);
%>

<div class = "container">
	<div class = "row">
		<div class ="span12">
			<jsp:include page ="/design/header/main_header.jsp"></jsp:include>
		</div>
	</div>
</div>
	<div class ="container" id ="mainDiv">
		<div class ="row">
			<div class ="span12">	
				<table id ="resultTable">
					<tr id ="headTr">
						<th>의사명</th><th>진료과</th><th>의사 번호</th>
					</tr>
					<tr style ="height:20px"></tr>
					<c:forEach items ="${docList}" var = "list">				
						<tr id ="contentTr" style="border-bottom:1px solid #d8d8d8">
							<td id ="nameTd">
								<a href ="/khhospital/control?cmd=${check}&doc_num=${list.doc_num}&now_month=${now_month}&now_year=${now_year}&where=main"><ul><li>${list.doc_name}</li></ul></a>	
							</td>
							<td>${list.dept_name}</td>
							<td>${list.doc_num}</td>
						</tr>
					
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

<jsp:include page ="/design/footer/main_footer.jsp"/>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>	
</body>
</html>