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
		alert("���̵� ã�� �� �����ϴ�!");
		history.back();
	</script>
</c:if>

<c:if test="${result eq 'NoPass'}">
	<script>
		alert("��й�ȣ�� Ȯ���� �ּ���!");
		history.back();
	</script>
</c:if>
		