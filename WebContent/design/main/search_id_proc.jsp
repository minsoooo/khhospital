<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:if test="${id == null}">
	<script>
			alert("아이디가 존재하지 않습니다!");
			window.close();
	</script>
</c:if>
<c:if test="${id != null}">
	<script>
		var id = "${id}";
		alert("아이디는 " + id + " 입니다.");
		window.close();
	</script>
</c:if>