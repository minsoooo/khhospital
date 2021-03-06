/*	공지사항 관리자모드 글 수정  연결 부분
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

public class MgrNoticeBoardUpdateCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	private ResultSet rs;
	
	public  MgrNoticeBoardUpdateCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrNoticeBoardUpdateCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));		
		
		String sql = "select * from NBoard_main where nb_num_main=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
			
		try {
			con = pool.getConnection();			
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("nb_num_main"));
				rdto.setName(rs.getString("nb_name_main"));				
				rdto.setTitle(rs.getString("nb_title_main"));
				rdto.setContent(rs.getString("nb_content_main"));				
				rdto.setCount(rs.getInt("nb_count_main"));
				rdto.setIp(rs.getString("nb_ip_main"));
				rdto.setRegdate(rs.getString("nb_regdate_main"));			
			}
		} 
		catch (Exception e) {			
			System.out.println("MgrNoticeBoardUpdateCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);				
		
		return "/design/mgr/mgr_notice_update_proc.jsp";
	}
}
