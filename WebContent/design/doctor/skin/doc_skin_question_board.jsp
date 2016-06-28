<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<fmt:requestEncoding value="euc-kr" />
<script>
	function fnRead(num){
			document.read.num.value = num;
			document.read.submit();
	}
</script>	
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
				<jsp:include page="/design/header/doc_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12">
				<h1 style="margin-left: 450px; margin-top: 60px; margin-bottom: 20px">온라인 질문</h1>
				<div class="span1"></div>
				<div class="span10" style="margin-bottom: 60px">
					<table class="table table-hover" width=80%>				
						<tr class="info">
							<td width="10%">글번호</td>
							<td align="left" width="30%">제목</td>
							<td width="8%">작성자</td>
							<td width="14%">작성일자</td>
							<td width="8%">조회수</td>
						</tr>
						<c:if test="${totalRecord == 0}">
							<tr>
								<td colspan="5" style="text-align:center">데이터가 없습니다.</td>
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
					
					<div align="right">
						<a href="/khhospital/control?cmd=DOCSKINQBOARDWRITE" class="btn">글쓰기</a>			
					</div>
					<div class="pagination pagination-large pagination-centered" >
						<ul>
							<li><c:if test="${nowBlock > 0}">
								<a href="/khhospital/control?cmd=DOCSKINQBOARDMAIN&nowPage=${pagePerBlock*(nowBlock-1)}&nowBlock=${nowBlock-1}"><<</a>
								</c:if>
							</li>
								<c:forEach begin="1" end="${pagePerBlock}" step="1" var="i">
								<c:if test="${(nowBlock * pagePerBlock) +i-1 < totalPage}">
									<li><a href="/khhospital/control?cmd=DOCSKINQBOARDMAIN&nowPage=${(nowBlock*pagePerBlock)+i-1}&nowBlock=${nowBlock}">${(nowBlock * pagePerBlock)+i}</a></li>
								</c:if>
								</c:forEach>
							<li>
								<c:if test="${totalBlock > nowBlock+1}">
									<a href="/khhospital/control?cmd=DOCSKINQBOARDMAIN&nowPage=${pagePerBlock*(nowBlock+1)}&nowBlock=${nowBlock+1}">>></a>
								</c:if>
							</li>					
						</ul>
					</div>
					<div align="center">
						<form class="form-search" method="post" action="/khhospital/control" name="search">		
							<input type="hidden" name="cmd" value="DOCSKINQBOARDMAIN"/>
							<input type="hidden" name="num" />
							<select class="span1" name="keyField" id="keyField" >
								<option value="qb_title_skin" >제목</option>
								<option value="qb_name_skin" >작성자</option>
								<option value="qb_content_skin" >내용</option>
								<option value="qb_titlecontent_skin" >제목+내용</option>
							</select>
							<input type="text" size="15" name="keyWord" value="${keyWord}" />
							<input type="submit" class="btn" value="검색" />					
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<form name="read" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="DOCSKINQBOARDREAD"/>
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