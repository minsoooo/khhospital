package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SearchPass;

public class SearchPassProcCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String email = req.getParameter("email1")+"@"+req.getParameter("email2");
		SearchPass searchPass = new SearchPass();
		String pass = searchPass.searchPass(id, email);
		
		req.setAttribute("pass", pass);
		
		return "/design/main/search_pass_proc.jsp";
	}

}
