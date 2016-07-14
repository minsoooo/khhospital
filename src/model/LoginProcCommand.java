/*
 * 	작성자 : 양진원
 * 	작성일 : 2016-06-17
 * 	설명 : 입력 정보를 받아 DB와의 연동을 통해 로그인 처리 커맨드.
 * 
 * 	수정자 : 박민수
 * 	수정일 : 2016-06-29
 * 	설명 : 입력 암호 MD5 알고리즘을 통한 암호화 실시.
 * 
 */

package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CipherDao;
import dbcp.DBConnectionMgr;

public class LoginProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public LoginProcCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("LoginProcCommand DB연결 : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		CipherDao cipher = new CipherDao();
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
	 	String pass = req.getParameter("pass");
	 	//pass를 받아와서 MD5로 암호화
	 	String passMD5 =cipher.getMD5(pass);
	 	String user = req.getParameter("user");		// 환자, 의료진, 관리자를 구분해줌
	 	
	 	String sql = "";
		String result = "";
		
		try{
			con = pool.getConnection();	
			
			if(user.equals("patient")){		// 환자로 로그인을 시도한 경우
				sql = "select pat_pass, pat_num, pat_name from patient_info where pat_id='" + id + "'";
				
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs.next()) {	
					String dbPass = rs.getString("pat_pass");			
					if(dbPass.equals(passMD5)) {		// 로그인 성공
						result = "Success";
						
						session.setAttribute("pat_num", rs.getString("pat_num"));
						session.setAttribute("pat_name", rs.getString("pat_name"));
				  	}
					else{
				  		result = "NoPass";		// 비밀번호가 일치하지 않음
				  	}
				} 
				else{
					  result = "NoId";		// ID가 존재하지 않음
				}
			}
			else if(user.equals("doctor")){		// 의사로 로그인을 시도한 경우
				sql = "select doc_pass,doc_num, doc_name, Dept_Info_Dept_no from doc_info where doc_id='" + id + "'";
				
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					String dbPass = rs.getString("doc_pass");
					
					if(dbPass.equals(pass)) {
						result = "Success";
						
						session.setAttribute("dept_num", rs.getString("Dept_Info_Dept_no"));
						session.setAttribute("doc_name", rs.getString("doc_name"));
						session.setAttribute("doc_num", rs.getString("doc_num"));
				  	}
					else{
				  		result = "NoPass";
				  	}
				} 
				else{
					  result = "NoId";
				}
			}
			else{	// 관리자로 로그인을 시도한 경우
				sql = "select mgr_pass from mgr_info where mgr_id='" + id + "'";
				
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					String dbPass = rs.getString("mgr_pass");
					
					if(dbPass.equals(pass)) {
						result = "Success";
				  	}
					else{
				  		result = "NoPass";
				  	}
				} 
				else{
					  result = "NoId";
				}
			}
		}
		catch(Exception err){
			System.out.println("LoginProc : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
	 	

		
	 	if(result.equals("Success")){ 		
	 		session.setAttribute("user", user);			
	 		session.setAttribute("id", id);
	 		session.setAttribute("pass", pass);
	 		
	 		if(user.equals("doctor")){
				
	 			ServletContext application = req.getServletContext();
	 			ArrayList<String> doctors = new ArrayList<>();
	 			// 접속중인 의사들의 정보를 담을 공간
	 			
	 			if(application.getAttribute("doctors") == null){	 				
	 				doctors.add(id);
	 				application.setAttribute("doctors", doctors);
	 			}
	 			else{
	 				doctors = (ArrayList<String>) application.getAttribute("doctors");
	 				doctors.add(id);
	 				application.setAttribute("doctors", doctors);
	 			}
	 		}
	 	}

	 	req.setAttribute("result", result);
	 	
	 	return "/design/main/login_proc.jsp";
	}	
}
