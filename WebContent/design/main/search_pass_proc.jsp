<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:if test="${pass == null}">
	<script>
		alert("잘못 입력하셨습니다.");
		window.close();
	</script>
</c:if>
<c:if test="${pass != null}">
	<script>
		var pass = "${pass}";
		alert("비밀번호는 " + pass +  " 입니다.");
		window.close();
	</script>
</c:if>
