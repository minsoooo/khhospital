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
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
	 	String pass = req.getParameter("pass");
	 	String user = req.getParameter("user");		// 환자, 의료진, 관리자를 구분함
	 	
	 	String sql = "";
		String result = "";
		
		try{
			con = pool.getConnection();	
			
			if(user.equals("patient")){		// �솚�옄濡� 濡쒓렇�씤�쓣 �떆�룄�븳 寃쎌슦
				sql = "select pat_pass, pat_num, pat_name from patient_info where pat_id='" + id + "'";
				
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs.next()) {	
					String dbPass = rs.getString("pat_pass");			
					
					if(dbPass.equals(pass)) {		// 濡쒓렇�씤 �꽦怨�
						result = "Success";
						
						session.setAttribute("pat_num", rs.getString("pat_num"));
						session.setAttribute("pat_name", rs.getString("pat_name"));
				  	}
					else{
				  		result = "NoPass";		// 鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�쓬
				  	}
				} 
				else{
					  result = "NoId";		// ID媛� 議댁옱�븯吏� �븡�쓬
				}
			}
			else if(user.equals("doctor")){		// �쓽�궗濡� 濡쒓렇�씤�쓣 �떆�룄�븳 寃쎌슦
				sql = "select doc_pass, doc_name, Dept_Info_Dept_no from doc_info where doc_num='" + id + "'";
				
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					String dbPass = rs.getString("doc_pass");
					
					if(dbPass.equals(pass)) {
						result = "Success";
						
						session.setAttribute("dept_num", rs.getString("Dept_Info_Dept_no"));
						session.setAttribute("doc_name", rs.getString("doc_name"));
				  	}
					else{
				  		result = "NoPass";
				  	}
				} 
				else{
					  result = "NoId";
				}
			}
			else{	// 愿�由ъ옄濡� 濡쒓렇�씤�쓣 �떆�룄�븳 寃쎌슦
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
	 			// �젒�냽以묒씤 �쓽�궗�뱾�쓽 �젙蹂대�� �떞�쓣 怨듦컙
	 			
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
