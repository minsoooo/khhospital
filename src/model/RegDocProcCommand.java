/*
 *  작성자 : 박민수
 *  작성일 : 2016-06-15
 *  설명 : 의사 정보를 받아 DB 에 저장 하는 Command
 * 
 * 	수정자 : 박민수
 * 	수정일 : 2016-06-30
 * 	설명 : doc_id를 설정 하기위해 DB에서 다시 정보를 꺼내와서 판단후 입력.
 * 
 */


package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dbcp.DBConnectionMgr;

public class RegDocProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	public RegDocProcCommand(){
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
		//의사 이미지 파일 실제 경로 받아오기.
		ServletContext ctx = req.getServletContext();	 
		String path = ctx.getRealPath("upload");
		int maxSize = 50*1024*1024;		// 50MB
		
		String doc_img ="";
		MultipartRequest multiReq = new MultipartRequest(req, path, maxSize, "euc-kr", new DefaultFileRenamePolicy());	
		Enumeration enumer = multiReq.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			//폴더에 저장될 이름 가져오기	
			doc_img =  multiReq.getFilesystemName(name);	
		}
		//파라미터 받아오기.
		String doc_name = multiReq.getParameter("doc_name");
		String doc_pass = multiReq.getParameter("social2");
		String doc_social = multiReq.getParameter("social1")+"-"+multiReq.getParameter("social2");
		String doc_phone = multiReq.getParameter("phone1")+"-"+multiReq.getParameter("phone2")+"-"+multiReq.getParameter("phone3");
		String doc_email = multiReq.getParameter("email1")+"@"+multiReq.getParameter("email2");
		String dept_no = multiReq.getParameter("dept_name");
		String doc_part =multiReq.getParameter("doc_part");
		String doc_license = multiReq.getParameter("doc_license");
		String doc_career = multiReq.getParameter("doc_career");
		String doc_id ="";
		String sql = "insert into doc_info(doc_name, doc_pass, doc_social, doc_phone, doc_email, doc_part,"
				+ "doc_license, doc_career, doc_img, dept_info_dept_no ) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		//DB 입력.
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, doc_name);
			stmt.setString(2, doc_pass);
			stmt.setString(3, doc_social);
			stmt.setString(4, doc_phone);
			stmt.setString(5, doc_email);
			stmt.setString(6, doc_part);
			stmt.setString(7, doc_license);
			stmt.setString(8, doc_career);
			stmt.setString(9, doc_img);	
			stmt.setString(10, dept_no);
			stmt.executeUpdate();
			
			sql ="select doc_num from doc_info where doc_name =?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,doc_name);
			rs = stmt.executeQuery();
			rs.next();
			String doc_num = rs.getString("doc_num");
			
			if(dept_no.equals("1")){
				doc_id = Integer.toString(1000+Integer.parseInt(doc_num));
			}else if(dept_no.equals("2")){
				doc_id = Integer.toString(2000+Integer.parseInt(doc_num));
			}else if(dept_no.equals("3")){
				doc_id = Integer.toString(3000+Integer.parseInt(doc_num));
			}else if(dept_no.equals("4")){
				doc_id = Integer.toString(4000+Integer.parseInt(doc_num));
			}else if(dept_no.equals("5")){
				doc_id = Integer.toString(5000+Integer.parseInt(doc_num));
			}else if(dept_no.equals("6")){
				doc_id = Integer.toString(6000+Integer.parseInt(doc_num));
			}
			
			sql ="update doc_info set doc_id =? where doc_num=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, doc_id);
			stmt.setString(2, doc_num);
			stmt.executeUpdate();
			
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt,rs);
		}
		return "/design/mgr/reg_doc.jsp";
	}

}
