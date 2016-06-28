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

public class RegWorkCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;

	public RegWorkCommand(){
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
		
		String doc_num =req.getParameter("doc_num");
		String now_month = req.getParameter("now_month");
		String now_year =req.getParameter("now_year");
		String check = req.getParameter("check");
		String work_month = now_year+"/"+now_month;
		if(now_month.length()<2){
			work_month =now_year+"/0"+now_month;
			// 형식 맞춰주기.
		}
		if(check != null){
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
		
		String sql = "select work_m_days, Work_A_days, work_month, doc_name, dept_name from v_details_Wdoc where doc_num=? and"
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
		
		return "/design/mgr/reg_work.jsp";
	}

}
