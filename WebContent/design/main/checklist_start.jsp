<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<style>
	#image {
		margin-left:350px;
		margin-top: 150px;
		margin-bottom: 150px;	
		border: 4px solid #c1c1c1;
	}
	
	#image:hover {
		border: 4px solid #2a71bc;
	}
</style>

<script>

			
	function fnChecklist(){
		if($("#user").attr("value") == 'patient'){				
				window.open("/khhospital/control?cmd=CHECKLIST", "", "width=1100, height=950, top=+10, left=+400");													
		}
		else if($("#user").attr("value") == ""){
			alert("로그인 후 이용해주세요!");		
		}
		else{
			alert("의료진이나 관리자는 이용하실 수 없습니다.");		
		}
	}


</script>

<body>
<input type="hidden" id="user" value="${sessionScope.user}"/>
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
				<a href="javascript:fnChecklist()"><img src="/khhospital/design/images/start_checklist.jpg" id="image"/></a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>


<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>