package model;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StartChatCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = req.getServletContext();
		application.setAttribute("online", "true");		// 의사가 상담을 시작하면 어플리케이션의 online속성을 true로 바꿈
		String pat = req.getParameter("pat");
		if(pat !=null){
			if(pat.equals("online")){
				application.setAttribute("online", "false");
			}	
		}
		return "/design/doctor/chatting.jsp";
	}

}
