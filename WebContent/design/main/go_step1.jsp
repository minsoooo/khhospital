<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
</head>
<body>
<script>
	$(document).ready(
		function(){
			window.close();
			opener.parent.location.href = "/khhospital/control?cmd=STEP1";
		}	
	);
</script>
</body>
</html>