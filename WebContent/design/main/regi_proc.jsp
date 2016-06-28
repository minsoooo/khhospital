<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:if test="${check eq 'false'}">
	<script>
			alert("가입형식에 맞지 않습니다!");
			history.go(-1);
	</script>
</c:if>
<c:if test="${check eq 'true'}">
	<script>
			alert("가입이 완료 되었습니다.");
			window.close();
	</script>
</c:if>
