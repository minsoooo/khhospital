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

public class UpdateDocCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	public UpdateDocCommand(){
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
		String doc_num = req.getParameter("doc_num");
		
		String sql = "select doc_name, doc_social, doc_email, doc_phone, doc_part,"
				+ " doc_license, doc_career, doc_img, dept_info_dept_no from v_details_Idoc where doc_num = ? ";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, doc_num);
			rs = stmt.executeQuery();
			while(rs.next()){
				dto = new DocDto();
				dto.setDoc_name(rs.getString("doc_name"));
				dto.setDoc_social1(rs.getString("doc_social").split("-")[0]);
				dto.setDoc_social2(rs.getString("doc_social").split("-")[1]);
				dto.setDoc_phone1(rs.getString("doc_phone").split("-")[0]);
				dto.setDoc_phone2(rs.getString("doc_phone").split("-")[1]);
				dto.setDoc_phone3(rs.getString("doc_phone").split("-")[2]);
				dto.setDoc_email1(rs.getString("doc_email").split("@")[0]);
				dto.setDoc_email2(rs.getString("doc_email").split("@")[1]);
				dto.setDoc_career(rs.getString("doc_career"));
				if(rs.getString("doc_img") !=null){
					dto.setDoc_img(rs.getString("doc_img"));
				}else{
					dto.setDoc_img("default.jpg");
				}
				dto.setDoc_license(rs.getString("doc_license"));
				dto.setDept_no(rs.getString("dept_info_dept_no"));
				dto.setDoc_part(rs.getString("doc_part"));
				dto.setDoc_num(doc_num);
				
				req.setAttribute("docInfo", dto);
			}
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return "/design/mgr/update_doc.jsp";
	}

}
