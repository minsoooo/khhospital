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
							//var doc_info_url = "/khhospital/control?cmd=COUNSELDOCINFO&doc_num=" + $("#doc_num").attr("value");
							//location.href = "/khhospital/control?cmd=INDEX";
							//window.open("/khhospital/control?cmd=STARTCHAT&pat=online","","width=400,height=360,top=+100,left=+420");
							//window.open(doc_info_url,"","width=400,height=420,top=+100,left=+820");
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

	#docImg{
		margin-top: 20px;
		margin-left: 100px;
		margin-bottom: 30px;
		border: 5px solid #c1c1c1;
	}
	#docName{
		color: #4197e0;
		font-weight: bold;
		font-size: 30px;
		margin-left: 50px;
	}
	
	#docTable{
		margin-top: 20px;
		width: 200px;
		margin-left: 100px;
	}
	
	#docTable td{
		border-bottom: 1px solid #d8d8d8;
		font-size: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
		text-align: center;
		margin-left: 100px;
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
				<div style="width:450px; height:600px; background-color:#d8d8d8; float:left;"></div>
				<input type="hidden" value="${docDto.doc_img}" id="doc_img"/>
				<img src ="" id ="docImg"/>
				<font id="docName">${docDto.doc_name}</font> ����
				<table id="docTable">
					<tr>
						<td>�����</td><td>${docDto.dept_name}</td>
					</tr>
					<tr>
						<td>����о�</td><td>${docDto.doc_part}</td>
					</tr>
				</table>
					
					<div style="width:150px; height:150px;margin-top:60px; margin-left:400px; background-color: #4197e0; border:5px solid #c1c1c1">
						<br/>
						<font style="font-size:25px; color:#fff; margin-left:27px">����ȣ</font><br/><br/><br/>
						<font style="font-size:70px; color:#fff; margin-left:55px" id="waitCount">${waitCount}</font><br/><br/>
					</div>					
					<br/><br/>
						<font style="font-size:17px; color:#595959; margin-left:300px">* �ٽ� �α����� �ϸ� ����ȣ�� �ʱ�ȭ�˴ϴ�.</font><br/><br/>
						<font style="font-size:17px; color:#595959; margin-left:250px"> * ����ȣ 1���� �� �� ��ٸ��ø� ����ư�� ��Ÿ���ϴ�.</font>
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