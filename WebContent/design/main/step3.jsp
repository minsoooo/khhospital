<%@page import="bean.DocDto"%>
<%@page import="java.util.ArrayList"%>
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
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>

<script>
	$(document).ready(
		function(){			
			// 대기번호가 1번이 되고, 의사가 의사페이지에서 '상담하기'를 눌렀을 경우
			//if($("#waitCount").text() == 1 && $("#doc_online").attr("value") == 'true'){
				// 환자페이지에서 '상담하기'버튼이 나타나고 v속성이 1로 바뀜
				$("#btn_sangdam").attr("src", "/khhospital/design/images/btn_sangdam.jpg").attr("v","1");	
			
			//}
			
			$("#btn_sangdam").click(	
					function(){
						if($("#btn_sangdam").attr("v")==1){		
							// 환자가 상담하기 버튼을 클릭하면 채팅 팝업창이 뜨고 원래 있던 페이지는 메인화면으로 돌아감
							// 환자가 채팅을 시작할때 자신의 이름과 의사의 이름을 같이 넘겨준다. by 박민수 2016-07-07
	
							//var doc_name = $("#doc_name").attr("value");
							//var pat_name = $("#pat_name").attr("value");
							var doc_info_url = "/khhospital/control?cmd=COUNSELDOCINFO&doc_num=" + $("#doc_num").attr("value");
							//location.href = "/khhospital/control?cmd=INDEX";
							//window.open("/khhospital/control?cmd=STARTCHAT&pat=online","","width=400,height=360,top=+100,left=+420");
							window.open(doc_info_url,"","width=400,height=420,top=+100,left=+820");
						}
						
					}
			);
			
					// 일정시간마다 대기번호를 새로 요청함
					setInterval(function(){
						var doc_num = $("#doc_num").attr("value");
						$.post("/khhospital/waitlist.do",{"doc_num":doc_num},"xml").done(
								function(xml){
									var count = $(xml).find("count").text();
									$("#waitCount").text(count);								
								}		
						);	
					}, 1000*10);
				
		}	
	);
</script>

<style>
	#step1, #step2, #step3{
		width: 300px;
		height: 140px;
		margin-right: 30px;
	}

	#docTable{
		width: 780px;	
		text-align: center;
		color: #595959;
		margin-left: 80px;
		font-size:20px;
	}

	#btn_sangdam{
		border:3px solid #c1c1c1;
	}	
	
	#btn_sangdam:hover{
		border: 3px solid #2a71bc;
	}
</style>
</head>
<body>

<input type="hidden" id="doc_online" value="${applicationScope.online}" /> <!-- 해당 의사가 채팅에 접속 중인지를 알기위한 변수 -->
<input type="hidden" id ="doc_num" value="${doc_num}" />
<input type="hidden" id="dept_name" value="${dept_name}" />
<input type="hidden" id="doc_part" value="${doc_part}" />
<input type="hidden" id ="doc_name" value ="${doc_name}"/>	<!-- 채팅창에 보내주기 위한 정보를 담는다. -->
<input type="hidden" id ="pat_name" value ="${sessionScope.pat_name }"/>
	<div class="container">
		<div class="row">
			<div class="span12">
				<jsp:include page="/design/header/main_header.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="span12" style="margin-left:90px; margin-top:50px">
				<img src="/khhospital/design/images/step1_1.jpg" id="step1"/>
				<img src="/khhospital/design/images/step2_1.jpg" id="step2"/>
				<img src="/khhospital/design/images/step3_2.jpg" id="step3"/>
				<br/><br/>
				
				<div style="margin-top:50px; margin-bottom:150px; width:965px;">	
					<table id="docTable">
						<tr style="font-size: 23px; font-weight:bold; height:80px; border-bottom: 1px solid #d8d8d8">
							<td>의사번호</td><td>진료과</td><td>진료분야</td><td>의사명</td><td></td>
						</tr>			
						<tr style="height:80px">
							<td>${param.doc_num}</td>
							<td>${param.dept_name}</td>
							<td>${param.doc_part}</td>
							<td>${param.doc_name}</td>
						</tr>
					</table>
					
					<div style="width:150px; height:150px;margin-top:60px; margin-left:400px; background-color: #4197e0; border:5px solid #c1c1c1">
						<br/>
						<font style="font-size:25px; color:#fff; margin-left:27px">대기번호</font><br/><br/><br/>
						<font style="font-size:70px; color:#fff; margin-left:55px" id="waitCount">${waitCount}</font><br/><br/>
					</div>					
					<br/><br/>
						<font style="font-size:17px; color:#595959; margin-left:300px">* 다시 로그인을 하면 대기번호가 초기화됩니다.</font><br/><br/>
						<font style="font-size:17px; color:#595959; margin-left:250px"> * 대기번호 1번이 된 후 기다리시면 상담버튼이 나타납니다.</font>
					<br/><br/><br/>
					<div style="margin-left:430px">
						<img src="" v ="0" id="btn_sangdam" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/design/footer/main_footer.jsp"></jsp:include>
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>