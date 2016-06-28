<!-- 
	작성자 :박민수
	작성일 :2016-06-20	
	설명 : 의사예약 완료후 대기 페이지 작성
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
			// 디자인 설정.
			$("#text").css("color","#595959").css("margin-left","150px").css("margin-top","20px")
			$("#img_result").css("margin-top","50px").css("margin-left","250px")
		}		
	);
</script>
</head>
<body>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
				 <div>
				 	<img src ="/khhospital/design/images/res_result.jpg" id ="img_result"/>
				 </div>
				 <div>
				 	<h1 id ="text">예약이 완료 되었습니다.</h1>
				 </div>		
			</div>		
		</div>
	</div>

</body>
</html>