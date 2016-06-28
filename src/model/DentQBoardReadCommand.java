/*	치과 온라인질문 글목록에서 하나의 글을 눌렀을 때
 * 	누른 글의 번호를 받고, isRead를 받아서, true이면 조회수를 1 증가시킨다.
 *  전달받은 글 번호에 해당하는 자료를 DB에 연결해서 꺼내고
 *  전달받은 글 번호에 해당하는 댓글자료를 DB에 연결해서 꺼내고
 *  해당 작업이 끝나면 출력화면으로 넘긴다.
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


public class DentQBoardReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public DentQBoardReadCommand(){
		try{			
			pool = dbcp.DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DentQBoardReadCommand : " + err);
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
		
		 // isRead가 true라면 카운트증가 , 아니라면 "" 부여, isRead 여부에 상관없이 글 내용은 꺼내온다.
		
		String sql = "select * from QBoard_dent where qb_num_dent=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
		
		try {
			con = pool.getConnection();
			
			if(isRead.equals("true")){	
				String upSql = "update QBoard_dent set qb_count_dent=qb_count_dent+1 where qb_num_dent=" + num;
				stmt = con.prepareStatement(upSql);
				stmt.executeUpdate();
			}			
						
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("qb_num_dent"));
				rdto.setName(rs.getString("qb_name_dent"));				
				rdto.setPass(rs.getString("qb_pass_dent"));
				rdto.setTitle(rs.getString("qb_title_dent"));
				rdto.setContent(rs.getString("qb_content_dent"));
				rdto.setIp(rs.getString("qb_ip_dent"));
				rdto.setRegdate(rs.getString("qb_regdate_dent"));
				rdto.setCount(rs.getInt("qb_count_dent"));
				rdto.setPos(rs.getInt("qb_pos_dent"));
				rdto.setDepth(rs.getInt("qb_depth_dent"));
				rdto.setFamily(rs.getInt("qb_family_dent"));				
			}
		} 
		catch (Exception e) {			
			System.out.println("DentQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);
		
		// 댓글 목록을 전부 하나씩 꺼내서 DTO처리하고, 그 DTO를 전부 벡터에 담아서 출력부분으로 전송한다.
		
		
		Vector<ReplyDto> revec = new Vector<ReplyDto>();
		ReplyDto redto = null;
		try {
			sql = "select * from QBoard_dent_Reply where qb_num_dent=" + num;
						
			con = pool.getConnection();									
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();
			
			while(rs.next()){
				redto = new ReplyDto();
				
				redto.setReplydate(rs.getString("qb_replyregdate_dent"));	
				redto.setReplyid(rs.getString("qb_replyid_dent"));
				redto.setReplypass(rs.getString("qb_replypass_dent"));				
				redto.setReplycontent(rs.getString("qb_replycontent_dent"));	
				redto.setReplynum(rs.getInt("qb_replynum_dent"));
				redto.setNum(rs.getInt("qb_num_dent"));
				
				revec.add(redto);	
			}
		}
		
		catch (Exception e) {			
			System.out.println("DentQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("revec", revec);
				
		return "/design/dept/dent/dent_question_read.jsp";
		
	}

}
