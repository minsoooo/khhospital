<!-- 
	 �ۼ��� : �ڹμ�
	 �ۼ��� : 2016-06-12
	 ���� : Calendar ��ü�� �̿��� �ǻ� �ٹ� ���̺� ���.
	 ������ : 2016-06-17
	 �������� : �ٹ� ��� �Ϸ�� �޼��� ����

 -->

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>reg_work</title>
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/js/jquery-2.2.3.min.js"></script>
<script src ="/khhospital/js/ajax.js"></script>
<script>
	var Mdays ="";
	var Adays ="";
	$(document).ready(
			function() {					
						var $daysM = $("#workM").attr("days")
						var dateM =$daysM.split("/");
						for(var i =0; i<dateM.length;i++){
							var id = "#"+dateM[i].trim();
							$(id).attr("src","/khhospital/design/images/morning.jpg").attr("v", "1");
						}
						
						var $daysA = $("#workA").attr("days")
						var dateA =$daysA.split("/");
						for(var i =0; i<dateA.length;i++){
							var id = "#"+dateA[i].trim();
							$(id).attr("src","/khhospital/design/images/afternoon.jpg").attr("v", "2");
						}
						
						if($("#regCheck").attr("v") == "success"){
							alert("��ϿϷ�");
						}
				
				
				$("img").click(function() {
							if ($(this).attr("src") == "/khhospital/design/images/empty.jpg") {
								$(this).attr("src", "/khhospital/design/images/morning.jpg").attr("v", "1");
				
							} else if ($(this).attr("src") == "/khhospital/design/images/morning.jpg") {
								$(this).attr("src", "/khhospital/design/images/afternoon.jpg").attr("v", "2");
							} else {
								$(this).attr("src", "/khhospital/design/images/empty.jpg").attr("v", "0");
							}
						}
					);
				$("#btn").click(
					function(){
						for(var i=0 ; i<$("img[v='1']").parent().length;i++){
							Mdays += $("img[v='1']").parent().eq(i).text()+"/";
						}
						for(var j=0 ; j<$("img[v='2']").parent().length;j++){
							Adays += $("img[v='2']").parent().eq(j).text()+"/";
						}
					
						var $form1 = $("#form1");
						$("#Mdays").attr("value",Mdays);
						$("#Adays").attr("value",Adays);
						
						$form1.submit();
					}		
				);
				$("#calendar").css("margin-left","330px");
				$("#nameDiv").css("margin-left","420px");
				$("#diaryTitle").css("color","#595959").css("font-size","20px").css("margin-bottom","20px")
				.css("margin-top","10px");
				$("#dTable td:first-child").css("color", "#F73e61");
				$("#dTable td:last-child").css("color", "#218fff");
			
		}
	);	
</script>
<style>
body {
	margin-top: 50px;
}

#td_dept {
	width: 40px;
	height: 40px;
}

#td_name {
	width: 40px;
	height: 40px;
}

#dTable td{
	border: 2px solid #595959;
	width: 65px;
	height: 65px;
	text-align: center;
	color :#595959;
	font-weight: bold;
	font-size: 20px;
}

#dTable img{
	width:65px;
	height:65px;
}

#tr_first{
	font-weight:bold;
	font-size: 20px;
	color: #595959;
}

#dayTitle{
	color: #595959;
}

#btn {
	margin-top: 20px;
	margin-left:200px;
}
</style>
</head>
<body>
<%!//�������� �����ϴ� constant
	public static final int START_DATE = 1;
%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<!-- ��ϿϷ� ���θ� �޴� SPAN �±� -->
<span id ="regCheck" v ="${regCheck}"></span>
<div class = "container">
	<div class = "row">
		<div class ="span12">
			<jsp:include page ="/design/header/mgr_header.jsp"></jsp:include>
		</div>
	</div>
