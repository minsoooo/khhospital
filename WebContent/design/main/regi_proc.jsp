<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:if test="${check eq 'false'}">
	<script>
			alert("�������Ŀ� ���� �ʽ��ϴ�!");
			history.go(-1);
	</script>
</c:if>
<c:if test="${check eq 'true'}">
	<script>
			alert("������ �Ϸ� �Ǿ����ϴ�.");
			window.close();
	</script>
</c:if>
