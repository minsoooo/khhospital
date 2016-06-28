/*
 *	작성자: 박민수
 *	작성일: 2016-06-14
 *	설명 : 의사 근무테이블 수정 model 
 * 
 * 
 *
 */


package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class UpdateWorkCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;	
	private DBConnectionMgr pool = null;

	public UpdateWorkCommand(){
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String doc_num = req.getParameter("doc_num");
		String dept_name = req.getParameter("dept_name");
		String doc_name =req.getParameter("doc_name");
		String now_year = req.getParameter("now_year");
		String now_month = req.getParameter("now_month");
		String work_m_days = req.getParameter("Mdays");
		String work_a_days = req.getParameter("Adays");
		String work_month = now_year+"/"+now_month;
		if(now_month.length()<2){
			work_month = now_year+"/0"+now_month;
		}
		DocDto dto = new DocDto();
		dto.setDept_name(dept_name);
		dto.setDoc_name(doc_name);
		dto.setDoc_num(doc_num);
		dto.setNow_month(now_month);
		dto.setNow_year(now_year);
		dto.setWork_a_days(work_a_days);
		dto.setWork_m_days(work_m_days);

		req.setAttribute("work", dto);
		
		String sql = "update Doc_work set Work_A_Days =? ,Work_M_Days =?"
				+" where Doc_Info_Doc_num =? and Work_Month =?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, work_a_days);
			stmt.setString(2, work_m_days);
			stmt.setString(3, doc_num);
			stmt.setString(4, work_month);
			stmt.executeUpdate();
			
			req.setAttribute("regCheck", "success");
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt);
		}
		return "/design/mgr/reg_work.jsp";
	}

}
