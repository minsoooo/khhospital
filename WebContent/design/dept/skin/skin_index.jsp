<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
</head>
<style>

#carousel{
	margin-top:60px;
	margin-bottom:30px;
}

#index{
	width:970px;
	height: 500px;
}


#table{
	width:800px;
	height: 160px;
	border:3px solid #d8d8d8;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/dept_skin_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="span1"></div>
				<div class="span10" id="carousel">
					<div id="ad" class="carousel slide" >
						<ol class="carousel-indicators">
							<li data-target="#index" data-slide-to="0" class="active"></li>
							<li data-target="#index" data-slide-to="1"></li>
						</ol>
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="active item">
								<img src="/khhospital/design/images/dept_index.jpg" id="index"/>
							</div>
							<div class="item">
								<img src="/khhospital/design/images/sample.jpg"  id ="index" />
							</div>
						</div>
						<!-- Carousel nav -->
						<a class="carousel-control left" href="#index" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#index" data-slide="next">&rsaquo;</a>
					</div>
				</div>
				
				<div style="margin-left:25px; margin-bottom:60px">
					<img src="/khhospital/design/images/skin_icon.jpg"/>
					<img src="/khhospital/design/images/dept_index2.jpg" id="table"/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12">				
				<jsp:include page="/design/footer/dept_footer.jsp"></jsp:include>				
			</div>
		</div>
	</div>			
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>