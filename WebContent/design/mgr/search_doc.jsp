<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>searchDoc.jsp</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
		function(){
			$("#search").css("margin-left","400px")
		}		
	
	);

</script>

</head>
<body>
<div class = "container">
	<div class = "row"> 
		<div class ="span12">
			<jsp:include page ="/design/header/mgr_header.jsp"></jsp:include>
		</div>
	</div>
</div>
<div class = "container">
	<div class = "row"> 
		<div class ="span12">
			<form method ="post" action="/khhospital/control?cmd=SEARCHRESULT" class="form-search">
				<input type ="hidden" name ="check" value ="${param.check }"/>
				<div class ="container" style="margin-top:80px" id ="search">
					<div class ="row">
						<div class ="span8">
							<select style ="width:100px" name ="keyword">
								<option>�̸�</option>
								<option>�����</option>
							</select>
							&nbsp;<input type ="text" name ="search"/>
							&nbsp;<input type ="submit" value ="�˻�"/>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
	
<div class ="container">
	<div class ="row">
		<div class ="span12">
			<jsp:include page ="/design/footer/mgr_footer.jsp"/>
		</div>
	</div>
</div>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>	
</body>
</html>