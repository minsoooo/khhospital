 /*	병원소식 관리자모드 글을 눌렀을 때
 * 	보이는 댓글을 삭제하는 페이지
 *  DB에 저장된 댓글의 비밀번호와 다르다면 에러페이지로 이동하고,
 *  비밀번호가 일치한다면 같이 전달받은 댓글 번호에 해당하는 자료를 DB에 연결해서 삭제한다.  
 *  해당 작업이 끝나면 원래 있던 화면으로 돌아간다.
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


public class MgrMedicalNewsBoardReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private dbcp.DBConnectionMgr pool;
	
	public MgrMedicalNewsBoardReadCommand(){
		try{			
			pool = dbcp.DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("MgrMedicalNewsBoardReadCommand : " + err);
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
				
		String sql = "select * from NewsBoard_medical where newsb_num_medical=" + num;
		bean.BoardDto rdto = new bean.BoardDto();
		
		try {
			con = pool.getConnection();
			
			if(isRead.equals("true")){	
				String upSql = "update NewsBoard_medical set newsb_count_medical=newsb_count_medical+1 where newsb_num_medical=" + num;
				stmt = con.prepareStatement(upSql);
				stmt.executeUpdate();
			}			
						
			stmt =  con.prepareStatement(sql);					
			rs = stmt.executeQuery();						
			
			while(rs.next()){
				rdto.setNum(rs.getInt("newsb_num_medical"));
				rdto.setName(rs.getString("newsb_name_medical"));	
				rdto.setTitle(rs.getString("newsb_title_medical"));
				rdto.setContent(rs.getString("newsb_content_medical"));
				rdto.setIp(rs.getString("newsb_ip_medical"));
				rdto.setRegdate(rs.getString("newsb_regdate_medical"));
				rdto.setCount(rs.getInt("newsb_count_medical"));					
			}
		} 
		catch (Exception e) {			
			System.out.println("MgrMedicalNewsBoardReadCommand : " + e);
		}
		finally{
			 pool.freeConnection(con,stmt,rs);
		}
		
		req.setAttribute("rdto", rdto);		
				
		String mgr = req.getParameter("mgr");		
		String url = "";
		
		if(mgr == null){
			mgr = "false";
			url = "/design/board/medical_news_read.jsp";
		}
		else{
			if(mgr.equals("true")){
				url = "/design/mgr/mgr_medical_news_read.jsp";
			}		
		}	
		
		return url;
		
	}

}
