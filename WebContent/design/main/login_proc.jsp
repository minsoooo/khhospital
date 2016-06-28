<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq 'Success'}">
	<c:choose>
		<c:when test="${check eq 'dept'}">
			<script>		
			 		window.close();
		 			opener.parent.location.reload(); 			
			</script>
		</c:when>	
		<c:otherwise>
			<script>		
			 		window.close();
		 			opener.parent.location.href = "/khhospital/control?cmd=INDEX"; 			
			</script>
		</c:otherwise>
	</c:choose>
</c:if>

<c:if test="${result eq 'NoId'}">
	<script>
		alert("아이디를 찾을 수 없습니다!");
		history.back();
	</script>
</c:if>

<c:if test="${result eq 'NoPass'}">
	<script>
		alert("비밀번호를 확인해 주세요!");
		history.back();
	</script>
</c:if>
		