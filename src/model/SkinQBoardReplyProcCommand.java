/*	피부과 온라인질문 게시판 글을 눌렀을 때
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

public class SkinQBoardReplyProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public SkinQBoardReplyProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("SkinQBoardReplyProcCommand : " + err);
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
			
			String sql = "insert into QBoard_skin_Reply(qb_replyregdate_skin,qb_replyip_skin,qb_replyid_skin,qb_replypass_skin,"
					+ "qb_replycontent_skin,qb_num_skin) values(now(),?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, redto.getReplyip());
	        stmt.setString(2, redto.getReplyid());
	        stmt.setString(3, redto.getReplypass());
	        stmt.setString(4, redto.getReplycontent());
	        stmt.setInt(5, redto.getNum());

	        stmt.executeUpdate();
	         
		} 
		catch (Exception e) {			
			System.out.println("SkinQBoardReplyProcCommand : " + e);
		}
		finally{
	    	  pool.freeConnection(con,stmt);
		}
		
		return "/control?cmd=SKINQBOARDREAD&num="+num;
	}
}
