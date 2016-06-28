<!-- 
	 작성자 : 양진원
	 작성일자 : 2016-06-14
	 설명 : 환자 마이페이지/나의 예약정보 
	 수정자 : 박민수
	 수정일자 : 2016-06-16
	 설명 : 환자 마이페이지 자신의 모든 예약 정보 불러오기.
			jstl & el 사용.
	수정자 : 박민수
	수정일자 : 2016-06-17
	설명 : 예약취소 버튼 추가 / jQuery 사용

 -->




<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Regi.html</title>

<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>

<script>
	$(document).ready(
		function(){
			if($("#delCheck").attr("v") == "success"){
				alert("예약이 취소 되었습니다.");
			}
			
			var $form = $("#form");
			
			$("#btnDel").click(
				function(){
					if(confirm("정말 예약을 취소하시겠습니까?")){
						$form.submit();
					}
				}	
			);
			
		}	
	);
</script>

<style>
.table{width:750px}
th{background-color: #C4DEFF; width:150px}

#submenu>li>a {
	margin-top:20px;
	color: #347fd0;
	font-size: 17px;
	font-weight: bold;
}

#submenu> .active >a {
	margin-top:20px;
	color: #595959;
}

#resTable td {
	border-bottom: 1px solid #595959
}

#res_date{
	color :#0f5da8;
}
</style>
</head>
<body>
<span id="delCheck" v="${delCheck}"></span>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>

	
	<div class="container" style="margin-top:50px; margin-bottom:100px">
		<div class="row">
			<div class="span12">	
				
				<div class="tabbable tabs-left" >
					<div class="span2">
						<ul class="nav nav-tabs" id="submenu" style="margin-top:100px">
							<li><a href="/khhospital/control?cmd=REGIUPDATE">내정보수정</a></li>
							<li class="active"><a href="#">진료예약조회</a></li>
							<li><a href="/khhospital/control?cmd=REGIDELETE">회원 탈퇴</a></li>
						</ul>
					</div>
	
					<div class="span9">
						<div class="tab-content" style ="margin-top:20px">
							<div style="margin-left:200px; height:150px; width:500px; margin-top:50px">				
								<img src="/khhospital/design/images/my_res_banner.jpg"/>
							</div>
							<br/><br/><br/>
						
							<!-- jstl 반복문 사용시 jQuery 디자인 깨짐 발생하여 일일이 설정. -->
							<c:forEach items ="${resList}" var = "list">
								<div class ="container">
									<div class ="row">
										<div class ="span3"></div>
											<div class ="span4" style="border:2px solid #595959;text-align:center;background-color:#fff;" >
												<img src ="/khhospital/design/images/res_result.jpg" style="height:50px;width:150px"/>
												<p style ="color:#595959;font-size:15px;font-weight: bold;">${list.res_year}년${list.res_month}월</p>
												<table style="color:#595959;font-size:15px;font-weight: bold;margin-left:115px;margin-bottom:20px" id="resTable">
													<tr>
														<td>예약번호 :</td><td>${list.res_num}</td>
													</tr>
													<tr>
														<td>환자명 :</td><td>${list.pat_name}</td>
													</tr>
													<tr>
														<td>진료과 :</td><td>${list.dept_name}</td>
													</tr>
													<tr>
														<td>의사명 :</td><td> ${list.doc_name}</td>
													</tr>
													<tr>
														<td>예약일자 :</td><td><span id ="res_date">${list.res_date }일 ${list.res_type}</span></td>
													</tr>
			
												</table>
												<form method="post" action="/khhospital/control?cmd=RESERVEDEL" id="form">
													<input type="hidden" name="res_num" value="${list.res_num}"/>
													<img src="/khhospital/design/images/btn_reg_del.jpg" style="width:80px; height:40px; margin-bottom:20px"id ="btnDel"/>
													<img src="/khhospital/design/images/btn_print.jpg" style="width:80px; height:40px; margin-bottom:20px"/>
												</form>
											</div>				
									</div>
								</div>
								<br/>
							</c:forEach>			
						</div>
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