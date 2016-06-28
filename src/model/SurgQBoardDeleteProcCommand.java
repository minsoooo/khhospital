 /*	외과 온라인질문 글 삭제 
 * 	글 삭제 비밀번호와 번호를 받아서 입력된 DB의 비밀번호와 일치한다면 연결한뒤 삭제한다.
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

public class SurgQBoardDeleteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public SurgQBoardDeleteProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("SurgQBoardDeleteProcCommand : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		String realpass = req.getParameter("realpass");
		String userpass = req.getParameter("userpass");		
		String url = "";
				
		if(realpass.equals(userpass)){
			try {
				String sql = "delete from QBoard_surg where qb_num_surg=" + num;
							
				con = pool.getConnection();
			    stmt =  con.prepareStatement(sql);
			    stmt.executeUpdate();
			}
			
			catch (Exception e) {			
				System.out.println("SurgQBoardDeleteCommand : " + e);
			}
			finally{
				 pool.freeConnection(con,stmt);
			}
			
			url = "/control?cmd=SURGQBOARDMAIN&nowPage=0&nowBlock=0";
		}
		
		else{
			url = "/control?cmd=SURGQBOARDERROR&num="+num;
		}
		
		return url;
	}

}
