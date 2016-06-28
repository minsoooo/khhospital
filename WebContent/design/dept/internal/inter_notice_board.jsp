<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<fmt:requestEncoding value="euc-kr" />
<script>
	function fnRead(num){
			document.read.num.value = num;
			document.read.submit();
	}
</script>	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ܰ� ��������</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
</head>
<body>
<c:set var="totalRecord" value="${pdto.totalRecord}"></c:set>
<c:set var="numPerPage" value="${pdto.numPerPage}"></c:set>
<c:set var="pagePerBlock" value="${pdto.pagePerBlock}"></c:set>
<c:set var="totalPage" value="${pdto.totalPage}"></c:set>
<c:set var="totalBlock" value="${pdto.totalBlock}"></c:set>
<c:set var="nowPage" value="${pdto.nowPage}"></c:set>
<c:set var="nowBlock" value="${pdto.nowBlock}"></c:set>
<c:set var="beginPerPage" value="${pdto.beginPerPage}"></c:set>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/dept_inter_header.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="span12">
				<h1 style="margin-left: 450px; margin-top: 60px; margin-bottom: 20px">���� ��������</h1>
				<div class="span1"></div>
				<div class="span10" style="margin-bottom: 60px">
					<table class="table table-hover" width=80%>				
						<tr class="info">
							<td width="10%">�۹�ȣ</td>
							<td align="left" width="30%">����</td>
							<td width="8%">�ۼ���</td>
							<td width="14%">�ۼ�����</td>
							<td width="8%">��ȸ��</td>
						</tr>
						<c:if test="${totalRecord == 0}">
							<tr>
								<td colspan="5" style="text-align:center">�����Ͱ� �����ϴ�.</td>
							</tr>
						</c:if>
						<c:forEach items="${vdto}" begin="${beginPerPage}" end="${(beginPerPage+numPerPage)-1}" var="list">
							<tr>
								<td width="10%" align="center">${list.num}</td>
								<td align="left" width="30%"><a href="javascript:fnRead('${list.num}')">${list.title}</a></td>
								<td width="8%">${list.name}</td>
								<td width="14%">${list.regdate}</td>
								<td width="8%" align="center">${list.count}</td>
							</tr>
						</c:forEach>				
					</table>
					<div class="pagination pagination-large pagination-centered" >
						<ul>
							<li><c:if test="${nowBlock > 0}">
								<a href="/khhospital/control?cmd=INTERNBOARDMAIN&nowPage=${pagePerBlock*(nowBlock-1)}&nowBlock=${nowBlock-1}"><<</a>
								</c:if>
							</li>
								<c:forEach begin="1" end="${pagePerBlock}" step="1" var="i">
								<c:if test="${(nowBlock * pagePerBlock) +i-1 < totalPage}">
									<li><a href="/khhospital/control?cmd=INTERNBOARDMAIN&nowPage=${(nowBlock*pagePerBlock)+i-1}&nowBlock=${nowBlock}">${(nowBlock * pagePerBlock)+i}</a></li>
								</c:if>
								</c:forEach>
							<li>
								<c:if test="${totalBlock > nowBlock+1}">
									<a href="/khhospital/control?cmd=INTERNBOARDMAIN&nowPage=${pagePerBlock*(nowBlock+1)}&nowBlock=${nowBlock+1}">>></a>
								</c:if>
							</li>					
						</ul>
					</div>
					<div align="center">
						<form class="form-search" method="post" action="/khhospital/control" name="search">		
							<input type="hidden" name="cmd" value="INTERNBOARDMAIN"/>
							<input type="hidden" name="num" />
							<select class="span1" name="keyField" id="keyField" >
								<option value="nb_title_inter" >����</option>
								<option value="nb_name_inter" >�ۼ���</option>
								<option value="nb_content_inter" >����</option>
								<option value="nb_titlecontent_inter" >����+����</option>
							</select>
							<input type="text" size="15" name="keyWord" value="${keyWord}" />
							<input type="submit" class="btn" value="�˻�" />					
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<form name="read" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="INTERNBOARDREAD"/>
	<input type="hidden" name="num"/>
	<input type="hidden" name="isRead" value="true"/>
</form>

<div class="container">
		<div class="row">
			<div class="span12">				
				<jsp:include page="/design/footer/dept_footer.jsp"></jsp:include>				
			</div>
		</div>
	</div>					
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>