<!-- 
  	�ۼ��� : �ڹμ�
  	�ۼ��� : 2016-06-20
  	���� : �ǻ� �ٹ� ��¥�� ���� ��¥�� ���ؼ� �����ͼ� �ѷ��ش�.

 -->


<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/khhospital/bootstrap/css/bootstrap-responsive.min.css" />
<script src="/khhospital/bootstrap/js/jquery-2.2.3.min.js"></script>
<script>
	$(document).ready(
			function(){
				//������ ó��
				$("#workTable").css("text-align","center").css("font-size","10px")
				.css("font-weight","bold").css("background-color","#2c2f3a").css("color","#8b8d94");
				$("#workTable td").css("width","20px").css("height","20px")
				.css("border","2px solid #595959");
				$("#btnDiv").css("margin-bottom","30px");
				$("#doc_name").css("color","#4197e0").css("font-weight","bold").css("font-size","40px");
				$("#dept_name").css("font-weight","bold").css("font-size","25px").css("color","#595959");
				$("#dept").css("font-weight","bold").css("font-size","25px").css("color","#595959");
				$("#doc_part").css("font-weight","bold").css("font-size","25px").css("color","#595959");
				$("#part").css("font-weight","bold").css("font-size","20px").css("color","#595959")
				$("#yearDiv").css("vertical-align","middle")
				$("#bodyDiv").css("background-color","#f7f7f9")
				$("#work_month").css("font-weight","bold").css("font-size","10px")
				.css("color","#595959")
				$("#reserve_info").css("border","2px solid #595959").css("height","250px")
				.css("background-color","#fff").css("text-align","center").css("color","#595959")
				$("#reserve_table").css("margin-left","80px")
				$("#reserve_table td").css("width","100px").css("height","40px")
				.css("border-bottom","1px solid #d8d8d8")
				$("#info").css("font-size","12px").css("margin-left","20px")
				.css("border-bottom","1px solid #ff4f69").css("color","#ff4f69")
				$("#img_info").css("padding-left","500px")
				$("#reserve_head").css("padding-top","10px").css("font-weight","bold")
				.css("font-size","17px")
				$("#btn_reserve").css("margin-top","8px").css("width","100px").css("height","35px")
				$("#res_text").css("margin-left","60px").css("margin-top","8px")
				// jQuery ó�� �κ�
				//���� �ٹ���¥ ó�� 
				var $daysM = $("#daysM").attr("days")
				var dateM =$daysM.split("/");
				for(var i =0; i<dateM.length;i++){				
					var id ="#md"+dateM[i].trim();			
					$(id).attr("src","/khhospital/design/images/circle_green.png").attr("v","1")
				}
				//���� �ٹ���¥ ó��
				var $daysA = $("#daysA").attr("days")
				var dateA =$daysA.split("/");
				for(var i =0; i<dateA.length;i++){
					var id = "#ad"+dateA[i].trim();
					$(id).attr("src","/khhospital/design/images/circle_green.png").attr("v","1");
				}
				var today= $("#today").attr("v");
				// ���ó�¥�� ���Ͽ� �� �� ��¥�� ���� �Ұ� ó��.
				for(var i =0; i<today; i++){
					var id = "#ad"+i;
					if($(id).attr("v")=="1"){
						$(id).attr("src","/khhospital/design/images/circle_red.png").attr("v","2");
					}
				}
				
				for(var i =0; i<today; i++){
					var id = "#md"+i;
					if($(id).attr("v")=="1"){
						$(id).attr("src","/khhospital/design/images/circle_red.png").attr("v","2");
					}
				}
				
				//���� ���� Ȯ��
				var $resDay = $("#resDays").attr("days")
				var resDay =$resDay.split("/");
				for(var i =0; i<resDay.length;i++){
					var id = "#ad"+resDay[i].trim();
					if($(id).attr("v")=="1"){
						$(id).attr("src","/khhospital/design/images/circle_red.png").attr("v","2");
					}
				}
				// ���� ���� Ȯ��	
				var $resDay = $("#resDays").attr("days")
				var resDay =$resDay.split("/");
				for(var i =0; i<resDay.length;i++){
					var id = "#md"+resDay[i].trim();
					if($(id).attr("v")=="1"){
						$(id).attr("src","/khhospital/design/images/circle_red.png").attr("v","2");
					}
				}
				
				// jQuery�� �̿��� �±׿� �۾���
				$("#workTable img").click(
					function(){
							var img = $(this).attr("v");
							var type =$(this).attr("id").split("d")[0];
							var date = $(this).attr("id").split("d")[1];
							if(img == "1"){
								if(type == "a"){
									var t = "����";
									$("#res_type").attr("v","a")
								}else{
									var t ="����";
									$("#res_type").attr("v","m")
								}							
								$("#date").val(date+"��"+t)
							}
							
					}		
				);
				// ���� ��ư Ŭ�� �̺�Ʈ// controllerȣ��
				$("#btn_reserve").click(
					function(){
						var res_date =$("#date").val().split("��")[0];
						var doc_num =$("#doc_num").attr("v")
						var now_month=$("#now_month").attr("v")
						var now_year=$("#now_year").attr("v")
						var pat_num=$("#pat_num").attr("v")
						var res_type =$("#res_type").attr("v")
						location.href ="/khhospital/control?cmd=DOCRESERVEPROC"
								+"&doc_num="+doc_num+"&now_month="+now_month+
								"&now_year="+now_year+"&pat_num="+pat_num+"&res_date="+res_date+
								"&res_type="+res_type;
					}	
				);
				
			}
	);
