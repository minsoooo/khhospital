package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;

public class AdServlet extends HttpServlet {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		resp.setContentType("text/xml");
		resp.setHeader("Cache-control", "no-cache");
		PrintWriter out = resp.getWriter();
		String ad_name ="";
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
		
		String sql = "select ad_name from advertise order by ad_no ";
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs =stmt.executeQuery();
			out.println("<response>");
			for(int i =0; i<3; i++){
				rs.next();
				out.println("<adv><name>"+rs.getString("ad_name")+"</name></adv>");
			}
			out.println("</response>");
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
	}
}
