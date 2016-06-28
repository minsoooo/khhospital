<!-- 
	�ۼ��� : �ڹμ�
	�ۼ����� : 2016-06-16
	���� : ������ Ȯ�� ������.
 -->



<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<style>
	#resTable td{
		border-bottom: 1px solid #595959;
		text-align: center;
	}

</style>
</head>
<body>

<div class = "container">
	<div class = "row">
		<div class ="span12">
			<jsp:include page ="/design/header/main_header.jsp"></jsp:include>
		</div>
	</div>
</div>
<!-- DB���� ó���� �� request��ü�� ��Ƽ� EL�� ����ϱ� -->
<div class ="container">
	<div class ="row">
		<div class ="span12">	
			<div style="margin-left:300px; height:150; width:500px; margin-top:50px">
				<img src="/khhospital/design/images/res_result_banner.jpg" />
			</div>
			<br/><br/>
				<div class ="span4"></div>
					<div class ="span4" style="border:2px solid #595959;text-align:center;background-color:#fff;" >
						<img src ="/khhospital/design/images/res_result.jpg" style="height:50px;width:150px"/>
						<p style ="color:#595959;font-size:15px;font-weight: bold;">${reserve.res_year}��${reserve.res_month}��</p>
						<table style="color:#595959;font-size:15px;font-weight: bold;margin-left:115px;margin-bottom:20px" id="resTable">
							<tr>
								<td>�����ȣ :</td><td>${reserve.res_num}</td>
							</tr>
							<tr>
								<td>ȯ�ڸ� :</td><td>${reserve.pat_name}</td>
							</tr>
							<tr>
								<td>����� :</td><td>${reserve.dept_name}</td>
							</tr>
							<tr>
								<td>�ǻ�� :</td><td> ${reserve.doc_name}</td>
							</tr>
								<tr>
							<td>�������� :</td><td><span id ="res_date">${reserve.res_date }�� ${reserve.res_type}</span></td>
							</tr>									
						</table>
					</div>				
				<div class ="span4"></div>
			</div>
		</div>
	</div>
	<br/><br/><br/>


<jsp:include page ="/design/footer/main_footer.jsp"/>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>	
	
</body>
</html>