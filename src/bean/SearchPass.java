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
			System.out.println("SearchPass DB연결  : " + err);
		}
	}
	
	public String searchPass(String id, String question, String answer){
		String sql = "select pat_pass from patient_info where pat_id='" + id + "' and pat_question='" + question + "' and pat_answer='" + answer + "'";
		CipherDao cipher = new CipherDao();
		try {
			con = pool.getConnection();			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			rs.next();
			
			String pass = rs.getString("pat_pass");
			
			if(pass != null){
				pass = cipher.getNewPass();
				sql ="update patient_info set pat_pass=? where pat_id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, pass);
				stmt.setString(2, id);
				stmt.executeUpdate();
			}
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
