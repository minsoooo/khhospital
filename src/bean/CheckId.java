package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class CheckId {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public CheckId(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("CheckId DB¿¬°á : " + err);
		}
	}
	
	public String checkId(String id){
		String check = "true";
		String sql = "select * from patient_info where pat_id='" + id + "'";
		
		try {
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				check = "false";
			}
			else{
				check = "true";
			};
		} 
		catch (Exception err) {
			System.out.println("checkId : " + err);
		} 
		finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		return check;
	}
}
