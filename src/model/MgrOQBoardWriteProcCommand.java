 /*	자주하는 질문 관리자모드 글 쓰기를 눌렀을 때 
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

public class MgrOQBoardWriteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public MgrOQBoardWriteProcCommand(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrOQBoardWriteProcCommand : " + err);
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
			
			String sql = "insert into OQBoard_main(oqb_name_main,oqb_title_main,oqb_content_main,oqb_ip_main,oqb_regdate_main,"
					+ "oqb_count_main) values(?,?,?,?,now(),?)";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, board.getName());
	        stmt.setString(2, board.getTitle());
	        stmt.setString(3, board.getContent());
	        stmt.setString(4, board.getIp());            
	        stmt.setInt(5, board.getCount());	       

	        stmt.executeUpdate();
	         
		} 
		catch (Exception e) {			
			System.out.println("MgrOQBoardWriteProcCommand : " + e);
		}
		finally{
	    	  pool.freeConnection(con,stmt);
		}		
		
		return "/control?cmd=MGROQBOARDMAIN&mgr=true";
		
	}

}
