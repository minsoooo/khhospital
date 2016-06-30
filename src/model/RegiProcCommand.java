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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
		String check = req.getParameter("check");
		
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass2");
		String addr = req.getParameter("addr1") + "," + req.getParameter("addr2") + "," + req.getParameter("addr3");
		String phone = req.getParameter("phone1") + "-" + req.getParameter("phone2") + "-" + req.getParameter("phone3");
		String social = req.getParameter("social1") + "-" + req.getParameter("social2");
		String question = req.getParameter("question");
		String answer = req.getParameter("answer");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		// MD5 알고리즘으로 암호화
		CipherDao cipher = new CipherDao();
		String passMD5 =cipher.getMD5(pass);
	
		if(check.equals("true")){
			try {			
				con = pool.getConnection();
				String sql = "insert into patient_info(pat_name, pat_id, pat_pass, pat_addr, pat_phone, pat_social, pat_question, pat_answer, pat_email) values(?,?,?,?,?,?,?,?,?)";
				stmt = con.prepareStatement(sql);
				
				stmt.setString(1, name);
				stmt.setString(2, id);
				stmt.setString(3, passMD5);
				stmt.setString(4, addr);
				stmt.setString(5, phone);
				stmt.setString(6, social);
				stmt.setString(7, question);
				stmt.setString(8, answer);
				stmt.setString(9, email);
				
				stmt.executeUpdate();

			} catch (Exception err) {
				System.out.println("insertPatient : " + err);
			} finally {
				pool.freeConnection(con, stmt);
			}
		}
		
		req.setAttribute("check", check);
		return "/design/main/regi_proc.jsp";
	}
}
