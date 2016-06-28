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

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class UpdateDocProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool = null;
	
	public UpdateDocProcCommand(){
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
	
		ServletContext ctx = req.getServletContext();	 
		String path = ctx.getRealPath("upload");
		int maxSize = 50*1024*1024;		// 50MB
		String doc_img ="";
		MultipartRequest multiReq = new MultipartRequest(req, path, maxSize, "euc-kr", new DefaultFileRenamePolicy());	
		Enumeration enumer = multiReq.getFileNames();
		String doc_num = multiReq.getParameter("doc_num");
		
		//삭제/수정 판단 .
		String check = multiReq.getParameter("check");
		if(check.equals("UPDATE")){
			
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
			
			String sql = "update doc_info set doc_name =?, doc_pass=?, doc_social=?, doc_phone=?"
					+ ", doc_email=?, dept_info_dept_no=?, doc_part=?, doc_license=?, doc_career=? "
					+ "where doc_num=?";
			try{
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setString(1, doc_name);
				stmt.setString(2, doc_pass);
				stmt.setString(3, doc_social);
				stmt.setString(4, doc_phone);
				stmt.setString(5, doc_email);
				stmt.setString(6, dept_no);
				stmt.setString(7, doc_part);
				stmt.setString(8, doc_license);
				stmt.setString(9, doc_career);
				stmt.setString(10, doc_num);
				stmt.executeUpdate();
				
			}catch(Exception err){
				err.printStackTrace();
			}finally{
				pool.freeConnection(con, stmt);
			}
			return "/control?cmd=UPDATEDOC&doc_num="+doc_num;
		
		}else if (check.equals("DELETE")){
			
			String sql = "delete from doc_info where doc_num=?";
			try{
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setString(1, doc_num);
				stmt.executeUpdate();
				
			}catch(Exception err){
				err.printStackTrace();
			}finally{
				pool.freeConnection(con, stmt);
			}
			return "/design/mgr/mgr_main.jsp";
		}
		return null;
	}

}
