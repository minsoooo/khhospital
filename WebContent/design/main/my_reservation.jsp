<!-- 
	 �ۼ��� : ������
	 �ۼ����� : 2016-06-14
	 ���� : ȯ�� ����������/���� �������� 
	 ������ : �ڹμ�
	 �������� : 2016-06-16
	 ���� : ȯ�� ���������� �ڽ��� ��� ���� ���� �ҷ�����.
			jstl & el ���.
	������ : �ڹμ�
	�������� : 2016-06-17
	���� : ������� ��ư �߰� / jQuery ���

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
				alert("������ ��� �Ǿ����ϴ�.");
			}
			
			var $form = $("#form");
			
			$("#btnDel").click(
				function(){
					if(confirm("���� ������ ����Ͻðڽ��ϱ�?")){
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
							<li><a href="/khhospital/control?cmd=REGIUPDATE">����������</a></li>
							<li class="active"><a href="#">���Ό����ȸ</a></li>
							<li><a href="/khhospital/control?cmd=REGIDELETE">ȸ�� Ż��</a></li>
						</ul>
					</div>
	
					<div class="span9">
						<div class="tab-content" style ="margin-top:20px">
							<div style="margin-left:200px; height:150px; width:500px; margin-top:50px">				
								<img src="/khhospital/design/images/my_res_banner.jpg"/>
							</div>
							<br/><br/><br/>
						
							<!-- jstl �ݺ��� ���� jQuery ������ ���� �߻��Ͽ� ������ ����. -->
							<c:forEach items ="${resList}" var = "list">
								<div class ="container">
									<div class ="row">
										<div class ="span3"></div>
											<div class ="span4" style="border:2px solid #595959;text-align:center;background-color:#fff;" >
												<img src ="/khhospital/design/images/res_result.jpg" style="height:50px;width:150px"/>
												<p style ="color:#595959;font-size:15px;font-weight: bold;">${list.res_year}��${list.res_month}��</p>
												<table style="color:#595959;font-size:15px;font-weight: bold;margin-left:115px;margin-bottom:20px" id="resTable">
													<tr>
														<td>�����ȣ :</td><td>${list.res_num}</td>
													</tr>
													<tr>
														<td>ȯ�ڸ� :</td><td>${list.pat_name}</td>
													</tr>
													<tr>
														<td>����� :</td><td>${list.dept_name}</td>
													</tr>
													<tr>
														<td>�ǻ�� :</td><td> ${list.doc_name}</td>
													</tr>
													<tr>
														<td>�������� :</td><td><span id ="res_date">${list.res_date }�� ${list.res_type}</span></td>
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