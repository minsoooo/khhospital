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

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class Step2Command implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public Step2Command(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("Step2Command DB���� : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		String dept_no = req.getParameter("dept_no");
		ServletContext application = req.getServletContext();
		ArrayList<String> doctors = (ArrayList<String>)application.getAttribute("doctors");
		
		
		ArrayList<DocDto> searchDoctors = new ArrayList<>();
		DocDto dto = null;
		String sql = "select doc_id, doc_num, dept_name, doc_part, doc_name from v_details_idoc where dept_info_dept_no='"+ dept_no +"'";
		
		try { 
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){	
				
				
				for(int i = 0; i < doctors.size(); i++){
					if(doctors.get(i).equals(rs.getString("doc_id"))){					
						dto = new DocDto();
						dto.setDoc_num(rs.getString("doc_num"));
						dto.setDept_name(rs.getString("dept_name"));
						dto.setDoc_part(rs.getString("doc_part"));
						dto.setDoc_name(rs.getString("doc_name"));						
						
						searchDoctors.add(dto);
					}
				}				
			}
		} 
		catch (Exception err) {
			System.out.println("Step2 : " + err);
			err.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		req.setAttribute("searchDoctors", searchDoctors);
		
		return "/design/main/step2.jsp";
	}

}