</script>
</head>
<body>
<!-- jQuery���� ���� ������ �������� �� �±� -->
<span id ="daysM" days ="${work.work_m_days }"></span>
<span id ="daysA" days ="${work.work_a_days }"></span>
<span id ="resDays" days ="${work.res_days }"></span>
<span id ="doc_num" v ="${work.doc_num }"></span>
<span id ="now_month" v ="${work.now_month }"></span>
<span id ="now_year" v ="${work.now_year }"></span>
<span id ="pat_num" v ="${param.pat_num}"></span>
<span id ="today" v ="${today}"></span>
<span id ="res_type" v =""></span>

<%!//�������� �����ϴ� constant
	public static final int START_DATE = 1;%>
	<%
		Calendar cal = Calendar.getInstance();
	%>
	<jsp:useBean id="dto" class="bean.CalDto"></jsp:useBean>
	<jsp:useBean id="dao" class="bean.CalDao"></jsp:useBean>
	<jsp:setProperty property="month" name="dto" value="${work.now_month }" />
	<jsp:setProperty property="year" name="dto" value="${work.now_year }" />
	<%
		// ��¥ ������ �̹��� �� �� ���ϱ�.
		int nowMonth = dao.getNowMonth(dto.getMonth());
		int nowYear = dao.getNowYear(dto.getYear());
		cal.set(nowYear,nowMonth-1,1);
		int maxDay = cal.getActualMaximum(Calendar.DATE)+1;
	%>

<div id = "bodyDiv" >
	<div class ="container" id ="mainDiv">
		<div class ="row">
			<div class ="span12" id ="yearDiv">
				<div class ="span12" >
					<a href ="/khhospital/control?cmd=OPENRESERVE&checkNew=new&
					now_month=<%=nowMonth - 1 == 0 ? 12 : nowMonth - 1%>&now_year=<%=nowMonth - 1 == 0 ? nowYear - 1 : nowYear%>
					&doc_num=${work.doc_num}">&lt;&lt;</a>
					&nbsp;&nbsp;
					<span id ="work_month">${work.now_year}�� ${work.now_month}��</span>
					&nbsp;&nbsp;
					<a href ="/khhospital/control?cmd=OPENRESERVE&checkNew=new&
					now_month=<%=nowMonth + 1 == 13 ? 1 : nowMonth + 1%>&now_year=<%=nowMonth + 1 == 13 ? nowYear + 1 : nowYear%>
					&doc_num=${work.doc_num}">&gt;&gt;</a>
					<span id ="info">* ������ ���Ͻô� ��¥�� Ŭ���ϼ���.</span>
					<div class ="input-append" id ="res_text">
						<input type ="text" readonly="readonly" id="date" style="margin-top:8px;height:25px"/><input type="button" value ="����"  
						id="btn_reserve" class ="btn add-on" style="width:40px;height:25px"/>
					</div>
				</div>
				<div class ="span4" >
					<img src ="/khhospital/design/images/circle_info.png" id="img_info"/>
				</div>
			</div>				
				<table id ="workTable">
					<!-- ��¥ �� -->
					<tr>
						<td>��¥</td>
						<%
							for (int i = 1; i < maxDay; i++) {
						%>
						<td><%=i%></td>
						<%
							}
						%>
					</tr>
					<!-- ������ -->
					<tr id ="mor">
						<td>����</td>
						<%
							for (int i = 1; i < maxDay; i++) {
						%>
						<td><img src="/khhospital/design/images/empty.png" id ="md<%=i%>" v ="0" /></td>
						<%
							}
						%>
					</tr>
					<!-- ������ -->
					<tr id ="after">
						<td>����</td>
					<%
						for (int j = 1; j < maxDay; j++) {
					%>
					<td ><img src="/khhospital/design/images/empty.png" id ="ad<%=j %>" v ="0"/></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
</div>

<script src="/khhospital/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>