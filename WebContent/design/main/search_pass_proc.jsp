<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:if test="${pass == null}">
	<script>
		alert("�߸� �Է��ϼ̽��ϴ�.");
		window.close();
	</script>
</c:if>
<c:if test="${pass != null}">
	<script>
		var pass = "${pass}";
		alert("��й�ȣ�� " + pass +  " �Դϴ�.");
		window.close();
	</script>
</c:if>
