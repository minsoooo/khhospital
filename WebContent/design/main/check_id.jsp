<?xml version="1.0" ?>
<%@page import="bean.CheckId"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	CheckId c = new CheckId();
	String id = request.getParameter("id");
	
	String check = c.checkId(id);
	
	if(check.equals("true") && id.length() >= 6 && id.length() <= 12){
%>
	<check>
		<data>����� ������ ���̵��Դϴ�.</data>
		<result>true</result>
	</check>
<%
	}
	else if(check.equals("false") ){
%>
	<check>
		<data>�̹� �����ϴ� ���̵��Դϴ�!</data>
		<result>false</result>
	</check>
<%	
	}
	else{
%>
	<check>
		<data>���̵� ������ �����ּ���!</data>
		<result>false</result>
	</check>
<%
	}
%>
