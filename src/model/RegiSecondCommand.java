/*
 * 작성자 : 박민수
 * 작성일 : 2016-07-12
 * 설명 : 추가 정보 입력 커맨드 
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

import dbcp.DBConnectionMgr;

public class RegiSecondCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public RegiSecondCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("RegiSecondCommand DB에러 : " + err);
		}
	}
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String check2 = "";
		String pat_num = req.getParameter("pat_num");
		String name = req.getParameter("name");
		String social = req.getParameter("social1")+"-"+req.getParameter("social2");
		String addr = req.getParameter("addr1")+","+req.getParameter("addr2")+","+req.getParameter("addr3");
		String phone = req.getParameter("phone1")+"-"+req.getParameter("phone2")+"-"+req.getParameter("phone3");
		// MD5 알고리즘으로 암호화

	
		
			try {			
				con = pool.getConnection();
				String sql = "update patient_info set pat_name=?, pat_social=?, pat_addr=?,pat_level=?,pat_phone=? where pat_num="+pat_num;
				stmt = con.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, social);
				stmt.setString(3, addr);
				stmt.setString(4, "2");
				stmt.setString(5, phone);
				stmt.executeUpdate();
				
				check2 ="true";
			} catch (Exception err) {
				System.out.println("regiSecondPatient : " + err);
			} finally {
				pool.freeConnection(con, stmt);
			}
			req.setAttribute("check2", check2);
		return "/design/main/regi_proc.jsp";
	}
}
