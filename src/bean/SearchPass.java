package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class SearchPass {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public SearchPass(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("SearchPass DB¿¬°á : " + err);
		}
	}
	
	public String searchPass(String id, String question, String answer){
		String sql = "select pat_pass from patient_info where pat_id='" + id + "' and pat_question='" + question + "' and pat_answer='" + answer + "'";
		
		try {
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			rs.next();
			
			String pass = rs.getString("pat_pass");
			
			return pass;
		} 
		catch (Exception err) {
			System.out.println("searchPass : " + err);
		} 
		finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		return null;
	}
}
