/*
 *  작성자 : 박민수
 *  작성일 : 2016-06-15
 *  설명 : 의사번호와 이번 달 정보를 받아 의사의 근무 테이블을 출력한다.
 *  
 *  수정자 : 박민수
 *  수정일 : 2016-06-21
 *  수정내용 : 각과 게시판으로 부터의 요청을 받아 구분해 주어 return 값을 분배한다.
 * 
 * 
 */


package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class SearchWorkCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	public SearchWorkCommand(){
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		DocDto dto = null;
		// 호출페이지를 구분하기 위한 파라미터 
		String where = req.getParameter("where");
		
		String doc_num =req.getParameter("doc_num");
		String now_month = req.getParameter("now_month");
		String now_year =req.getParameter("now_year");
		String checkNew = req.getParameter("checkNew");
		String work_month = now_year+"/"+now_month;
		if(now_month.length()<2){
			work_month =now_year+"/0"+now_month;
			// 형식 맞춰주기.
		}
		if(checkNew != null){
			String upSql = "insert into doc_work values('0','0',?,?)";
			try{
				con = pool.getConnection();
				stmt = con.prepareStatement(upSql);
				stmt.setString(1, work_month);
				stmt.setString(2, doc_num);
				stmt.executeUpdate();
			}catch(Exception err){
				err.printStackTrace();
			}
		}
		
		String sql = "select work_m_days, Work_A_days, work_month, doc_name, dept_name, doc_img, doc_part from v_details_Wdoc where doc_num=? and"
				+ " work_month=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, doc_num);
			stmt.setString(2, work_month);
			rs = stmt.executeQuery();
			while(rs.next()){
				dto = new DocDto();
				dto.setDept_name(rs.getString("dept_name"));
				dto.setDoc_name(rs.getString("doc_name"));
				dto.setWork_a_days(rs.getString("work_a_days"));
				dto.setWork_m_days(rs.getString("work_m_days"));
				dto.setDoc_part(rs.getString("doc_part"));
				if(rs.getString("doc_img")!= null){
					dto.setDoc_img(rs.getString("doc_img"));
				}else{
					dto.setDoc_img("default.jpg");
				}
				dto.setNow_month(now_month);
				dto.setNow_year(now_year);
				dto.setDoc_num(doc_num);
				req.setAttribute("work", dto);
			}
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		if(where.equals("surg")){
			return "/design/dept/surgery/doc_work_surg.jsp";
		}else if(where.equals("inter")){
			return "/design/dept/internal/doc_work_inter.jsp";
		}else if(where.equals("dent")){
			return "/design/dept/dent/doc_work_dent.jsp";
		}else if(where.equals("skin")){
			return "/design/dept/skin/doc_work_skin.jsp";
		}else if(where.equals("opti")){
			return "/design/dept/opti/doc_work_opti.jsp";
		}else if(where.equals("psy")){
			return "/design/dept/psy/doc_work_psy.jsp";
		}else{
			return "/design/main/doc_work_info.jsp";
		}
	}

}
