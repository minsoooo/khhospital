package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;

public class RegiDeleteProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public RegiDeleteProcCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("RegiDeleteProcCommand DB¿¬°á : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		String sql = "delete from patient_info where pat_id='" + id + "'";

		try {	
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
				
		} catch (Exception err) {
			System.out.println("deletePatient : " + err);
		} finally {
			pool.freeConnection(con, stmt);
		}
		
		session.invalidate();
		
		return "/design/main/regi_delete_proc.jsp";
	}

}
