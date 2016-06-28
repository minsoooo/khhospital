<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

	#btn{
		margin-left:350px;
		margin-top:10px;
	}
	
	#font{
		color:#595959;
		font-size:25px;
	}
	
	#result{
		margin-left:250px;
		margin-top:300px;
	}
	
</style>
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			$("#btn_index").click(
				function(){
					window.close();
					opener.parent.location.href = "/khhospital/control?cmd=INDEX";
				}	
			);
			
			$("#btn_step2").click(
					function(){
						form1.submit();						
					}	
				);
		}		
	);
</script>
</head>
<body>

<form method="post" action="/khhospital/control?cmd=CHECKLISTINSERT" name="form1"> 
	<input type="hidden" name="check1" value="${param.check1}" />
	<input type="hidden" name="check2" value="${param.check2}" />
	<input type="hidden" name="check3" value="${param.check3}" />
	<input type="hidden" name="check4" value="${param.check4}" />
	<input type="hidden" name="check5" value="${param.check5}" />
	<input type="hidden" name="check6" value="${param.check6}" />
	<input type="hidden" name="check7" value="${param.check7}" />
	<input type="hidden" name="check8" value="${param.check8}" />
	<input type="hidden" name="check9" value="${param.check9}" />
	<input type="hidden" name="check10" value="${param.check10}" />
	<input type="hidden" name="check11" value="${param.check11}" />
	<input type="hidden" name="check12" value="${param.check12}" />
	<input type="hidden" name="check13" value="${param.check13}" />
	<input type="hidden" name="check14" value="${param.check14}" />
	<input type="hidden" name="check15" value="${param.check15}" />
	<input type="hidden" name="check16" value="${param.check16}" />
	<input type="hidden" name="check17" value="${param.check17}" />
	<input type="hidden" name="check18" value="${param.check18}" />
	<input type="hidden" name="check19" value="${param.check19}" />
	<input type="hidden" name="check20" value="${param.check20}" />
	
	<div id="result">
		<img src="/khhospital/design/images/check_icon.jpg"/>
		<font id="font">당신의 건강점수는 <font style="font-weight:bold; font-size:50px">${param.result}점</font>입니다.</font>
	</div>
	<br/><br/>
	
	<div id="btn">
		<img src="/khhospital/design/images/btn_step2.jpg" id="btn_step2"/><br/><br/>
		<img src="/khhospital/design/images/btn_index.jpg" id="btn_index"/>
	</div>
</form>

 
</body>
</html>