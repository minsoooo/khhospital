<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
</head>
<style>
	#btnDiv{
		margin-left:500px;
		margin-top:50px;
	}
	
	#btn_sangdam{
		border:3px solid #c1c1c1;
	}	
	
	#btn_sangdam:hover{
		border: 3px solid #2a71bc;
	}
	#waitCountDiv{
		margin-left:380px;
		margin-top:50px;
	}
	#waitTable{
		width: 400px;	
		text-align: center;
		color: #595959;
		margin-left: 350px;
		font-size:20px;
		margin-bottom:100px;
	}
</style>
<script>
	var popup1, popup2, popup3, popup4, popup5 ;
	
	function fnCounsel(){
		if($("#count").attr("value") == 0){
			alert("현재 대기중인 환자가 없습니다.");
		}
		else{
		popup1 = window.open("/khhospital/control?cmd=PATCHECKLIST&pat_id="+$("#pat_id").attr("value"),"","width=400,height=360,top=+10,left=+920");										
		popup2 = window.open("/khhospital/control?cmd=STARTCHAT","","width=400,height=325,top=+10,left=+470")
		popup3 = window.open("/khhospital/control?cmd=OPENMEMO&pat_num="+$("#pat_num").attr("value"),"","width=400,height=200,top=+460,left=+920")
		popup4 = window.open("/khhospital/control?cmd=OPENHISTORY&pat_num="+$("#pat_num").attr("value"),"","width=400,height=325,top=+10,left=+20")
		popup5 = window.open("/khhospital/control?cmd=OPENRESERVE&pat_num="+$("#pat_num").attr("value")+"&now_month="+$("#now_month").attr("value")
					+"&now_year="+$("#now_year").attr("value"),"","width=850,height=240,top=+420,left=+20")
		}		
	}
	
	function fnPopupClose(){	// 팝업창이 뜨고 상담종료 버튼이 눌리면 호출될 함수, 부모페이지 함수호출은 jQuery에서 안됨
		popup1.close();
		popup2.close();
		popup3.close();
		popup4.close();
		popup5.close();
		
		
		location.href = "/khhospital/control?cmd=ENDCOUNSEL&pat_id=" + $("#pat_id").attr("value");
	}

</script>

<body>
<%!//시작일을 저장하는 constant
	public static final int START_DATE = 1;%>
	<%
		Calendar cal = Calendar.getInstance();
	%>
	<%
		 int now_month = cal.get(Calendar.MONTH)+1;
		 int now_year = cal.get(Calendar.YEAR);
		 request.setAttribute("now_month", now_month);
		 request.setAttribute("now_year", now_year);
	%>
	<span id ="now_month" value ="${now_month }"></span>
	<span id ="now_year" value ="${now_year }"></span>
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
				<div id="btnDiv">
					<img src="/khhospital/design/images/btn_sangdam.jpg" id="btn_sangdam" onclick="javascript:fnCounsel()"/>
				</div>
				
				<div id="waitCountDiv">
					<img src="/khhospital/design/images/check_icon.jpg"/>
					
					<c:if test="${myWaitList != null}">			
						<font style="font-size:20px">상담 대기 환자 : 총 ${count} 명</font><br/><br/>
						<input type="hidden" id="count" value="${count}" />
					</c:if>
					
					<c:if test="${myWaitList == null}">
						<font style="font-size:20px">상담 대기 환자 : 총  0 명</font><br/><br/>				
						<input type="hidden" id="count" value="${count}" />
					</c:if>
				</div>
				<!-- 상담 대기 목록 -->
				<table id="waitTable">
					<tr style="font-size: 23px; font-weight:bold; height:80px; border-bottom: 1px solid #d8d8d8">
						<td>순번</td><td>환자명</td>
					</tr>				
				
					<c:if test="${myWaitList != null}">
						<c:forEach items="${myWaitList}" var="myPatient" varStatus="i">
							<c:if test="${i.count == 1}">
								<!-- 채팅을 시작하기 위해 대기번호 1번인 환자의 아이디를 담음 -->
								<input type="hidden" id="pat_id" value="${myPatient[1]}" />
								<!--  -->
								<input type="hidden" id="pat_num" value="${myPatient[3]}" />
							</c:if>
							<tr style="height:80px">
								<td>${i.count}</td><td>${myPatient[2]}</td>
							</tr>
						</c:forEach>	
					</c:if>
					
				</table>
				
			</div>
		</div>
	</div>

	<jsp:include page="/design/footer/doc_footer.jsp"></jsp:include>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>