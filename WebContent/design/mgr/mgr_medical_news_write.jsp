<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 글쓰기</title>

<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<style>
	textarea{width:99%; height:50%; resize:none;}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page ="/design/header/mgr_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12" style="margin-top: 60px; margin-bottom: 20px; margin-left: 100px">
				<div class="span1"></div>
					<div class="span8">
						<form class="form-search" method="post" action="/khhospital/control">
							<input type="hidden" name="cmd" value="MGRMEDICALNEWSBOARDWRITEPROC" />
							<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" />
						<table style="margin-left:60px">			
							<tr>			
								<td>					
									<span>작성자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="name" class="input1" />
								</td>												
							</tr>
							<tr>			
								<td colspan="2">
								<br/>
									<span>제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="title" style="width:540px"/></span>
								</td>
							</tr>								
						</table>
						<br/>		
						<div>
							<textarea cols="20" rows="15" name="content"></textarea>
						</div>
					
						<div style="margin-left:285px; margin-top:50px; margin-bottom:50px">
							<input type="submit" value="작성완료" class="btn"/>&nbsp;&nbsp;
							<input type="reset" value="다시쓰기" class="btn" />
						</div>
					</form>
				</div>
			</div>	
		</div>	
	</div>
<jsp:include page ="/design/footer/mgr_footer.jsp"/>	
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>