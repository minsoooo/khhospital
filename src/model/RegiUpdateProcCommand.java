/*
 *  	작성자 : 양진원	
 *      작성일 : 2016-06-18
 *      설명 : 환자 정보 수정 커맨드.
 *      
 *      수정자 : 박민수
 *      수정일 : 2016-07-04
 *      설명 : 암호 MD5 알고리즘 사용.
 * 		
 * 		수정자 : 박민수
 * 		수정일 : 2016-07-13
 * 		설명 : 환자level 별로 업데이트 내용 구분해주기;
 * 
 */


package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CipherDao;
import dbcp.DBConnectionMgr;

public class RegiUpdateProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public RegiUpdateProcCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("RegiUpdateProcCommand DB에러 : " + err);
		}
	}
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		CipherDao cipher = new CipherDao();
		String pat_level = req.getParameter("pat_level");
		String sql = "";
		String id = req.getParameter("id");
		String pass = req.getParameter("pass2");
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		
		String passMD5 = cipher.getMD5(pass);
		try {
			con = pool.getConnection();
			if(pat_level.equals("2")){
				String phone = req.getParameter("phone1") + "-" + req.getParameter("phone2") + "-" + req.getParameter("phone3");
				String addr = req.getParameter("addr1") + "," + req.getParameter("addr2") + "," + req.getParameter("addr3");
				sql = "update patient_info set pat_pass=?, pat_phone=?, pat_email=?, pat_addr=? where pat_id=?" ;
				stmt = con.prepareStatement(sql);
				stmt.setString(1, passMD5);
				stmt.setString(2, phone);
				stmt.setString(3, email);
				stmt.setString(4, addr);
				stmt.setString(5, id);
			}else{
				sql = "update patient_info set pat_pass=?, pat_email=? where pat_id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, passMD5);
				stmt.setString(2, email);
				stmt.setString(3, id);
			}
			stmt.executeUpdate();
		
		} catch (Exception err) {
			System.out.println("updatePatient : " + err);
		} finally {
			pool.freeConnection(con, stmt);
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("pass", passMD5);
		
		return "/design/main/index.jsp";
	}
}
