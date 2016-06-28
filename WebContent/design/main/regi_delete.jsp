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
</style>
<script>
	$(document).ready(
		function(){			
			$("#btnDel").click(
				function(){
					if($("#pass").attr("value") == $("#inputPass").val()){
						if(confirm("���� Ż���Ͻðڽ��ϱ�?")){
							$("#form1").submit();
						}						
					}
					else{
						alert("��й�ȣ�� �ٽ� �Է����ּ���!");
					}
				}		
			);
		}	
	);
</script>
</head>
<body>
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
					<ul class="nav nav-tabs" id="submenu" style="margin-top:100px">
						<li><a href="/khhospital/control?cmd=REGIUPDATE">����������</a></li>
						<li><a href="/khhospital/control?cmd=MYRESERVE">���Ό����ȸ</a></li>
						<li class="active"><a href="#">ȸ�� Ż��</a></li>
					</ul>
				
							<div class="tab-content">
									<div style="margin-top:80px; margin-bottom:100px; margin-left:150px">
										<img src="/khhospital/design/images/regi_delete.jpg" /><br/>
										<div class="input-append" style="margin-top:50px; margin-left:150px">
											<input type="hidden" id="pass" value="${sessionScope.pass}"/>							
											<form id="form1" method="post" action="/khhospital/control?cmd=REGIDELETEPROC">
												<input type="password" id="inputPass" class="input-large"/>
												<input type="button" id="btnDel" class="btn add-on" value=" Ż���ϱ� " style="height:30px"/>
											</form>
										</div>
								
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