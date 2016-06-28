/*	피부과 온라인질문 게시판 글목록에서 하나의 글을 눌렀을 때
 * 	누른 글의 번호를 받고, isRead를 받아서, true이면 조회수를 1 증가시킨다.
 *  전달받은 글 번호에 해당하는 자료를 DB에 연결해서 꺼내고
 *  전달받은 글 번호에 해당하는 댓글자료를 DB에 연결해서 꺼내고
 *  해당 작업이 끝나면 출력화면으로 넘긴다.
 *  
 *  위에서 글 번호와 댓글번호는 따로 구성되어있다.
 *	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ReplyDto;


public class SkinQBoardReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public SkinQBoardReadCommand(){
		try{			
			pool = dbcp.DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("SkinQBoardReadCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		int num = Integer.parseInt(req.getParameter("num"));
		String isRead = req.getParameter("isRead");
		
		if(isRead == null){
			isRead = "false";
		}
				
		String sql = "select * from QBoard_skin where qb_num_skin=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
		
		try {
			con = pool.getConnection();
			
			if(isRead.equals("true")){	
				String upSql = "update QBoard_skin set qb_count_skin=qb_count_skin+1 where qb_num_skin=" + num;
				stmt = con.prepareStatement(upSql);
				stmt.executeUpdate();
			}			
						
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("qb_num_skin"));
				rdto.setName(rs.getString("qb_name_skin"));				
				rdto.setPass(rs.getString("qb_pass_skin"));
				rdto.setTitle(rs.getString("qb_title_skin"));
				rdto.setContent(rs.getString("qb_content_skin"));
				rdto.setIp(rs.getString("qb_ip_skin"));
				rdto.setRegdate(rs.getString("qb_regdate_skin"));
				rdto.setCount(rs.getInt("qb_count_skin"));
				rdto.setPos(rs.getInt("qb_pos_skin"));
				rdto.setDepth(rs.getInt("qb_depth_skin"));
				rdto.setFamily(rs.getInt("qb_family_skin"));				
			}
		} 
		catch (Exception e) {			
			System.out.println("SkinQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);
		
		
		Vector<ReplyDto> revec = new Vector<ReplyDto>();
		ReplyDto redto = null;
		try {
			sql = "select * from QBoard_skin_Reply where qb_num_skin=" + num;
						
			con = pool.getConnection();									
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();
			
			while(rs.next()){
				redto = new ReplyDto();
				
				redto.setReplydate(rs.getString("qb_replyregdate_skin"));	
				redto.setReplyid(rs.getString("qb_replyid_skin"));
				redto.setReplypass(rs.getString("qb_replypass_skin"));				
				redto.setReplycontent(rs.getString("qb_replycontent_skin"));	
				redto.setReplynum(rs.getInt("qb_replynum_skin"));
				redto.setNum(rs.getInt("qb_num_skin"));
				
				revec.add(redto);	
			}
		}
		
		catch (Exception e) {			
			System.out.println("SkinQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("revec", revec);
				
		return "/design/dept/skin/skin_question_read.jsp";
		
	}

}
