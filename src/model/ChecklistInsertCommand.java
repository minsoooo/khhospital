package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;

public class ChecklistInsertCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public ChecklistInsertCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("ChecklistInsertCommand DB연결 : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		try {			
			con = pool.getConnection();
			String sql = "insert into patient_checklist(pat_id, check1, check2, check3, check4, check5, check6, check7,"
					+ " check8, check9, check10, check11, check12, check13, check14, check15, check16, check17,"
					+ " check18, check19, check20) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, id);			
			for(int i = 1; i <= 20; i++){
				String check ="check"+i;
				stmt.setString(i+1, req.getParameter(check));
			}
			
			stmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("ChecklistInsert : " + err);
		} finally {
			pool.freeConnection(con, stmt);
		}
		
		return "/design/main/go_step1.jsp";
	}

}
