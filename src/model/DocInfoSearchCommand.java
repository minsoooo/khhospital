package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;

public class DocInfoSearchCommand implements Command {
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String where =req.getParameter("where");
		req.setAttribute("where", where);
		if(where.equals("surg")){
			return "/control?cmd=DOCINFODEPT&dept_no=1";
		}else if(where.equals("inter")){
			return "/control?cmd=DOCINFODEPT&dept_no=2";
		}else if(where.equals("opti")){
			return "/control?cmd=DOCINFODEPT&dept_no=5";
		}else if(where.equals("psy")){
			return "/control?cmd=DOCINFODEPT&dept_no=6";
		}else if(where.equals("skin")){
			return "/control?cmd=DOCINFODEPT&dept_no=4&where=skin";
		}else if(where.equals("dent")){
			return "/control?cmd=DOCINFODEPT&dept_no=3";
		}else{		
			return "/design/main/doc_info_search.jsp";
		}
		
	}

}
