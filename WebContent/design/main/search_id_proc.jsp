<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:if test="${id == null}">
	<script>
			alert("���̵� �������� �ʽ��ϴ�!");
			window.close();
	</script>
</c:if>
<c:if test="${id != null}">
	<script>
		var id = "${id}";
		alert("���̵�� " + id + " �Դϴ�.");
		window.close();
	</script>
</c:if>