/*
 *  작성자 : 박민수
 *  작성일 : 2016-06-20
 *  설명 : 넘겨 받은 pat_num로 현재 상담 하는 의사와의 상담기록을 DB로 부터 모두 불러온다.
 * 
 * 
 */


package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.HisDto;
import dbcp.DBConnectionMgr;

public class OpenHistoryCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;	
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	public OpenHistoryCommand(){
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
		
		HisDto dto = null;
		ArrayList<HisDto> hisList = new ArrayList();
		HttpSession session = req.getSession();
		String pat_num = req.getParameter("pat_num");
		String doc_num = (String)session.getAttribute("id");
		String sql = "select pat_name, his_date, pat_history from v_details_phis where patient_info_pat_num =? and "
				+ "doc_info_doc_num=? ";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, pat_num);
			stmt.setString(2, doc_num);
			rs= stmt.executeQuery();
			while(rs.next()){
				dto = new HisDto();
				dto.setPat_name(rs.getString("pat_name"));
				dto.setHis_date(rs.getString("his_date"));
				dto.setPat_history(rs.getString("pat_history"));
				
				hisList.add(dto);
			}

			
			req.setAttribute("hisList", hisList);
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt,rs);
		}
		return "/design/doctor/pat_history.jsp";
		
	}

}
