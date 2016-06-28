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
		String question = req.getParameter("question");
		String answer = req.getParameter("answer");
		
		SearchPass searchPass = new SearchPass();
		String pass = searchPass.searchPass(id, question, answer);
		
		req.setAttribute("pass", pass);
		
		return "/design/main/search_pass_proc.jsp";
	}

}
