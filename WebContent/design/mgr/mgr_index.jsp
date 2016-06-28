<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
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

</style>
<body>
<div class = "container">
	<div class = "row">
		<div class ="span12">
			<jsp:include page ="/design/header/mgr_header.jsp"></jsp:include>
		</div>
	</div>
</div>
	<div class ="container">
		<div class ="row">
			<div class ="span12">
				<div class="span1"></div>
				<div class="span10" id="carousel">
					<div id="index" class="carousel slide" >
						<ol class="carousel-indicators">
							<li data-target="#index" data-slide-to="0" class="active"></li>
							<li data-target="#index" data-slide-to="1"></li>
						</ol>
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="active item">
								<img src="/khhospital/design/images/doc_index.jpg" id="index"/>
							</div>
							<div class="item">
								<img src="/khhospital/design/images/dept_index.jpg" id="index"/>
							</div>
						</div>
						<!-- Carousel nav -->
						<a class="carousel-control left" href="#index" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#index" data-slide="next">&rsaquo;</a>
					</div>
				</div>
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