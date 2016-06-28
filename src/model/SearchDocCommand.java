package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchDocCommand implements Command {

	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String check = req.getParameter("check");
		req.setAttribute("check", check);
		
		if(check.equals("SEARCHWORK")){
			return "/design/main/search_doc.jsp";
		}else if(check.equals("RESERVE")){
			return "/design/main/search_doc.jsp";
		}else{
			return "/design/mgr/search_doc.jsp";
		}
	}

}
