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
#f_button{text-align:center; border:0;}
#f_reply{border:0;}
</style>
<title>글 읽기 내부</title>
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
		<div class="span1" style="margin-left: 30px;"></div> 
			<div class="span10" style="margin-top: 20px; margin-bottom: 20px">
			<form method="post" class="form-search" action="/khhospital/control">
				<input type="hidden" name="cmd" value="MGRINTERNALNEWSBOARDUPDATEPROC" />
				<input type="hidden" name="num" value="${rdto.num}" />				
			<table>
				<tr>			
					<td>					
						<span>작성자명&nbsp;</span><input type="text" name="name" class="input1" value="${rdto.name}"/>
					</td>					
				</tr>
				<tr>			
					<td colspan="2"><span>제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<input type="text" name="title" value="${rdto.title}"/></td>
				
				</tr>	
			</table>
			<br/>
			<div>			
				<div>
					<textarea cols="20" rows="10" name="content">${rdto.content}</textarea>
				</div>
			</div>
			<div align="center">
				<input type="submit" value="수정하기" class="btn"/>&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn" />
			</div>
			</form>
		</div>	
	</div>	
</div>
<jsp:include page ="/design/footer/mgr_footer.jsp"/>	
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
