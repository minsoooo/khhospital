package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegiCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String check = req.getParameter("check");
		if(check.equals("first")){
			return "/design/main/regi_first.jsp";			
		}else if (check.equals("second")){
			return "/design/main/regi_second.jsp";
		}
		return null;
	}
}
