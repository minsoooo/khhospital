<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>병원소개 메인</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<fmt:requestEncoding value="euc-kr" />

<!-- 글 번호를 받아서 전송한다. -->
<script>
	function fnRead(num){
			document.read.num.value = num;
			document.read.submit();
	}
</script>
</head>
<body>

<!-- 전송한 페이지를 받아서 저장한다 -->
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
			<jsp:include page="/design/header/main_header.jsp"></jsp:include>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<h1 style="margin-left: 500px; margin-top: 60px; margin-bottom: 60px">병원 소식</h1>
		<div class="span1" style="margin-left: 30px"></div>
		<div class="span10">
			<table class="table table-hover" width=80%">	
				<tr class="info">
					<td width="10%">글번호</td>
					<td align="left" width="30%">제목</td>
					<td width="8%">작성자</td>
					<td width="14%">작성일자</td>
					<td width="8%">조회수</td>
				</tr>
				
				<!-- 받아온 페이지가 있으면 출력한다 -->
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
			
			<!-- 페이지처리 -->	
			<div class="pagination pagination-large pagination-centered" >
				<ul>
					<li><c:if test="${nowBlock > 0}">
						<a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=${pagePerBlock*(nowBlock-1)}&nowBlock=${nowBlock-1}"><<</a>
						</c:if>
					</li>
						<c:forEach begin="1" end="${pagePerBlock}" step="1" var="i">
						<c:if test="${(nowBlock * pagePerBlock) +i-1 < totalPage}">
							<li><a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=${(nowBlock*pagePerBlock)+i-1}&nowBlock=${nowBlock}">${(nowBlock * pagePerBlock)+i}</a></li>
						</c:if>
						</c:forEach>
					<li>
						<c:if test="${totalBlock > nowBlock+1}">
							<a href="/khhospital/control?cmd=MGRINTERNALNEWSBOARDMAIN&nowPage=${pagePerBlock*(nowBlock+1)}&nowBlock=${nowBlock+1}">>></a>
						</c:if>
					</li>					
				</ul>
			</div>
			
			<!-- 검색 -->	
			<div align="center" style="margin-bottom:100px">
				<form class="form-search" method="post" action="/khhospital/control" name="search">		
					<input type="hidden" name="cmd" value="MGRINTERNALNEWSBOARDMAIN"/>
					<input type="hidden" name="num" />
					<select class="span1" name="keyField" id="keyField" >
						<option value="newsb_title_main" >제목</option>
						<option value="newsb_name_main" >작성자</option>
						<option value="newsb_content_main" >내용</option>
						<option value="newsb_titlecontent_main" >제목+내용</option>
					</select>
					<input type="text" size="15" name="keyWord" value="${keyWord}" />
					<input type="submit" class="btn" value="검색" />					
				</form>
			</div>
		</div>
	</div>
</div>
	
<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
	
<form name="read" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="MGRINTERNALNEWSBOARDREAD"/>
	<input type="hidden" name="num"/>
	<input type="hidden" name="isRead" value="true"/>	
</form>	
	
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>