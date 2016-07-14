/*
 * 작성자: 박민수
 * 작성일 : 2016-07-11
 * 설명 : ajax로 메일인증 코드를 보내기.
 * 		host, port, hostMail, hostPass 는 naver로 설정// 추후 DB연동 예정. 
 * 
 */
package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CipherDao;
import bean.MailSendDao;

public class MailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/xml");
		resp.setHeader("Cache-control", "no-cache");	
		CipherDao cipher = new CipherDao();
		MailSendDao sender = new MailSendDao();
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		//받는사람 메일 주소 
		String recipient = email1+"@"+email2;
		String newCode = cipher.getNewCode();
		String title ="메일인증 코드입니다.";
		String content = "당신의 메일인증 코드는" + newCode +"입니다. 정확히 입력해 주세요!";
		sender.setProperty("smtp.naver.com", 465, "altntaos@naver.com", "als136512403!");
		sender.sendMail(recipient, title, content);
		
		PrintWriter out = resp.getWriter();
		
		out.println("<response>");
		out.println("<code>"+newCode+"</code>");
		out.println("</response>");	
		out.close();
		
	}

}
