<%@page import="bean.ReplyDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>댓글출력</title>
<style>
div{margin-left:20px}
</style>
</head>
<body>

<!-- DB에서 보낸 벡터에 있는 댓글목록을 받아서 출력하는 부분 -->

<div class="container">
	<div class="row">
		<div class="span8">
			<c:forEach items="${revec}" var="replylist">
				<form class="form-search" method="post" action="/khhospital/control">
				<input type="hidden" name="cmd" value="ADBOARDREPLYDEL" />				
				<input type="hidden" name="num" value="${replylist.num}" />
				<input type="hidden" name="replynum" value="${replylist.replynum}" />
				<input type="hidden" name="replypass" value="${replylist.replypass}" />
				<div><span class="icon-user"></span>
				${replylist.replyid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
				<input type="password" name="userpass" placeholder="비밀번호" required="required"/>
				<input type="submit" value="삭제" class="btn" />				
				${replylist.replydate}<br/>
				</div>
				<div><pre>${replylist.replycontent}</pre></div>
				</form>
			</c:forEach>
		</div>	 
	</div>
</div>
</body>
</html>