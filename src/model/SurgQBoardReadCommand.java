
/*	외과 온라인질문 글목록에서 하나의 글을 눌렀을 때
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


public class SurgQBoardReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public SurgQBoardReadCommand(){
		try{			
			pool = dbcp.DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("SurgQBoardReadCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// 전송한 글번호, 키워드, 키필드를 저장한다. 받은 키워드와 키필드는 
		// request 처리해서 글내용으로 다시 돌아갔을 때 , 목록으로 돌아가기에 사용한다.
				
		int num = Integer.parseInt(req.getParameter("num"));
		String isRead = req.getParameter("isRead");
		String keyWord = req.getParameter("keyWord");
		String keyField = req.getParameter("keyField");
		
		req.setAttribute("keyWord", keyWord);
		req.setAttribute("keyField", keyField);
		
		if(isRead == null){
			isRead = "false";
		}
		
		// isRead가 true라면 카운트증가 , 아니라면 "" 부여, isRead 여부에 상관없이 글 내용은 꺼내온다.
				
		String sql = "select * from QBoard_surg where qb_num_surg=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
		
		try {
			con = pool.getConnection();
			
			if(isRead.equals("true")){	
				String upSql = "update QBoard_surg set qb_count_surg=qb_count_surg+1 where qb_num_surg=" + num;
				stmt = con.prepareStatement(upSql);
				stmt.executeUpdate();
			}			
						
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("qb_num_surg"));
				rdto.setName(rs.getString("qb_name_surg"));				
				rdto.setPass(rs.getString("qb_pass_surg"));
				rdto.setTitle(rs.getString("qb_title_surg"));
				rdto.setContent(rs.getString("qb_content_surg"));
				rdto.setIp(rs.getString("qb_ip_surg"));
				rdto.setRegdate(rs.getString("qb_regdate_surg"));
				rdto.setCount(rs.getInt("qb_count_surg"));
				rdto.setPos(rs.getInt("qb_pos_surg"));
				rdto.setDepth(rs.getInt("qb_depth_surg"));
				rdto.setFamily(rs.getInt("qb_family_surg"));				
			}
		} 
		catch (Exception e) {			
			System.out.println("SurgQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);
		
		// 댓글 목록을 전부 하나씩 꺼내서 DTO처리하고, 그 DTO를 전부 벡터에 담아서 출력부분으로 전송한다.
		
		Vector<ReplyDto> revec = new Vector<ReplyDto>();
		ReplyDto redto = null;
		try {
			sql = "select * from QBoard_surg_Reply where qb_num_surg=" + num;
						
			con = pool.getConnection();									
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();
			
			while(rs.next()){
				redto = new ReplyDto();
				
				redto.setReplydate(rs.getString("qb_replyregdate_surg"));	
				redto.setReplyid(rs.getString("qb_replyid_surg"));
				redto.setReplypass(rs.getString("qb_replypass_surg"));				
				redto.setReplycontent(rs.getString("qb_replycontent_surg"));	
				redto.setReplynum(rs.getInt("qb_replynum_surg"));
				redto.setNum(rs.getInt("qb_num_surg"));
				
				revec.add(redto);	
			}
		}
		
		catch (Exception e) {			
			System.out.println("SurgQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("revec", revec);
				
		return "/design/dept/surgery/surg_question_read.jsp";
		
	}

}
