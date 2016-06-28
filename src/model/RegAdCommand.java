package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.AdDto;
import dbcp.DBConnectionMgr;

public class RegAdCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;	
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	public RegAdCommand(){
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
			AdDto dto = null;
			ArrayList<AdDto> adList = new ArrayList<AdDto>();
		String sql = "select ad_no, ad_name from advertise order by ad_no";
		
		//DB 입력.
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				dto = new AdDto();
				dto.setAd_no(rs.getString("ad_no"));
				if(rs.getString("ad_name").equals("")){
					dto.setAd_name("default.jpg");
				}else{
					dto.setAd_name(rs.getString("ad_name"));
				}
				adList.add(dto);
			}
			req.setAttribute("adList", adList);
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt,rs);
		}
		return "/design/mgr/reg_ad.jsp";
	}

}
