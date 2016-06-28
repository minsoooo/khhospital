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
	
<!-- 키워드,키필드를 Command에서 받아서 저장한다 -->

<fmt:requestEncoding value="euc-kr" />
<c:set var="varKeyWord" value="${keyWord}"></c:set>
<c:set var="varKeyField" value="${keyField}"></c:set>

<!-- 글제목 클릭시, 글번호를 받아오고 그외에 입력받은 키워드와 키필드값을 read에 저장하고 전송하는 스크립트 -->
<script>
	function fnRead(num){
			document.read.num.value = num;
			document.read.keyWord.value = document.getElementById("keyWord").value;
			document.read.keyField.value = document.getElementById("varKeyField").value;
			document.read.submit();
	}
</script>	
</head>
<body>

<!-- Command에서  페이징 DTO를 받아서 저장한다.-->
<c:set var="totalRecord" value="${pdto.totalRecord}"></c:set>
<c:set var="numPerPage" value="${pdto.numPerPage}"></c:set>
<c:set var="pagePerBlock" value="${pdto.pagePerBlock}"></c:set>
<c:set var="totalPage" value="${pdto.totalPage}"></c:set>
<c:set var="totalBlock" value="${pdto.totalBlock}"></c:set>
<c:set var="nowPage" value="${pdto.nowPage}"></c:set>
<c:set var="nowBlock" value="${pdto.nowBlock}"></c:set>
<c:set var="beginPerPage" value="${pdto.beginPerPage}"></c:set>
	<!-- 상단 메뉴화면 include -->
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/dept_surg_header.jsp"></jsp:include>
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
						
						<!-- 테이블  출력하는부분 -->
						
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
						<a href="/khhospital/control?cmd=SURGQBOARDWRITE" class="btn">글쓰기</a>			
					</div>
					
					<!-- 페이징 숫자 나오는부분 << , 1,2,3,4,5 , >> -->
					
					<div class="pagination pagination-large pagination-centered" >
						<ul>
							<li><c:if test="${nowBlock > 0}">
								<a href="/khhospital/control?cmd=SURGQBOARDMAIN&nowPage=${pagePerBlock*(nowBlock-1)}&nowBlock=${nowBlock-1}"><<</a>
								</c:if>
							</li>
								<c:forEach begin="1" end="${pagePerBlock}" step="1" var="i">
								<c:if test="${(nowBlock * pagePerBlock) +i-1 < totalPage}">
									<li><a href="/khhospital/control?cmd=SURGQBOARDMAIN&nowPage=${(nowBlock*pagePerBlock)+i-1}&nowBlock=${nowBlock}">${(nowBlock * pagePerBlock)+i}</a></li>
								</c:if>
								</c:forEach>
							<li>
								<c:if test="${totalBlock > nowBlock+1}">
									<a href="/khhospital/control?cmd=SURGQBOARDMAIN&nowPage=${pagePerBlock*(nowBlock+1)}&nowBlock=${nowBlock+1}">>></a>
								</c:if>
							</li>					
						</ul>
					</div>
					
					<!-- 하단 검색창에서 제목 및 기타 설정 후 키워드 입력 후 전송버튼 클릭시에 입력한 값이 전송된다. -->
					
					<div align="center">
						<form class="form-search" method="post" action="/khhospital/control" name="search">		
							<input type="hidden" name="cmd" value="SURGQBOARDMAIN"/>
							<input type="hidden" name="num" />
							<select class="span1" name="keyField" id="keyField">
								<option value="qb_title_surg" >제목</option>
								<option value="qb_name_surg" >작성자</option>
								<option value="qb_content_surg" >내용</option>
								<option value="qb_titlecontent_surg" >제목+내용</option>
							</select>
							<input type="text" size="15" name="keyWord" id="keyWord" value="${varKeyWord}" />
							<input type="submit" class="btn" value="검색" />			
							<input type="hidden" id="varKeyField" value="${varKeyField}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 입력받은 키워드, 키필드 값을 저장하고 read로 보낸다 -->
	
<form name="read" method="POST" action="/khhospital/control">
	<input type="hidden" name="cmd" value="SURGQBOARDREAD"/>
	<input type="hidden" name="num"/>
	<input type="hidden" name="isRead" value="true"/>
	<input type="hidden" name="keyWord" />
	<input type="hidden" name="keyField" />
</form>		
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>	
</body>
</html>

