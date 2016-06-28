
package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;

public class MgrNoticeBoardWriteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public MgrNoticeBoardWriteProcCommand(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrNoticeBoardWriteProcCommand : " + err);
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
			
			String sql = "insert into NBoard_main(nb_name_main,nb_title_main,nb_content_main,nb_ip_main,nb_regdate_main,"
					+ "nb_count_main) values(?,?,?,?,now(),?)";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, board.getName());
	        stmt.setString(2, board.getTitle());
	        stmt.setString(3, board.getContent());
	        stmt.setString(4, board.getIp());            
	        stmt.setInt(5, board.getCount());	       

	        stmt.executeUpdate();
	         
		} 
		catch (Exception e) {			
			System.out.println("MgrNoticeBoardWriteProcCommand : " + e);
		}
		finally{
	    	  pool.freeConnection(con,stmt);
		}		
		
		return "/control?cmd=MGRNOTICEBOARDMAIN&mgr=true";
		
	}

}
