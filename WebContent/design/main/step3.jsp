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
			// ����� �ǻ��� �̹����� ����ֱ� ����
			if($("#doc_img").attr("value") == null){	// ����� �̹����� ���ٸ� default�̹���
				$("#docImg").attr("src","/khhospital/upload/default.jpg");
			}
			else{
				var src = "/khhospital/upload/" + $("#doc_img").attr("value");
				$("#docImg").attr("src", src);
			}
			
			// ����ȣ�� 1���� �ǰ�, �ǻ簡 �ǻ����������� '����ϱ�'�� ������ ���
			//if($("#waitCount").text() == 1 && $("#doc_online").attr("value") == 'true'){
				// ȯ������������ '����ϱ�'��ư�� ��Ÿ���� v�Ӽ��� 1�� �ٲ�
				$("#btn_sangdam").attr("src", "/khhospital/design/images/btn_sangdam.jpg").attr("v","1");	
			
			//}
			
			$("#btn_sangdam").click(	
					function(){
						if($("#btn_sangdam").attr("v")==1){		
							// ȯ�ڰ� ����ϱ� ��ư�� Ŭ���ϸ� ä�� �˾�â�� �߰� ���� �ִ� �������� ����ȭ������ ���ư�
							// ȯ�ڰ� ä���� �����Ҷ� �ڽ��� �̸��� �ǻ��� �̸��� ���� �Ѱ��ش�. by �ڹμ� 2016-07-07
	
							//var doc_name = $("#doc_name").attr("value");
							//var pat_name = $("#pat_name").attr("value");
							//window.open("/khhospital/control?cmd=STARTCHAT&pat=online","","width=400,height=360,top=+100,left=+420");
						}
						
					}
			);
			
					// �����ð����� ����ȣ�� ���� ��û��
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

	#btn_sangdam{
		margin-left:75px;
		margin-top:25px;
		border:3px solid #c1c1c1;
	}	
	
	#btn_sangdam:hover{
		border: 3px solid #2a71bc;
	}

	#docImg{
		margin-top: 20px;
		margin-left: 20px;
		margin-bottom: 30px;
		border: 5px solid #c1c1c1;
	}
	#docName{
		color: #4197e0;
		font-weight: bold;
		font-size: 34px;
		margin-left: 15px;
	}

	#docTable{
		text-align: center;
		color: #595959;
		margin-left: 10px;
		font-size:20px;
		margin-top: 20px;
		width: 170px;
	}

	#docTable td{
		border-bottom: 1px solid #d8d8d8;
		font-size: 22px;
		font-weight:bold;
		padding-top: 10px;
		padding-bottom: 10px;
		text-align: center;
	}

	#banner{
		margin-top:20px;
		margin-left:20px;
	}
	
	#rightDiv{
		margin-top:20px;
		margin-right:220px;
		width:450px;
		height:600px;
		float:right;
		background-color: #f7f7f9;
	}
	
	#docInfoDiv{
		float:right; 
		margin-right:30px;
		margin-top:100px;
	}
	
	#waitCountDiv{
		width:150px; 
		height:150px;
		margin-top:15px; 
		margin-left:45px; 
		background-color: #4197e0; 
		border:5px solid #c1c1c1;
	}
</style>
</head>
<body>

<input type="hidden" id="doc_online" value="${applicationScope.online}" /> <!-- �ش� �ǻ簡 ä�ÿ� ���� �������� �˱����� ���� -->
<input type="hidden" id ="doc_num" value="${doc_num}" />
<input type="hidden" id="dept_name" value="${dept_name}" />
<input type="hidden" id="doc_part" value="${doc_part}" />
<input type="hidden" id ="doc_name" value ="${doc_name}"/>	<!-- ä��â�� �����ֱ� ���� ������ ��´�. -->
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
				
				<div style="margin-top:50px; margin-bottom:100px;">
					<!-- ���ǻ��� or ä�� -->
					<img src="/khhospital/design/images/step3_banner.jpg" id="banner"/>
					
					<!-- �ǻ����� �� ����ȣ -->
					<div id="rightDiv">
						<input type="hidden" value="${docDto.doc_img}" id="doc_img"/>
						
						<!-- �ǻ����� -->
						<img src ="" id ="docImg"/>						
						<div id="docInfoDiv">	
							&nbsp;&nbsp;<font id="docName">${docDto.doc_name}</font>
							<font style="font-size:20px; font-weight:bold; color:#595959">����</font>
							<table id="docTable">
								<tr>
									<td>�����</td><td>${docDto.dept_name}</td>
								</tr>
								<tr>
									<td>����о�</td><td>${docDto.doc_part}</td>
								</tr>
							</table>
						</div>								
							
						<!-- ����ȣ, ����ϱ��ư -->
						<div id="waitCountDiv">
							<br/>
							<font style="font-size:25px; color:#fff; margin-left:27px">����ȣ</font><br/><br/><br/>
							<font style="font-size:70px; color:#fff; margin-left:55px" id="waitCount">${waitCount}</font><br/><br/>
						</div>				
	
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