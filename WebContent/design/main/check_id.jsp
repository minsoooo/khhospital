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
		<data>사용이 가능한 아이디입니다.</data>
		<result>true</result>
	</check>
<%
	}
	else if(check.equals("false") ){
%>
	<check>
		<data>이미 존재하는 아이디입니다!</data>
		<result>false</result>
	</check>
<%	
	}
	else{
%>
	<check>
		<data>아이디 형식을 맞춰주세요!</data>
		<result>false</result>
	</check>
<%
	}
%>
