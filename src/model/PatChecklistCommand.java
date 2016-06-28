package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;

public class PatChecklistCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public PatChecklistCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("PatChecklistCommand DB연결 : " + err);
		}
	}
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		String pat_id = (String)req.getParameter("pat_id");		// 상담할 환자의 ID를 가져옴
		String[] checklist = new String[20]; 	// 해당 환자의 checklist를 불러와서 담을 공간
		try {			
			String sql = "select * from patient_checklist where pat_id='" + pat_id + "'";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()){		// 환자가 자가진단을 했을 경우 
				for(int i = 0; i < checklist.length; i++){
					checklist[i] = rs.getString("check" + (i+1));
				}
				req.setAttribute("checklist", checklist);
			}

		} catch (Exception err) {
			System.out.println("patChecklist : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
	
		req.setAttribute("pat_id", pat_id);
		
		
		return "/design/doctor/pat_checklist.jsp";
	}
}
