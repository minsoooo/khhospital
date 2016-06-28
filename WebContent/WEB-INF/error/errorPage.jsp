<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>You encountered error</title>
</head>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script>
	setInterval(
			function(){
				location.href ="/khhospital/design/main/index.jsp";
			}
			,1000*10)
</script>
<style>
	#bodyDiv{
		text-align: center
	}
	span{
		color :skyblue
	}
</style>
<body>
	<div class ="container">
		<div class ="row">
			<div class ="span12" id ="bodyDiv">
				<img src ="/khhospital/design/images/errorPage.jpg" style ="width:400px;height:400px"/>			
				<h4>Sorry, you encountered some PROBLEMS</h4>
				<h4>You're Transferring our main page in 10 seconds.</h4>
				<h4>If this kind of problem will occur repeatedly ,</h4>
				<h4>Please call our service-center:<span>1577-0012</span>, or email our service-manager : <span>service@khhospital.com</span></h4>
			</div>
		</div>
	</div>
</body>
</html>