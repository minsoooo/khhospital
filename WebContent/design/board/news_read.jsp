<%@page import="bean.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<style>
textarea{width:99%;resize:none;}
#f_writer{color:#7C96C9; text-align:right}
#f_title{text-align:center}
#f_date{text-align:center}
#f_count{text-align:left}
#f_button{text-align:right; border:0;}
#f_reply{border:0;}
</style>
<title>병원소식 글내부</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="span12">
			<jsp:include page="/design/header/main_header.jsp"></jsp:include>
		</div>
	</div>
</div>

	<!-- 전송받은 글을 출력한다 -->	
	<div class="container">
		<div class="row">		
			<div class="span1" style="margin-left: 40px"></div>
			<div class="span10" style="margin-bottom: 60px; margin-top: 40px;">
				<table class="table">
					<tr class="info"><td colspan="3" id="f_title">${rdto.title}</td></tr>				
					
					<tr>
						<td id="f_writer"><strong>${rdto.name}</strong></td>
						<td id="f_date">${rdto.regdate}</td>
						<td id="f_count">${rdto.count}</td>
					</tr>				
					
					<tr><td colspan="3" id="f_textarea">									
					<pre><textarea rows="20" cols="10" readonly="readonly">
						${rdto.content}				
					</textarea></pre>
					</td></tr>		
					<tr><td id="f_button" colspan="3">						
						<a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN" class="btn">목록</a>								
					</td></tr>					
				</table>				
			</div>
		
		</div>
	</div>
<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>

<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>