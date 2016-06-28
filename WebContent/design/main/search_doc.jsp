<!-- 
	작성자 : 박민수
	작성일 : 2016-06-17
	설명 : 검색 페이지/ jQuery를 이용한 attr설정


 -->



<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			var $form = $("#form")
			
			$("#btnSub").click(
				function(){
					$form.submit();
				}
			);
			$("select").click(
				function(){
					if($("select > option:checked").attr("value")=="날짜"){
						$("#searchText").attr("placeholder"," 예) 2016/06/1")
					}
				}		
			);

		}		
	
	);
	

</script>
</head>
<style>
	#aDiv a {font-size:18}
</style>
<body>

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
			<center style="margin-top:150px; margin-bottom: 150px">
				<form class="form-search" method ="post" action="/khhospital/control?cmd=SEARCHRESULT" id ="form">
					<input type ="hidden" name = "check" value ="${check }"/>
				      <select class="span2" name ="keyword" >
				               <option value="진료과">진료과</option>
				               <option value="의사명">의사명</option>
				               <option value ="날짜">날짜</option>
				      </select>
				      <input type="text" style="width:300px; height:21px" name ="search" placeholder="" id ="searchText"/>
				      <button type="button" class="btn" id ="btnSub">검색<span class="icon-search"></span></button><br/><br/><br/>   
				   </form>
				   <div style="font-size: 15px" id ="aDiv">
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=1&check=${check}">외과&nbsp;<span class="icon-hand-left"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=2&check=${check}" ><span class="icon-hand-right"></span>&nbsp;내과</a><br/><br/><br/>
				   
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=5&check=${check}" >안과&nbsp;<span class="icon-hand-left"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=3&check=${check}" ><span class="icon-hand-right"></span>&nbsp;치과</a><br/><br/><br/>
				   
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=6&check=${check}">신경과&nbsp;<span class="icon-hand-left"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="/khhospital/control?cmd=SEARCHDEPT&dept_no=4&check=${check}"><span class="icon-hand-right"></span>&nbsp;피부과</a><br/>
				   </div>
				</center>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>


	<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>