package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class SearchId {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public SearchId(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("SearchId DB오류 : " + err);
		}
	}
	
	public String searchId(String email){
		String sql = "select pat_id from patient_info where pat_email='" + email + "'" ;
		
		try {
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString("pat_id");
			
			return id;
		} 
		catch (Exception err) {
			System.out.println("searchId : " + err);
		} 
		finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		return null;
	}
}
