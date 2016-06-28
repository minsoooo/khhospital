 /*	자주하는 질문 관리자모드 글목록에서 하나의 글을 눌렀을 때
 * 	누른 글의 번호를 받고, isRead를 받아서, true이면 조회수를 1 증가시킨다.
 *  전달받은 글 번호에 해당하는 자료를 DB에 연결해서 꺼내고
 *  전달받은 글 번호에 해당하는 댓글자료를 DB에 연결해서 꺼내고
 *  해당 작업이 끝나면 출력화면으로 넘긴다.
 *  
 *  위에서 글 번호와 댓글번호는 따로 구성되어있다.
 *  MGR true여부를 받아서, true라면 관리자용 페이지로, 아니라면 일반페이지로 이동한다.
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


public class MgrOQBoardReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public MgrOQBoardReadCommand(){
		try{			
			pool = dbcp.DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrOQBoardReadCommand : " + err);
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
				
		String sql = "select * from OQBoard_main where oqb_num_main=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
		
		try {
			con = pool.getConnection();
			
			if(isRead.equals("true")){	
				String upSql = "update OQBoard_main set oqb_count_main=oqb_count_main+1 where oqb_num_main=" + num;
				stmt = con.prepareStatement(upSql);
				stmt.executeUpdate();
			}			
						
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("oqb_num_main"));
				rdto.setName(rs.getString("oqb_name_main"));	
				rdto.setTitle(rs.getString("oqb_title_main"));
				rdto.setContent(rs.getString("oqb_content_main"));
				rdto.setIp(rs.getString("oqb_ip_main"));
				rdto.setRegdate(rs.getString("oqb_regdate_main"));
				rdto.setCount(rs.getInt("oqb_count_main"));					
			}
		} 
		catch (Exception e) {			
			System.out.println("MgrOQBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);		
				
		String mgr = req.getParameter("mgr");
		String url = "";
		
		if(mgr == null){
			mgr = "false";
			url = "/design/board/oq_read.jsp";
		}
		else{
			if(mgr.equals("true")){
				url = "/design/mgr/mgr_oq_read.jsp";
			}		
		}	
		
		return url;
		
	}

}
