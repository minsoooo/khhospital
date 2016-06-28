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
<title>글 읽기 내부</title>
<script>
	function fnUpdate(){
		document.update.submit();		
	}	
	function fnDelete(){
		document.del.submit();		
	}
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="span12">
			<jsp:include page="/design/header/doc_header.jsp"></jsp:include>
		</div>
	</div>
</div>
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
						<a href="javascript:fnUpdate()" class="btn">수정</a>&nbsp;&nbsp;
						<a href="/khhospital/control?cmd=DOCOPTIQBOARDMAIN" class="btn">목록</a>&nbsp;&nbsp;
						<a href="javascript:fnDelete()" class="btn">삭제</a>						
					</td></tr>

					<form class="form-search" method="post" action="/khhospital/control">				
						<input type="hidden" name="cmd" value="DOCOPTIQBOARDREPLYPROC" />
						<input type="hidden" name="num" value="${rdto.num}" />						
						<input type="hidden" name="replyip" value="<%=request.getRemoteAddr()%>" />
						
						<tr><td colspan="3" id="f_reply">
						<input type="text" name="replyid" placeholder="아이디" required="required"/>
						<input type="password" name="replypass" placeholder="비밀번호" required="required"/>
						<textarea rows="3" name="replycontent" placeholder="댓글내용" required="required"></textarea>	
						<input type="submit" value="댓글 작성" class="btn btn-large" />
						</td></tr>
					</form>
				</table>
						<jsp:include page="doc_opti_question_reply.jsp"></jsp:include>
			</div>
		
		</div>
	</div>
	
<form name="update" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="DOCOPTIQBOARDUPDATE"/>
	<input type="hidden" name="num" value="${rdto.num}"/>
	<input type="hidden" name="realpass" value="${rdto.pass}"/>
</form>

<form name="del" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="DOCOPTIQBOARDDELETE"/>
	<input type="hidden" name="num" value="${rdto.num}"/>
	<input type="hidden" name="realpass" value="${rdto.pass}"/>
</form>

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