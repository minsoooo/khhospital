<!-- 
	 작성자 : 박민수
	 작성일 : 2016-06-20
	 설명 : 현재 상담중인 환자의 의사본인과의 상담기록을 모두 불러와 jstl로 출력해주는 페이지

 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>pat_history</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			//디자인
			$("#hisTable").css("border","2px solid #595959").css("text-align","center")
			.css("margin-left","16px").css("margin-top","10px").css("color","#595959")
			.css("font-weight","bold").css("background-color","#fff")
			$("#hisTable td").css("border-bottom","1px solid #595959")
			
			$("body").css("background-color","#d8d8d8")
		}		
	);
	

</script>
</head>
<body>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
				<table id ="hisTable">
					<tr id = "titleTr">
						<td>환자명</td><td>진료날짜</td><td>상담내용</td>
					</tr>
					<c:forEach items ="${hisList}" var = "list">
						<tr style="border-bottom:1px solid #d8d8d8">
							<td>${list.pat_name}</td><td>${list.his_date}</td><td><textarea>${list.pat_history}</textarea></td>
						</tr>
					</c:forEach>
				
				</table>
			
			</div>
		</div>
	</div>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>