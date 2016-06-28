/*
 *   작성자 : 박민수 
 *   작성일 : 2016-06-18
 *   설명 : 채팅 구현을 위한 서블릿 페이지
 *        요청받은 아이디와 메세지를 dto를 통해 묶어서 처리하고 주기적 ajax 요청을 처리하여 xml 형태로 response 해준다.
 * 
 */
package model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MsgDto;

public class ChatServlet extends HttpServlet  {
	int cnt =0;
	 ArrayList<MsgDto> list = new ArrayList<MsgDto>();
	 
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
		String id =req.getParameter("id");
		String msg = req.getParameter("msg");
		String user = req.getParameter("user");
		PrintWriter out = resp.getWriter();
		//  msg가 입력 되야만 list에 담아서 사용한다.
		MsgDto dto = null; 
		if( !msg.equals("") && msg != null){
			cnt ++;
			dto = new MsgDto(Integer.toString(cnt),id,msg,user);		
			list.add(dto);
			if(msg.equals("수고하셨습니다.")){
				list.clear();
			}
		}	
			// xml 파일 출력 
			out.println("<response>");
			for(int i=0; i<list.size();i++){						
			out.println("<info><cnt>" + list.get(i).getCnt() +"</cnt><id>"+list.get(i).getId()+"</id><msg>"+list.get(i).getMsg()+ "</msg><user>"+list.get(i).getUser()+"</user></info>");			
			}
			out.println("</response>");	
			out.close();
	
	}
	
}