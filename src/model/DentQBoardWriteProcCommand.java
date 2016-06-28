/*	치과 온라인질문 글 쓰기를 눌렀을 때 
 *  입력받은 내용을 DB에 연결하고 입력한후에 글 목록으로 돌려보낸다.
 * 	작성자 - 백규하
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

public class DentQBoardWriteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public DentQBoardWriteProcCommand(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DentQBoardWriteProcCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		bean.BoardDto board = new bean.BoardDto();
		
		board.setIp(req.getParameter("ip"));
		board.setName(req.getParameter("name"));	
		board.setPass(req.getParameter("password"));
		board.setTitle(req.getParameter("title"));
		board.setContent(req.getParameter("content"));		
				
		try {			
			con = pool.getConnection();			
			
			String sql = "insert into QBoard_dent(qb_name_dent,qb_pass_dent,qb_title_dent,qb_content_dent,qb_ip_dent,qb_regdate_dent,"
					+ "qb_count_dent,qb_pos_dent,qb_family_dent,qb_depth_dent) values(?,?,?,?,?,now(),?,?,?,?)";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, board.getName());   
			stmt.setString(2, board.getPass());
	        stmt.setString(3, board.getTitle());
	        stmt.setString(4, board.getContent());
	        stmt.setString(5, board.getIp());            
	        stmt.setInt(6, board.getCount());
	        stmt.setInt(7, 0);
	        stmt.setInt(8, 0);
	        stmt.setInt(9, 0);

	        stmt.executeUpdate();
	         
		} 
		catch (Exception e) {			
			System.out.println("DentQBoardWriteProcCommand : " + e);
		}
		finally{
	    	  pool.freeConnection(con,stmt);
		}		
		
		return "/control?cmd=DENTQBOARDMAIN";
		
	}

}
