

package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;

public class MgrNoticeBoardDeleteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MgrNoticeBoardDeleteProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrNoticeBoardDeleteProcCommand : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));		
		
		try {
			String sql = "delete from NBoard_main where nb_num_main=" + num;
							
			con = pool.getConnection();
			stmt =  con.prepareStatement(sql);
			stmt.executeUpdate();
		}
			
		catch (Exception e) {			
			System.out.println("MgrNoticeBoardDeleteCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt);
		}
		return "/control?cmd=MGRNOTICEBOARDMAIN&mgr=true";
	}
}
