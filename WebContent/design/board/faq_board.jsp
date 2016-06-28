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
			<div class="span12">
				<h1 style="margin-left: 450px; margin-top: 60px; margin-bottom: 20px">자주 묻는 질문</h1>
				<div class="span1" style="margin-left: 20px"></div>
				<div class="span10" style="margin-bottom: 60px">
					<table class="table table-hover" width=80%>				
						<tr class="info">
							<td width="10%">글번호</td>
							<td align="left" width="30%">제목</td>
							<td width="8%">작성자</td>
							<td width="14%">작성일자</td>
							<td width="8%">조회수</td>
						</tr>
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>			
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>	
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>	
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>	
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>
						<tr>
							<td width="10%" align="center">1</td>
							<td align="left" width="30%">안녕 이미지만 만든 html이야</td>
							<td width="8%">효열갓</td>
							<td width="14%">2016/05/17</td>
							<td width="8%" align="center">10</td>
						</tr>				
					</table>
				
					<div class="pagination pagination-large pagination-centered" >
						<ul>
							<li><a href="#"><<</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
						 	<li><a href="#">5</a></li>				 	
							<li><a href="#">>></a></li>
						</ul>
					</div>
					<div align="center">
						<form class="form-search">
							<select class="span1">
								<option>제목</option>
								<option>작성자</option>
								<option>내용</option>
								<option>제목+내용</option>
							</select>					
							<input type="text" size="15" />
							<button type="button" class="btn">검색
							<span class="icon-search"></span></button>				
						</form>
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