</div>
	<!-- �ٹ� ���� �޾ƿ��� ��  SPAN �±� -->
	<span id = "workM" days ="${work.work_m_days}"></span>
	<span id = "workA" days = "${work.work_a_days }"></span>
	<!-- ��ü ���� div -->
	<div class="container" >
		<div class="row">
			<div class="span12">
				<!-- ������ �ǻ�� -->
				<div id= "nameDiv">
					<table>
						<tr id ="tr_first">
							<td>����� : ${work.dept_name}</td>
							<td id="td_dept"></td>
							<td>�ǻ�� : ${work.doc_name}</td>
							<td id="td_name"></td>

						</tr>
					</table>
				</div>
				<!-- �ٹ����̺� �޷�  -->
				<%
				Calendar cal = Calendar.getInstance();
				%>
				<jsp:useBean id="dao" class="bean.CalDao"></jsp:useBean>
				<jsp:useBean id="dto" class="bean.CalDto"></jsp:useBean>
				<jsp:setProperty property="month" name="dto"
					value="${work.now_month}" />
				<jsp:setProperty property="year" name="dto" value="${work.now_year}" />
				<%
						
					int nowMonth = dao.getNowMonth(dto.getMonth());
					int nowYear = dao.getNowYear(dto.getYear());
					cal.set(Calendar.MONTH, nowMonth-1);
				%>
					<div class ="span8" id ="calendar">
					<form method ="post" action ="/khhospital/control?cmd=UPDATEWORK&doc_num=${work.doc_num}&now_year=${work.now_year}&now_month=${work.now_month}" id ="form1">
						<input type ="hidden" name ="Mdays"  id = "Mdays" value =""/>
						<input type ="hidden" name ="Adays"  id = "Adays" value =""/>
						<input type ="hidden" name ="dept_name" value="${work.dept_name}"/>
						<input type ="hidden" name ="doc_name" value="${work.doc_name}"/>
						
						
							<div id="diaryTitle">
								<a href="/khhospital/control?cmd=WORK&check=new&now_month=<%=nowMonth - 1 == 0 ? 12 : nowMonth - 1%>&now_year=<%=nowMonth - 1 == 0 ? nowYear - 1 : nowYear%>
								&doc_num=${work.doc_num} ">&lt;&lt;</a>
								<span id="dayTitle"> ${work.now_year}�� ${work.now_month}��
								</span> <a href="/khhospital/control?cmd=WORK&check=new&now_month=<%=nowMonth + 1 == 13 ? 1 : nowMonth + 1%>&now_year=<%=nowMonth + 1 == 13 ? nowYear + 1 : nowYear%>
								&doc_num=${work.doc_num}">&gt;&gt;</a>
							</div>
							<div id="diaryContent">
								<table id="dTable">
										<tr>
											<td>Sun</td>
											<td>Mon</td>
											<td>Tue</td>
											<td>Wed</td>
											<td>Thu</td>
											<td>Fri</td>
											<td>Sat</td>
										</tr>
										<tr>
											<%
												for (int tempDay = 1;; tempDay++) {
													//�����ϴ� �ӽó�¥�� �޷°�ü ����
													cal.set(Calendar.DAY_OF_MONTH, tempDay);
													if (tempDay != cal.get(Calendar.DAY_OF_MONTH)) {
														//������ ��¥�� �ӽó�¥�� �ٸ��ٸ� �� ���̹Ƿ� 
														//�ݺ����� ����������.		     
														//���ǰ����߰�
														// �޺κ� ����ó��
														for (int i = cal.get(Calendar.DAY_OF_WEEK); i <= 7; i++) {
															if (cal.get(Calendar.DAY_OF_WEEK) == 1) { //�ؿ� ���� ĭ�� ���ŵ�
																break;
	
															}
											%>
											<td class="blank">&nbsp;</td>
											<%
												}
														break;
													} //end if
													switch (tempDay) {
													case START_DATE: //�������� ���δ� constant
														//1���� ����ϱ� ���� ������ ����Ѵ�.
														int week = cal.get(Calendar.DAY_OF_WEEK);
	
														for (int blank = 1; blank < week; blank++) {
											%>
											<td class="blank">&nbsp;</td>
											<%
												} //end for
													}//end switch
											%>
											<td ><%=tempDay%><img src="/khhospital/design/images/empty.jpg" v="0" id ="<%=tempDay%>" /></td>
	
											<%
												//������ ���ڰ� ������̸� ���� �����Ѵ�.
													switch (cal.get(Calendar.DAY_OF_WEEK)) {
													case Calendar.SATURDAY:
											%>
										</tr>
										<tr>
											<%
												}
												}
												//end for
											%>									
								</table>
							</div>
						<input type ="button" value ="���/����" id ="btn" class ="btn"/>				
					</form>	
					</div>			
				</div>
			</div>
		</div>
<div class ="container">
	<div class ="row">
		<div class ="span12">
			<jsp:include page ="/design/footer/mgr_footer.jsp"/>
		</div>
	</div>
</div>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>