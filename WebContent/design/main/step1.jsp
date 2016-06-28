<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>

<style>
	#step1, #step2, #step3{
		width: 300px;
		height: 140px;
		margin-right: 30px;
	}
	
</style>

<script>
	var check = "";
	
	function fnNext(dept_no){
		if(check == "true"){
			location.href = "/khhospital/control?cmd=STEP2&dept_no="+dept_no;
		}
		else{
			alert("로그인 후 이용이 가능합니다.");
		}
	}
</script>
</head>
<body>

<%
	if(session.getAttribute("user") != null){
%>
		<script>
			check = "true";
		</script>
<%		
	}
	else{
%>		
		<script>
			check = "false";
		</script>
<% 		
	}
%>

	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12" style="margin-left:90px; margin-top:50px">
				<img src="/khhospital/design/images/step1_2.jpg" id="step1"/>
				<img src="/khhospital/design/images/step2_1.jpg" id="step2"/>
				<img src="/khhospital/design/images/step3_1.jpg" id="step3"/>
				<br/>
				
				<div style="margin-top:70px; margin-bottom:100px; background-color:#f7f7f9; width:965px; height:200px">	
					<div class="span4" style="height:180px; margin-top:30px; margin-left:60px">
						<div style="text-align: center;">
							<font style="font-size:17px; color:#595959;"> * 자가진단을 하시면 더 정확하고 <br/><br/>
							&nbsp;&nbsp;빠른 상담을 받으실 수 있습니다.</font><br/><br/>
						</div>
						<a href="/khhospital/control?cmd=CHECKLISTSTART"> 
							<img src="/khhospital/design/images/btn_checklist.jpg" />
						</a>
					</div>
					
					<div class="span1" style="border-right:1px solid #cecece; height:150px; width:55px; margin-top:20px;"></div>
					
					<div  class="span4" style="height:180px; margin-left:80px; margin-top:20px;">
						<font style="font-size:20px; color:#595959;font-weight:bold; margin-left:10px">>> 다음 단계로 이동</font><br/><br/>
						<a href="javascript:fnNext(1)"><img src="/khhospital/design/images/btn_surg.jpg" /></a> 
						<a href="javascript:fnNext(2)"><img src="/khhospital/design/images/btn_inter.jpg" /></a> 
						<a href="javascript:fnNext(3)"><img src="/khhospital/design/images/btn_dent.jpg" /></a><br/><br/>
						<a href="javascript:fnNext(4)"><img src="/khhospital/design/images/btn_skin.jpg" /></a> 
						<a href="javascript:fnNext(5)"><img src="/khhospital/design/images/btn_opti.jpg" /> </a> 
						<a href="javascript:fnNext(6)"><img src="/khhospital/design/images/btn_psy.jpg" /> </a> 
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>