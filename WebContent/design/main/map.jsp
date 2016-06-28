<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>찾아오시는 길</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		<div>
			
			<!-- 상단의 병원오시는길 이미지 -->		
			<img src="/khhospital/design/images/map.jpg" style="margin-top:80px; margin-left:20px"/>
			
			<!-- 다음지도 API -->
			<div style="margin-left:220px; margin-top:100px; margin-bottom:80px;">
				<div id="daumRoughmapContainer1466066658445" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
				<script charset="UTF-8">
					new daum.roughmap.Lander({
					"timestamp" : "1466066658445",
					"key" : "bdws",
					"mapWidth" : "700",
					"mapHeight" : "400"
					}).render();
				</script>
			</div>	
			
			<!-- 버스노선 및 주차방법 이미지 -->			
			<img src="/khhospital/design/images/map2.jpg" style="margin-bottom:50px; margin-left:80px"/>			
		</div>
	</div>
</div>
<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
</body>
</html>