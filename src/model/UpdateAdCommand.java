package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dbcp.DBConnectionMgr;

public class UpdateAdCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;	
	private DBConnectionMgr pool = null;
	
	public UpdateAdCommand(){
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
		//이미지 파일 실제 경로 받아오기.
		ServletContext ctx = req.getServletContext();	 
		String path = ctx.getRealPath("upload");
		int maxSize = 50*1024*1024;		// 50MB
		
		String file_names ="";
		MultipartRequest multiReq = new MultipartRequest(req, path, maxSize, "euc-kr", new DefaultFileRenamePolicy());	
		Enumeration enumer = multiReq.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			//폴더에 저장될 이름 가져오기	
			file_names += "/"+ multiReq.getFilesystemName(name);	
			
		}
		//파일 이름 스플릿 하기 
		String ad1 = file_names.split("/")[1];
		String ad2 = file_names.split("/")[2];
		String ad3 = file_names.split("/")[3];
		
		String sql1 = "update advertise set ad_name=? where ad_no=1";
		String sql2 = "update advertise set ad_name=? where ad_no=2";
		String sql3 = "update advertise set ad_name=? where ad_no=3";
		//DB 입력.
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql1);
			stmt.setString(1, ad1);
			stmt.executeUpdate();
			stmt = con.prepareStatement(sql2);
			stmt.setString(1, ad2);
			stmt.executeUpdate();
			stmt = con.prepareStatement(sql3);
			stmt.setString(1, ad3);
			stmt.executeUpdate();
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt);
		}
		return "/design/mgr/mgr_index.jsp";
	}

}
