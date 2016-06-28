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
<c:set var="keyWord" value="${keyWord}" />
<div class="container">
	<div class="row">
		<div class="span12">
			<jsp:include page="/design/header/dept_surg_header.jsp"></jsp:include>
		</div>
	</div>
</div>
	<div class="container">
		<div class="row">		
			<div class="span1" style="margin-left: 40px"></div>
			<div class="span10" style="margin-bottom: 60px; margin-top: 40px;">
				<table class="table">
				
					<!-- 글번호를 받아서 출력하는부분 -->
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
					
					<!-- 일반 화면으로 돌아갈때 Command에서 받아둔 키워드,키필드를 다시 다시고 간다. -->
												
					<tr><td id="f_button" colspan="3">
						<a href="javascript:fnUpdate()" class="btn">수정</a>&nbsp;&nbsp;
						<a href="/khhospital/control?cmd=SURGQBOARDMAIN&keyWord=${keyWord}&keyField=${keyField}" class="btn">목록</a>&nbsp;&nbsp;
						<a href="javascript:fnDelete()" class="btn">삭제</a>						
					</td></tr>
					
					<!-- 글읽기 내부에 있는 댓글을 달수있는 부분  -->

					<form class="form-search" method="post" action="/khhospital/control">				
						<input type="hidden" name="cmd" value="SURGQBOARDREPLYPROC" />
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
						<jsp:include page="surg_question_reply.jsp"></jsp:include>
			</div>
		
		</div>
	</div>
	
<!-- 글수정과 삭제를 위해 글 번호와 급 입력시 작성한 비밀번호를 받아서 전달한다. -->	
	
<form name="update" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="SURGQBOARDUPDATE"/>
	<input type="hidden" name="num" value="${rdto.num}"/>
	<input type="hidden" name="realpass" value="${rdto.pass}"/>
</form>

<form name="del" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="SURGQBOARDDELETE"/>
	<input type="hidden" name="num" value="${rdto.num}"/>
	<input type="hidden" name="realpass" value="${rdto.pass}"/>
</form>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>