<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			if($("#doc_img").attr("value") == null){
				$("#docImg").attr("src","/khhospital/upload/default.jpg");
			}
			else{
				var src = "/khhospital/upload/" + $("#doc_img").attr("value");
				$("#docImg").attr("src", src);
			}
		}		
	);
</script>
<style>
#docImg{
	margin-top: 20px;
	margin-left: 100px;
	margin-bottom: 30px;
	border: 5px solid #c1c1c1;
}
#docName{
	color: #4197e0;
	font-weight: bold;
	font-size: 30px;
	margin-left: 150px;
}

#docTable{
	margin-top: 20px;
	width: 200px;
	margin-left: 100px;
}

#docTable td{
	border-bottom: 1px solid #d8d8d8;
	font-size: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	text-align: center;
}
</style>
</head>
<body>
<input type="hidden" value="${docDto.doc_img}" id="doc_img"/>
	<img src ="" id ="docImg"/><br/>
	<font id="docName">${docDto.doc_name}</font> 교수
	<table id="docTable">
		<tr>
			<td>진료과</td><td>${docDto.dept_name}</td>
		</tr>
		<tr>
			<td>진료분야</td><td>${docDto.doc_part}</td>
		</tr>
	</table>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>