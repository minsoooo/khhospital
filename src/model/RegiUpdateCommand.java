package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.PatientDto;
import dbcp.DBConnectionMgr;

public class RegiUpdateCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public RegiUpdateCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("RegiUpdateCommand DB에러 : " + err);
		}
	}
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String pat_level ="";
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		String sql = "select * from patient_info where pat_id='" + id + "'";
		PatientDto dto = new PatientDto();
		
		try {
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			rs.next();
			pat_level =rs.getString("pat_level");
			if(pat_level.equals("2")){
				String pat_name = rs.getString("pat_name");
				String[] pat_addr = rs.getString("pat_addr").split(",");
				String[] pat_phone = rs.getString("pat_phone").split("-");
				String[] pat_social = rs.getString("pat_social").split("-");
				dto.setPat_name(pat_name);
				dto.setPat_addr1(pat_addr[0]);
				dto.setPat_addr2(pat_addr[1]);
				dto.setPat_addr3(pat_addr[2]);
				dto.setPat_phone1(pat_phone[0]);
				dto.setPat_phone2(pat_phone[1]);
				dto.setPat_phone3(pat_phone[2]);
				dto.setPat_social1(pat_social[0]);
				dto.setPat_social2(pat_social[1]);

			}
			String pat_num = rs.getString("pat_num");
			String pat_id = rs.getString("pat_id");
			String pat_pass = rs.getString("pat_pass");	
			String[] pat_email = rs.getString("pat_email").split("@");
			dto.setPat_num(pat_num);
			dto.setPat_id(pat_id);
			dto.setPat_pass(pat_pass);		
			dto.setPat_email1(pat_email[0]);
			dto.setPat_email2(pat_email[1]);
			dto.setPat_level(pat_level);
		} 
		catch (Exception err) {
			System.out.println("getPatient : " + err);
			err.printStackTrace();
		} 
		finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		req.setAttribute("patient", dto);
		if(pat_level.equals("1")){
			return "/design/main/regi_update_first.jsp";
		}else{
			return "/design/main/regi_update_second.jsp";	
		}
	}

}
