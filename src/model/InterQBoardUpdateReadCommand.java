/*	내과 온라인질문 글 수정하기를 누르고 입력받은 비밀번호가 일치한다면 
 * 	글 번호에 해당하는 자료를 출력하고 출력화면으로 보낸다.
 * 	비밀번호가 일치하지않는다면 에러페이지로 전송한다.
 * 	작성자 - 백규하
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

public class InterQBoardUpdateReadCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public InterQBoardUpdateReadCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("InterQBoardUpdateReadCommand : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int num = Integer.parseInt(req.getParameter("num"));
		String realpass = req.getParameter("realpass");
		String userpass = req.getParameter("userpass");
		String url = "";
		
		if(userpass.equals(realpass)){
			String sql = "select * from QBoard_inter where qb_num_inter=" + num;
			bean.BoardDto rdto = new bean.BoardDto();
			
			try {
				con = pool.getConnection();			
				stmt =  con.prepareStatement(sql);					
				rs = stmt.executeQuery();						
				
				while(rs.next()){
					rdto.setNum(rs.getInt("qb_num_inter"));
					rdto.setName(rs.getString("qb_name_inter"));				
					rdto.setTitle(rs.getString("qb_title_inter"));
					rdto.setContent(rs.getString("qb_content_inter"));
					rdto.setPass(rs.getString("qb_pass_inter"));
					rdto.setCount(rs.getInt("qb_count_inter"));
					rdto.setIp(rs.getString("qb_ip_inter"));
					rdto.setRegdate(rs.getString("qb_regdate_inter"));
					rdto.setPos(rs.getInt("qb_pos_inter"));
					rdto.setDepth(rs.getInt("qb_depth_inter"));
					rdto.setFamily(rs.getInt("qb_family_inter"));
					
				}
			} 
			catch (Exception e) {			
				System.out.println("InterQBoardUpdateReadCommand : " + e);
			}
			finally{
				 pool.freeConnection(con,stmt,rs);
			}
			
			session.setAttribute("rdto", rdto);
						
			url = "/design/dept/internal/inter_question_update_proc.jsp";
		}
		
		else{
			url = "/control?cmd=INTERQBOARDERROR&num="+num;
		}		
				
		return url;
		
	}

}
