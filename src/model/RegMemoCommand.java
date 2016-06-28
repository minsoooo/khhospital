package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dbcp.DBConnectionMgr;

public class RegMemoCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;	
	private DBConnectionMgr pool = null;
	
	public RegMemoCommand(){
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
		//파라미터 받아오기.
		HttpSession session = req.getSession();
		String pat_num = req.getParameter("pat_num");
		System.out.println(pat_num);
		String memo = req.getParameter("memo");
		System.out.println(memo);
		String doc_num =  (String)session.getAttribute("id");
		System.out.println(doc_num);
		String sql = "insert into history_info(Patient_Info_Pat_num, Doc_Info_Doc_num, pat_history, his_date)"
				+ "values(?,?,?,DATE_FORMAT(NOW(), '%Y/%m/%d')) ";
		
		//DB 입력.
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, pat_num);
			stmt.setString(2, doc_num);
			stmt.setString(3, memo);
			stmt.executeUpdate();
			req.setAttribute("check", "success");
			req.setAttribute("pat_num", pat_num);
		}catch(Exception err){
			err.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt);
		}
		return "/design/doctor/memo.jsp";
	}

}
