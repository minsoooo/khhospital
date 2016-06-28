package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptIndexCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		String dept = req.getParameter("dept");
		
		if(dept.equals("SURG")){
			return "/design/dept/surgery/surg_index.jsp";
		}
		else if(dept.equals("INTER")){
			return "/design/dept/internal/inter_index.jsp";
		}
		else if(dept.equals("OPTI")){
			return "/design/dept/opti/opti_index.jsp";
		}
		else if(dept.equals("DENT")){
			return "/design/dept/dent/dent_index.jsp";
		}
		else if(dept.equals("SKIN")){
			return "/design/dept/skin/skin_index.jsp";
		}
		else if(dept.equals("PSY")){
			return "/design/dept/psy/psy_index.jsp";
		}

		return null;
	}

}
