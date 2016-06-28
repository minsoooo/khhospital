/*
 *  작성자 : 박민수
 *  작성일 : 2016-06-21
 *  설명 : ajax로 요청받은 게시판 정보를 xml파일로 전송
 * 
 * 
 */

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

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class FooterServlet extends HttpServlet{
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
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
		// 최신 순으로 정렬
		String sql1 = "select newsb_title_main, newsb_num_main from NewsBoard_main order by newsb_num_main desc";
		String sql2 ="select nb_title_main, nb_num_main from NBoard_main order by nb_num_main desc";
		String sql3 ="select qb_title_main, qb_num_main from QBoard_main order by qb_num_main desc";
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql1);
			rs = stmt.executeQuery();
			// 최신순으로 2개씩만 보낸다
			out.println("<response>");
			for(int i=0; i<2;i++){
				rs.next();		
				out.println("<news><title>"+rs.getString("newsb_title_main")+"</title><num>"
						+rs.getString("newsb_num_main")+"</num></news>");
			}
			stmt = con.prepareStatement(sql2);
			rs = stmt.executeQuery();
			for(int i=0; i<2;i++){
				rs.next();
				out.println("<notice><title>"+rs.getString("nb_title_main")+"</title><num>"
						+rs.getString("nb_num_main")+"</num></notice>");
			}
			stmt = con.prepareStatement(sql3);
			rs = stmt.executeQuery();	
			for(int i=0; i<2;i++){
				rs.next();
				out.println("<question><title>"+rs.getString("qb_title_main")+"</title><num>"
						+rs.getString("qb_num_main")+"</num></question>");
			}
			out.println("</response>");
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
	}

}
