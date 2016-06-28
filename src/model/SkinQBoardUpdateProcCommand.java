/*	피부과 온라인질문 게시판 글수정 페이지에서 수정한 후에 보내주는 자료를 DB연결 후 수정한다.
 * 	작업이 끝나면 본인이 수정한 글 화면으로 다시 돌려보낸다.
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

public class SkinQBoardUpdateProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public SkinQBoardUpdateProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("SkinQBoardUpdateProcCommand : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		bean.BoardDto board = new bean.BoardDto();							
		
		board.setTitle(req.getParameter("title"));
		board.setContent(req.getParameter("content"));	
		board.setName(req.getParameter("name"));	
		board.setPass(req.getParameter("password"));		
		int num = Integer.parseInt(req.getParameter("num"));		
				
		try {
			con = pool.getConnection();
										
			String sql = "update QBoard_skin set qb_title_skin=?,qb_content_skin=?,qb_name_skin=?,qb_pass_skin=? where qb_num_skin=" + num;
			stmt = con.prepareStatement(sql);
		    stmt.setString(1, board.getTitle());
		    stmt.setString(2, board.getContent());	        
		    stmt.setString(3, board.getName());	        
		    stmt.setString(4, board.getPass()); 

		    stmt.executeUpdate(); 
		      
		} 
		catch (Exception e) {			
			System.out.println("SkinQBoardUpdateProcCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt);
		}		
	
		return "/control?cmd=SKINQBOARDREAD&num="+num;
	}

}
