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

public class CounselDocInfoCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	public CounselDocInfoCommand(){
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String doc_num = req.getParameter("doc_num");
		DocDto docDto = new DocDto();
		
		String sql = "select doc_name, dept_name, doc_part, doc_img from v_details_idoc where doc_num="+doc_num;
		
		try { 
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();			
			rs.next();
			
			docDto.setDoc_name(rs.getString("doc_name"));
			docDto.setDept_name(rs.getString("dept_name"));
			docDto.setDoc_part(rs.getString("doc_part"));
			docDto.setDoc_img(rs.getString("doc_img"));
			
		} 
		catch (Exception err) {
			System.out.println("CounselDocInfoCommand : " + err);
		} 
		finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		req.setAttribute("docDto", docDto);
		
		return "/design/main/counsel_doc_info.jsp";
	}

}
