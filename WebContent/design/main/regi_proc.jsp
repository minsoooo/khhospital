<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>  
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
			window.open("/khhospital/design/main/regi_question.jsp","","width=390,height=320,top=+200,left=+480");
	</script>
</c:if>

<c:if test="${check2 eq 'true'}">
	<script>
			alert("�߰����� �Է��� �Ϸ� �Ǿ����ϴ�.");
			window.close();
	</script>
</c:if>

