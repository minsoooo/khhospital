/*
 *  작성자 : 박민수
 *  작성일 : 2016-06-17
 *  설명 : 환자 예약 정보 삭제 커맨드
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

import dbcp.DBConnectionMgr;

public class ReserveDelCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool = null;
	
	
	public ReserveDelCommand(){
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

				req.setCharacterEncoding("euc-kr");
				resp.setCharacterEncoding("euc-kr");
				String res_num = req.getParameter("res_num");
				String sql = "delete from reservation where res_num =?";
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					stmt.setString(1, res_num);
					stmt.executeUpdate();
					req.setAttribute("delCheck", "success");
				}catch(Exception err){
					err.printStackTrace();
				}finally{
					pool.freeConnection(con, stmt);
				}
					
		
				return "/control?cmd=MYRESERVE";
				
		}

}
