/*	치과 온라인질문 글을 눌렀을 때
 * 	보이는 댓글을 추가하는 페이지 
 *  해당 작업이 끝나면 원래 있던 화면으로 돌아간다.
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
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;

public class DocDentQBoardReplyProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public DocDentQBoardReplyProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DocDentQBoardReplyProcCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));		
		
		bean.ReplyDto redto = null;
				
		try {
			
			redto = new bean.ReplyDto();
			redto.setReplyip(req.getParameter("replyip"));
			redto.setReplyid(req.getParameter("replyid"));
			redto.setReplypass(req.getParameter("replypass"));
			redto.setReplycontent(req.getParameter("replycontent"));
			redto.setNum(num);
			
			con = pool.getConnection();
			
			String sql = "insert into QBoard_dent_Reply(qb_replyregdate_dent,qb_replyip_dent,qb_replyid_dent,qb_replypass_dent,"
					+ "qb_replycontent_dent,qb_num_dent) values(now(),?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, redto.getReplyip());
	        stmt.setString(2, redto.getReplyid());
	        stmt.setString(3, redto.getReplypass());
	        stmt.setString(4, redto.getReplycontent());
	        stmt.setInt(5, redto.getNum());

	        stmt.executeUpdate();
	         
		} 
		catch (Exception e) {			
			System.out.println("DocDentQBoardReplyProcCommand : " + e);
		}
		finally{
	    	  pool.freeConnection(con,stmt);
		}
		
		return "/control?cmd=DOCDENTQBOARDREAD&num="+num;
	}
}
