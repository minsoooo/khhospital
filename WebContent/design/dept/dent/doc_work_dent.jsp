<!-- 
	작성자 : 박민수
	작성일자 : 2016-06-14
	설명 : 의사 근무 일정 조회 페이지/ 오전,오후 근무 구분후 체크 해주기 

 -->


<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>doc_work_info</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
			function(){
				$("#workTable").css("text-align","center").css("font-size","15px")
				.css("font-weight","bold").css("background-color","#2c2f3a").css("color","#8b8d94");
				$("#workTable td").css("width","33px").css("height","33px")
				.css("border","2px solid #595959");
				$("#btnDiv").css("margin-bottom","30px");
				$("#docImg").css("width","200px").css("height","190px").css("margin-left","100px")
				.css("border","2px solid #595959");
				$("#doc_name").css("color","#4197e0").css("font-weight","bold").css("font-size","40px");
				$("#dept_name").css("font-weight","bold").css("font-size","25px").css("color","#595959");
				$("#dept").css("font-weight","bold").css("font-size","25px").css("color","#595959");
				$("#doc_part").css("font-weight","bold").css("font-size","25px").css("color","#595959");
				$("#part").css("font-weight","bold").css("font-size","20px").css("color","#595959")
				$("#yearDiv").css("margin-top","30px").css("vertical-align","middle");
				$("#bodyDiv").css("maring-bottom","50px");
				$("#mainDiv").css("padding-top","20px").css("margin-top","20px")
				.css("margin-bottom","20px");
				$("#work_month").css("font-weight","bold").css("font-size","20px")
				.css("color","#595959");
				
				var $daysM = $("#daysM").attr("days")
				var dateM =$daysM.split("/");
				for(var i =0; i<dateM.length;i++){				
					var id ="#m"+dateM[i].trim();			
					$(id).attr("src","/khhospital/design/images/circle_green.png")
					.remove("hidden");
				}
				
				var $daysA = $("#daysA").attr("days")
				var dateA =$daysA.split("/");
				for(var i =0; i<dateA.length;i++){
					var id = "#a"+dateA[i].trim();
					$(id).attr("src","/khhospital/design/images/circle_green.png");
				}
				
				$("#btnJinryo").click(
					function(){
						var checkLogin =$("#checkLogin").attr("value");
						if(checkLogin== "patient"){
							var doc_num =$("#doc_num").attr("v")
							var now_month=$("#now_month").attr("v")
							var now_year=$("#now_year").attr("v")
							location.href="/khhospital/control?cmd=RESERVE&doc_num="+doc_num+"&now_month="+now_month+"&now_year="
									+now_year+"&where=dent";							
						}
						else{
							alert("로그인을 해주세요")
						}
					}		
				);
				
				
			}
	);
		

</script>
</head>
<body>
<span id ="daysM" days ="${work.work_m_days }"></span>
<span id ="daysA" days ="${work.work_a_days }"></span>
<span id ="checkLogin" value ="${sessionScope.user}"></span>
<span id ="doc_num" v ="${work.doc_num }"></span>
<span id ="now_month" v ="${work.now_month }"></span>
<span id ="now_year" v ="${work.now_year }"></span>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/dept_dent_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
<%!//시작일을 저장하는 constant
	public static final int START_DATE = 1;%>
	<%
		Calendar cal = Calendar.getInstance();
	%>
	<jsp:useBean id="dto" class="bean.CalDto"></jsp:useBean>
	<jsp:useBean id="dao" class="bean.CalDao"></jsp:useBean>
	<jsp:setProperty property="month" name="dto" value="${work.now_month }" />
	<jsp:setProperty property="year" name="dto" value="${work.now_year }" />
	<%
		int nowMonth = dao.getNowMonth(dto.getMonth());
		int nowYear = dao.getNowYear(dto.getYear());
		cal.set(nowYear,nowMonth-1,1);
		int maxDay = cal.getActualMaximum(Calendar.DATE)+1;
	%>

<div id = "bodyDiv" >
	<div class ="container" id ="mainDiv">
		<div class ="row">
			<div class ="span12">
					<div class ="span4">
						<img src ="/khhospital/upload/${work.doc_img }" id ="docImg"/>
					</div>
					<div class ="span4">
						<br/><br/>		
						<span id="doc_name">${work.doc_name}</span><span id="dept_name">교수</span><span id ="dept">[${work.dept_name }]</span>
						<br/><br/><br/>			
							<p id ="doc_part">[진료분야]</p> 
							<br/>
						<span id ="part">: ${work.doc_part }</span>						
					</div>	
				</div>
			<div class ="span12" id ="yearDiv">
				<div class ="span10">
					<a href ="/khhospital/control?cmd=SEARCHWORK&checkNew=new&
					now_month=<%=nowMonth - 1 == 0 ? 12 : nowMonth - 1%>&now_year=<%=nowMonth - 1 == 0 ? nowYear - 1 : nowYear%>
					&doc_num=${work.doc_num}&where=dent">&lt;&lt;</a>
					&nbsp;&nbsp;
					<span id ="work_month">${work.now_year}년 ${work.now_month}월</span>
					&nbsp;&nbsp;
					<a href ="/khhospital/control?cmd=SEARCHWORK&checkNew=new&
					now_month=<%=nowMonth + 1 == 13 ? 1 : nowMonth + 1%>&now_year=<%=nowMonth + 1 == 13 ? nowYear + 1 : nowYear%>
					&doc_num=${work.doc_num}&where=dent">&gt;&gt;</a>
				</div>
				<div class ="span2" id ="btnDiv">
					<img src ="/khhospital/design/images/btn_jinryo.jpg" id ="btnJinryo"/>
				</div>
			</div>				
				<table id ="workTable">
					<!-- 날짜 행 -->
					<tr>
						<td>날짜</td>
						<%
							for (int i = 1; i < maxDay; i++) {
						%>
						<td><%=i%></td>
						<%
							}
						%>
					</tr>
					<!-- 오전행 -->
					<tr id ="mor">
						<td>오전</td>
						<%
							for (int i = 1; i < maxDay; i++) {
						%>
						<td ><img src="/khhospital/design/images/empty.png" id ="m<%=i%>" /></td>
						<%
							}
						%>
					</tr>
					<!-- 오후행 -->
					<tr id ="after">
						<td>오후</td>
					<%
						for (int j = 1; j < maxDay; j++) {
					%>
					<td ><img src="/khhospital/design/images/empty.png" id ="a<%=j %>"/></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
</div>
<div class="container">
		<div class="row">
			<div class="span12">				
				<jsp:include page="/design/footer/dept_footer.jsp"></jsp:include>				
			</div>
		</div>
	</div>	
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>