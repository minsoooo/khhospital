/*	병원 소식  관리자모드  글 수정  연결 부분
 * 	수정 버튼 클릭시 , 글번호를 들고 번호에 해당하는 DB 자료를 뽑아서 
 *  다시 수정하는 페이지로 이동하게해준다.
 *	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;

public class MgrMedicalNewsBoardUpdateCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	
	public  MgrMedicalNewsBoardUpdateCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrMedicalNewsBoardUpdateCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));		
		
		String sql = "select * from NewsBoard_medical where newsb_num_medical=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
			
		try {
			con = pool.getConnection();			
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("newsb_num_medical"));
				rdto.setName(rs.getString("newsb_name_medical"));				
				rdto.setTitle(rs.getString("newsb_title_medical"));
				rdto.setContent(rs.getString("newsb_content_medical"));				
				rdto.setCount(rs.getInt("newsb_count_medical"));
				rdto.setIp(rs.getString("newsb_ip_medical"));
				rdto.setRegdate(rs.getString("newsb_regdate_medical"));			
			}
		} 
		catch (Exception e) {			
			System.out.println("MgrMedicalNewsBoardUpdateCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);				
		
		return "/design/mgr/mgr_medical_news_update_proc.jsp";
	}
}
