/*	자주하는 질문 관리자모드 글 삭제  DB연결부분
 * 	작성 글 번호를 전달받은 후, 번호로 삭제하고 원래 글 목록으로 돌아간다.
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

public class MgrOQBoardDeleteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MgrOQBoardDeleteProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrOQBoardDeleteProcCommand : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));		
		
		try {
			String sql = "delete from OQBoard_main where oqb_num_main=" + num;
							
			con = pool.getConnection();
			stmt =  con.prepareStatement(sql);
			stmt.executeUpdate();
		}
			
		catch (Exception e) {			
			System.out.println("MgrOQBoardDeleteCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt);
		}
		return "/control?cmd=MGROQBOARDMAIN&mgr=true";
	}
}
