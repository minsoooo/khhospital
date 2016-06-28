package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SearchId;

public class SearchIdProcCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String social = req.getParameter("social1") +"-"+req.getParameter("social2");

		SearchId searchId = new SearchId();
		String id = searchId.searchId(email, social);
		
		req.setAttribute("id", id);
		
		return "/design/main/search_id_proc.jsp";
	}

}
