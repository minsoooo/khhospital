<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
#carouselimg{width:970px; height:600px}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
		<!-- carousel -->
			<div class="container" style="margin-top:30px; margin-bottom:30px">
				<div class="row">
					<div class="span1" style="margin-left: 30px"></div>
					<div class="span10">
						<div class="carousel slide" id="main_carousel">
							<ol class="carousel-indicators">
								<li data-target="#main_carousel" data-slide-to="0" class="active"></li>
								<li data-target="#main_carousel" data-slide-to="1"></li>
								<li data-target="#main_carousel" data-slide-to="2"></li>
								<li data-target="#main_carousel" data-slide-to="3"></li>
								<li data-target="#main_carousel" data-slide-to="4"></li>
								<li data-target="#main_carousel" data-slide-to="5"></li>
								<li data-target="#main_carousel" data-slide-to="6"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img src="/khhospital/design/images/hall.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>1층 로비</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/info.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>접수 및 대기실</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/ctroom.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>CT 검사실</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/xrayroom.jpg"
										id="carouselimg" />
									<div class="carousel-caption">
										<p>X-ray 검사실</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/viproom.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>Vip 1인실</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/foyer.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>휴식 공간</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/culture.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>환자 및 가족을 위한 공연</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/food.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>식사 공간</p>
									</div>
								</div>
		
								<div class="item">
									<img src="/khhospital/design/images/cash.jpg" id="carouselimg" />
									<div class="carousel-caption">
										<p>수납 창구</p>
									</div>
								</div>
								<a href="#main_carousel" class="carousel-control left"
									data-slide="prev">&lsaquo;</a> <a href="#main_carousel"
									class="carousel-control right" data-slide="next">&rsaquo;</a>
		
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