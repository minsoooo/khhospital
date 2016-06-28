package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;

public class RegiUpdateProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public RegiUpdateProcCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("RegiUpdateProcCommand DB¿¬°á : " + err);
		}
	}
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pass = req.getParameter("pass2");
		String phone = req.getParameter("phone1") + "-" + req.getParameter("phone2") + "-" + req.getParameter("phone3");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String question = req.getParameter("question");
		String answer = req.getParameter("answer");
		String addr = req.getParameter("addr1") + "," + req.getParameter("addr2") + "," + req.getParameter("addr3");
		
		try {			
			con = pool.getConnection();
			String sql = "update patient_info set pat_pass=?, pat_phone=?, pat_email=?, pat_question=?, pat_answer=?, pat_addr=? where pat_id='" + id + "'";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, pass);
			stmt.setString(2, phone);
			stmt.setString(3, email);
			stmt.setString(4, question);
			stmt.setString(5, answer);
			stmt.setString(6, addr);
			
			stmt.executeUpdate();
		
		} catch (Exception err) {
			System.out.println("updatePatient : " + err);
		} finally {
			pool.freeConnection(con, stmt);
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("pass", pass);
		
		return "/design/main/index.jsp";
	}
}
