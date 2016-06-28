<!-- 
    �ۼ��� : ������
   �ۼ��� : 2016-06-17
   ���� : �ǻ� ������ header
   ������ :�ڹμ�
   ������ : 2016-06-20
   �������� : �ǻ� �ٹ����̺� �˻� ������ ������ ���� / Calendar ��ü ���

 -->



<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.nav {
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}

.nav-tabs {
	border-bottom: 0px;
}

[class*="span"] {
	float: left;
	min-height: 1px;
	margin-left: 10px
}

a {
	color: #595959;
	text-decoration: none
}

a:hover, a:focus {
	color: #4197e0;
	text-decoration: none;
}

.nav-tabs .open .dropdown-toggle {
	color: #4197e0;
	background-color: #fff;
	border-color: #fff
}

.dropdown-menu>li>a {
	padding: 15px;
	color: #595959;
}

.dropdown-menu>li>a:hover, .dropdown-menu>li>a:focus {
	color: #fff;
}

footer {
	background-color: #595f6a;
}

.foot1>a, .foot1 .caret, .foot2>a, .foot2 .caret {
	color: #fff;
}

.foot1>a:hover, .foot1>a:focus, .foot2>a:hover, .foot2>a:focus {
	color: #8be4ce;
}

.foot1 .caret, .foot2 .caret {
	margin-top: 8px;
	margin-left: 3px;
	border-top: 4px solid #fff;
}

.dropdown {
	margin-left :80px
}
</style>
</head>

<body>
<%!//�������� �����ϴ� constant
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
<header style="background-color: #fff;">
		<!-- �ΰ� & ���� -->
		<div class="container">
			<div class="row" style="margin-top: 50px">
				<div class="span8" style="margin-left: 15px">
					<a href="/khhospital/control?cmd=DOCINDEX"><img
						src="/khhospital/design/images/doctor_logo.jpg" /></a>
				</div>				
			</div>
		</div>

		<!-- �α׾ƿ� -->
		<div class="container">
			<div class="row">
				<div class="span8"></div>
				<div class="span2">
					<a href="/khhospital/control?cmd=INDEX"><img src="/khhospital/design/images/go_main.jpg"
						style="width: 130px; height: 35px; margin-left:60px"></a>
				</div>				
				<div class="span2">
					<a href="/khhospital/control?cmd=LOGOUT"><img src="/khhospital/design/images/logout.jpg"
						style="width: 130px; height: 35px ; margin-left:50px"></a>
				</div>
			</div>
		</div>

		<!-- ���м� -->
		<div class="container">
			<div class="row">
				<div class="span12">
					<hr style="border: 3px solid #26699e" />
				</div>
			</div>
		</div>


		<!-- ���θ޴� -->
		
		<!-- �ܰ� �ǻ� ���� -->
		<c:if test="${sessionScope.dept_num == 1}">		
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="nav nav-tabs">
							<li class="span4"><a href="/khhospital/control?cmd=DOCSURGQBOARDMAIN">�ܰ� �¶�������</a></li>
							<li class="span4"><a href="/khhospital/control?cmd=COUNSEL">�ǽð� ���</a></li>		
							<li class="span4"><a href="/khhospital/control?cmd=MYWORK&now_month=${now_month}&now_year=${now_year}">���� ��������</a></li>
						</ul>			
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- ���� �ǻ� ���� -->
		<c:if test="${sessionScope.dept_num == 2}">		
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="nav nav-tabs">
							<li class="span4"><a href="/khhospital/control?cmd=DOCINTERQBOARDMAIN">���� �¶�������</a></li>
							<li class="span4"><a href="/khhospital/control?cmd=COUNSEL">�ǽð� ���</a></li>		
							<li class="span4"><a href="/khhospital/control?cmd=MYWORK&now_month=${now_month}&now_year=${now_year}">���� ��������</a></li>
						</ul>			
					</div>
				</div>
			</div>
		</c:if>

	<!-- ġ�� �ǻ� ���� -->
		<c:if test="${sessionScope.dept_num == 3}">		
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="nav nav-tabs">
							<li class="span4"><a href="/khhospital/control?cmd=DOCDENTQBOARDMAIN">ġ�� �¶�������</a></li>
							<li class="span4"><a href="/khhospital/control?cmd=COUNSEL">�ǽð� ���</a></li>		
							<li class="span4"><a href="/khhospital/control?cmd=MYWORK&now_month=${now_month}&now_year=${now_year}">���� ��������</a></li>
						</ul>			
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- �Ǻΰ� �ǻ� ���� -->
		<c:if test="${sessionScope.dept_num == 4}">		
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="nav nav-tabs">
							<li class="span4"><a href="/khhospital/control?cmd=DOCSKINQBOARDMAIN">�Ǻΰ� �¶�������</a></li>
							<li class="span4"><a href="/khhospital/control?cmd=COUNSEL">�ǽð� ���</a></li>		
							<li class="span4"><a href="/khhospital/control?cmd=MYWORK&now_month=${now_month}&now_year=${now_year}">���� ��������</a></li>
						</ul>			
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- �Ȱ� �ǻ� ���� -->
		<c:if test="${sessionScope.dept_num == 5}">		
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="nav nav-tabs">
							<li class="span4"><a href="/khhospital/control?cmd=DOCOPTIQBOARDMAIN">�Ȱ� �¶�������</a></li>
							<li class="span4"><a href="/khhospital/control?cmd=COUNSEL">�ǽð� ���</a></li>		
							<li class="span4"><a href="/khhospital/control?cmd=MYWORK&now_month=${now_month}&now_year=${now_year}">���� ��������</a></li>
						</ul>			
					</div>
				</div>
			</div>
		</c:if>
		
		<!-- �Ű�� �ǻ� ���� -->
		<c:if test="${sessionScope.dept_num == 6}">		
			<div class="container">
				<div class="row">
					<div class="span12">
						<ul class="nav nav-tabs">
							<li class="span4"><a href="/khhospital/control?cmd=DOCPSYQBOARDMAIN">�Ű�� �¶�������</a></li>
							<li class="span4"><a href="/khhospital/control?cmd=COUNSEL">�ǽð� ���</a></li>		
							<li class="span4"><a href="/khhospital/control?cmd=MYWORK&now_month=${now_month}&now_year=${now_year}">���� ��������</a></li>
						</ul>			
					</div>
				</div>
			</div>
		</c:if>
	</header>
</body>
</html>