<!-- 
	작성자 : 박민수
	작성일 : 2016-06-20
	설명 : 의사 채팅시 진료 내용 작성후 DB 저장 하는 textarea 공간


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
			//디자인 설정 
			$("#ta").css("border","2px solid #595959").css("height","120px")
			.css("width","300px").css("margin-left","30px").css("margin-top","20px");
			$("#saveCheck").css("margin-left","160px")
			$("body").css("background-color","#d8d8d8")
			//button클릭시 저장 확인 절차
			var $form = $("#form");
			$("#saveCheck").click(
				function(){
					if(confirm("저장하시겠습니까")){
							$form.submit();
					}
				}		
			);
			
			// 저장 완료 확인
			
			if($("#check").attr("value")=="success"){
				alert("저장이 완료 되었습니다.")
			}
		}
	);	

</script>
</head>
<body>
<span id ="check" value ="${check}"></span>
<form method ="post" action="/khhospital/control?cmd=REGMEMO" id = "form">	
	<input type ="hidden" name ="pat_num" value ="${pat_num}"/>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
				<!-- 텍스트 써질 공간 설정 -->
				<div class ="span4">
					<textarea id ="ta" name ="memo"></textarea>
				</div>
			</div>
		</div>
	</div>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
					<input type="button" id="saveCheck" value="저장" style="width:50px;height:30px"/>
			</div>
		</div>
	</div>
</form>	
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>