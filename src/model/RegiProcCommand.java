/*
 * 	 작성자 : 양진원
 * 	 작성일 : 2016-06-18
 * 	 설명 : 환자 정보를 입력 받아 디비에 입력 
 * 	 
 * 	 수정자 : 박민수
 * 	 수정일 : 2016-06-29
 * 	 설명 : 유저 password를 MD5로 암호화 하는 코드 추가.
 * 
 * 
 */

package model;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CipherDao;
import dbcp.DBConnectionMgr;

public class RegiProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	
	public RegiProcCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("RegiProcCommand DB에러 : " + err);
		}
	}
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String pat_num = "";
		String check = req.getParameter("check");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass2");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		// MD5 알고리즘으로 암호화
		CipherDao cipher = new CipherDao();
		String passMD5 =cipher.getMD5(pass);
	
		if(check.equals("true")){
			try {			
				con = pool.getConnection();
				String sql = "insert into patient_info( pat_id, pat_pass, pat_email,pat_level) values(?,?,?,?)";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, passMD5);
				stmt.setString(3, email);
				stmt.setString(4, "1");
				stmt.executeUpdate();
				
				sql ="select pat_num from patient_info where pat_id='"+id+"'";
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				rs.next();
				pat_num = Integer.toString(rs.getInt("pat_num"));
			} catch (Exception err) {
				System.out.println("insertPatient : " + err);
			} finally {
				pool.freeConnection(con, stmt);
			}
		}
		HttpSession session = req.getSession();
		session.setAttribute("pat_num", pat_num);
		req.setAttribute("check", check);
		return "/design/main/regi_proc.jsp";
	}
}
