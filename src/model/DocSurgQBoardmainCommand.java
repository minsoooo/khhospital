 /*	외과 온라인질문 게시판 글목록 DB연결부분
 * 	키필드(제목,내용..),키워드(입력내용)을 받아서, DB에서 검색한다.
 *  따로 입력된 값이 없으면 ""값을 줘서 전체 페이지를 다 꺼내온다. 
 *  검색이 끝난 후에 , 페이지 DTO와 연결해서 페이징작업을 진행하고 출력화면으로 돌려보낸다.
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

import bean.BoardDto;
import bean.PageDto;
import dbcp.DBConnectionMgr;

public class DocSurgQBoardmainCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public DocSurgQBoardmainCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DocSurgQBoardmainCommand : " + err);
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
			keyField = "qb_title_surg";
			keyWord = "";
		}
				
		// 키필드,키워드를 받아서 글 목록을 꺼내 벡터에 담아 전송한다.
		
		String sql = null;		
		Vector<bean.BoardDto> vdto = new Vector<bean.BoardDto>();
		bean.BoardDto bdto = null;
		
		if(keyWord.equals("") || keyWord.isEmpty()){
			sql = "select * from QBoard_surg order by qb_regdate_surg desc";
		}
		else{
			if(keyField.equals("qb_titlecontent_surg")){
				sql = "select * from QBoard_surg where qb_title_surg" + " like'%" + keyWord + "%'"
				+ " or qb_content_surg like '%" + keyWord + "%' order by qb_regdate_surg desc";
			}
			else{
				sql = "select * from QBoard_surg where " + keyField + " like'%" + keyWord + "%' order by qb_regdate_surg desc";				
			}
		}
		
		
		try {
			con = pool.getConnection();      
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				bdto = new BoardDto();
				bdto.setNum(rs.getInt("qb_num_surg"));
				bdto.setName(rs.getString("qb_name_surg"));
				bdto.setTitle(rs.getString("qb_title_surg"));
				bdto.setContent(rs.getString("qb_content_surg"));
				bdto.setPass(rs.getString("qb_pass_surg"));
				bdto.setCount(rs.getInt("qb_count_surg"));
				bdto.setIp(rs.getString("qb_ip_surg"));
				bdto.setRegdate(rs.getString("qb_regdate_surg"));
				bdto.setPos(rs.getInt("qb_pos_surg"));
				bdto.setDepth(rs.getInt("qb_depth_surg"));
				bdto.setFamily(rs.getInt("qb_family_surg"));
				
				vdto.add(bdto);
				
			}
			
		} 
		catch (Exception e){
			System.out.println("DocSurgQBoardmainCommand : " + e);
		}
		finally{
			   pool.freeConnection(con,stmt,rs);
		}		
		
		req.setAttribute("vdto", vdto);
		req.setAttribute("keyWord", keyWord);
		
		// 페이지처리를 위해 dto에 담은 후 출력부분으로 보낸다.
		
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
		
		return "/design/doctor/surgery/doc_surg_question_board.jsp";
	}

}
