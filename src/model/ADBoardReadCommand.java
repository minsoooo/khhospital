/*	간병인을 구합니다 글을 눌렀을 때
 * 	누른 글의 번호를 받고, isRead를 받아서, true이면 조회수를 1 증가시킨다.
 *  전달받은 글 번호에 해당하는 자료를 DB에 연결해서 꺼내고
 *  전달받은 글 번호에 해당하는 댓글자료를 DB에 연결해서 꺼내고
 *  해당 작업이 끝나면 출력화면으로 넘긴다.
 *  
 *  위에서 글 번호와 댓글번호는 따로 구성되어있다.
 *  
 *	작성자 - 백규하
 *	작성일 - 2016-06-15
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


public class ADBoardReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public ADBoardReadCommand(){
		try{			
			pool = dbcp.DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("ADBoardReadCommand : " + err);
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
				
		String sql = "select * from AdBoard_main where adb_num_main=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
		
		try {
			con = pool.getConnection();
			
			if(isRead.equals("true")){	
				String upSql = "update AdBoard_main set adb_count_main=adb_count_main+1 where adb_num_main=" + num;
				stmt = con.prepareStatement(upSql);
				stmt.executeUpdate();
			}			
						
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("adb_num_main"));
				rdto.setName(rs.getString("adb_name_main"));				
				rdto.setPass(rs.getString("adb_pass_main"));
				rdto.setTitle(rs.getString("adb_title_main"));
				rdto.setContent(rs.getString("adb_content_main"));
				rdto.setIp(rs.getString("adb_ip_main"));
				rdto.setRegdate(rs.getString("adb_regdate_main"));
				rdto.setCount(rs.getInt("adb_count_main"));
				rdto.setPos(rs.getInt("adb_pos_main"));
				rdto.setDepth(rs.getInt("adb_depth_main"));
				rdto.setFamily(rs.getInt("adb_family_main"));				
			}
		} 
		catch (Exception e) {			
			System.out.println("ADBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);
		
		
		Vector<ReplyDto> revec = new Vector<ReplyDto>();
		ReplyDto redto = null;
		try {
			sql = "select * from AdBoard_main_Reply where adb_num_main=" + num;
						
			con = pool.getConnection();									
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();
			
			while(rs.next()){
				redto = new ReplyDto();
				
				redto.setReplydate(rs.getString("adb_replyregdate_main"));	
				redto.setReplyid(rs.getString("adb_replyid_main"));
				redto.setReplypass(rs.getString("adb_replypass_main"));				
				redto.setReplycontent(rs.getString("adb_replycontent_main"));	
				redto.setReplynum(rs.getInt("adb_replynum_main"));
				redto.setNum(rs.getInt("adb_num_main"));
				
				revec.add(redto);	
			}
		}
		
		catch (Exception e) {			
			System.out.println("ADBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("revec", revec);
				
		return "/design/board/ad_read.jsp";
		
	}

}
