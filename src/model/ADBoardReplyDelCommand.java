/*	간병인을 구합니다 글을 눌렀을 때
 * 	보이는 댓글을 삭제하는 페이지
 *  DB에 저장된 댓글의 비밀번호와 다르다면 에러페이지로 이동하고,
 *  비밀번호가 일치한다면 같이 전달받은 댓글 번호에 해당하는 자료를 DB에 연결해서 삭제한다.  
 *  해당 작업이 끝나면 원래 있던 화면으로 돌아간다.
 *	작성자 - 백규하
 *	작성일 - 2016-06-15
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

public class ADBoardReplyDelCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public ADBoardReplyDelCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("ADBoardReplyDelCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));		
		int replynum = Integer.parseInt(req.getParameter("replynum"));		
		String userpass = req.getParameter("userpass");
		String replypass = req.getParameter("replypass");
		String url = "";
			
		if(userpass.equals(replypass)){
			try {
				String sql = "delete from AdBoard_main_Reply where adb_replynum_main=" + replynum;
							
				con = pool.getConnection();
			    stmt =  con.prepareStatement(sql);
			    stmt.executeUpdate();
			}
			
			catch (Exception e) {			
				System.out.println("ADBoardReplyDelCommand : " + e);
			}
			finally{
				 pool.freeConnection(con,stmt);
			}
			
			url = "/control?cmd=ADBOARDREAD&num="+num;		
		}		
		
		else{
			url = "/control?cmd=ADBOARDERROR&num="+num;
		}
		
		return url;
		
	}

}
