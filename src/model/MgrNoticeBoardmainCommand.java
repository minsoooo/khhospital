 /*	공지사항 DB연결부분
 * 	키필드(제목,내용..),키워드(입력내용)을 받아서, DB에서 검색한다.
 *  따로 입력된 값이 없으면 ""값을 줘서 전체 페이지를 다 꺼내온다. 
 *  검색이 끝난 후에 , 페이지 DTO와 연결해서 페이징작업을 진행하고 출력화면으로 돌려보낸다.
 * 	MGR true여부를 받아서, true라면 관리자용 페이지로, 아니라면 일반페이지로 이동한다.
 *	작성자 - 백규하
 *	작성일 - 2016-06-17
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

import bean.BoardDto;
import bean.PageDto;
import dbcp.DBConnectionMgr;

public class MgrNoticeBoardmainCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MgrNoticeBoardmainCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("MgrNoticeBoardmainCommand : " + err);
		}
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		
		String keyWord = req.getParameter("keyWord");
		String keyField = req.getParameter("keyField");		
		
		if(keyWord == null){
			keyWord = "";			
		}
		if(keyField == null){
			keyField = "nb_title_main";
			keyWord = "";
		}
				
		String sql = null;		
		Vector<bean.BoardDto> vdto = new Vector<bean.BoardDto>();
		bean.BoardDto bdto = null;
		
		if(keyWord.equals("") || keyWord.isEmpty()){
			sql = "select * from NBoard_main order by nb_regdate_main desc";
		}
		else{
			if(keyField.equals("nb_titlecontent_main")){
				sql = "select * from NBoard_main where nb_title_main" + " like'%" + keyWord + "%'"
				+ " or nb_content_main like '%" + keyWord + "%' order by nb_regdate_main desc";
			}
			else{
				sql = "select * from NBoard_main where " + keyField + " like'%" + keyWord + "%' order by nb_regdate_main desc";				
			}
		}
		
		
		try {
			con = pool.getConnection();      
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				bdto = new BoardDto();
				bdto.setNum(rs.getInt("nb_num_main"));
				bdto.setName(rs.getString("nb_name_main"));
				bdto.setTitle(rs.getString("nb_title_main"));
				bdto.setContent(rs.getString("nb_content_main"));				
				bdto.setCount(rs.getInt("nb_count_main"));
				bdto.setIp(rs.getString("nb_ip_main"));
				bdto.setRegdate(rs.getString("nb_regdate_main"));			
				
				vdto.add(bdto);				
			}			
		} 
		catch (Exception e){
			System.out.println("MgrNoticeBoardmainCommand : " + e);
		}
		finally{
			   pool.freeConnection(con,stmt,rs);
		}		
		
		req.setAttribute("vdto", vdto);
		req.setAttribute("keyWord", keyWord);
		
		PageDto pdto = new PageDto();
		pdto.setTotalRecord(vdto.size());		
		pdto.setTotalPage((int)Math.ceil((double)pdto.getTotalRecord()/pdto.getNumPerPage()));		
		pdto.setTotalBlock((int)Math.ceil((double)pdto.getTotalPage()/pdto.getPagePerBlock()));
		
		if(req.getParameter("nowPage") != null){
			pdto.setNowPage(Integer.parseInt(req.getParameter("nowPage")));			
		}		
		
		if(req.getParameter("nowBlock") != null){
			pdto.setNowBlock(Integer.parseInt(req.getParameter("nowBlock")));			
		}
		
		pdto.setBeginPerPage(pdto.getNowPage() * pdto.getNumPerPage());
		
		req.setAttribute("pdto", pdto);
		
		String mgr = req.getParameter("mgr");		
		String url = "";
		
		if(mgr == null){
			mgr = "false";
			url = "/design/board/notice_board.jsp";
		}
		else{
			if(mgr.equals("true")){
				url = "/design/mgr/mgr_notice_board.jsp";
			}		
		}
		
		return url;
	}

}
