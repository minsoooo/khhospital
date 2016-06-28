<%@page import="bean.DocDto"%>
<%@page import="java.util.ArrayList"%>
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
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>

<style>
	#step1, #step2, #step3{
		width: 300px;
		height: 140px;
		margin-right: 30px;
	}
	
	#docTable{
		width: 800px;	
		text-align: center;
		color: #595959;
		margin-left: 80px;
		font-size:20px;
	}
	
	#online{
		width:80px;
		height:40px;
	}
	
</style>



</head>
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
			<div class="span12" style="margin-left:90px; margin-top:50px">
				<img src="/khhospital/design/images/step1_1.jpg" id="step1"/>
				<img src="/khhospital/design/images/step2_2.jpg" id="step2"/>
				<img src="/khhospital/design/images/step3_1.jpg" id="step3"/>
				<br/>
				
				<div style="margin-top:100px; margin-bottom:150px; width:965px;">	
					<table id="docTable">
						<tr style="font-size: 23px; font-weight:bold; height:80px; border-bottom: 1px solid #d8d8d8">
							<td></td><td>의사번호</td><td>진료과</td><td>진료분야</td><td>의사명</td><td></td>
						</tr>

						<c:forEach items="${searchDoctors}" var="s">
							<tr style="height:80px">
								<td><img src="/khhospital/design/images/online.png" id="online"/></td>
								<td>${s.doc_num}</td>
								<td>${s.dept_name}</td>
								<td>${s.doc_part}</td>
								<td>${s.doc_name}</td>
								<td>								
									<c:choose>
										<c:when test="${sessionScope.user eq 'patient'}">
											<form method="post" action="/khhospital/control?cmd=STEP3">
												<input type="hidden" name="doc_num" value="${s.doc_num}" />
												<input type="hidden" name="dept_name" value="${s.dept_name}" />
												<input type="hidden" name="doc_part" value="${s.doc_part}" />
												<input type="hidden" name="doc_name" value="${s.doc_name}" />
												<input type="submit" value="상담하기" class="btn" style="margin-top:10px"/>
											</form>
										</c:when>
										<c:otherwise>
											<input type="button" value="상담하기" class="btn" onclick="fnNext()"/>
											<script>
												function fnNext(){
													alert("의료진이나 관리자는 이용할 수 없습니다.");			
												}
											</script>
										</c:otherwise>
									</c:choose>								
								</td>
							</tr>
						</c:forEach>		

					</table>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>