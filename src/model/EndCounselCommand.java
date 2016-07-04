/*
 * 작성자 : 양진원
 * 설명 : 의사가 환자와 상담한 후 '상담종료'버튼을 눌렀을 때 작동하는 커멘드.
 * 전체 상담대기목록(waitList)에서 방금 상담을 끝낸 환자의 정보를 삭제
 */

package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;

public class EndCounselCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public EndCounselCommand(){
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("EndCounselCommand DB연결 : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = req.getServletContext();
		
		HttpSession session = req.getSession();
		ArrayList<String[]> waitList =  (ArrayList<String[]>)application.getAttribute("waitList");
		String doc_id = (String)session.getAttribute("id");
		String pat_id = (String)req.getParameter("pat_id");
		
		for(int i = 0; i < waitList.size(); i++){
			if(waitList.get(i)[0].equals(doc_id) && waitList.get(i)[1].equals(pat_id)){
				waitList.remove(i);			// waitList에서 해당환자 삭제
				application.setAttribute("waitList", waitList);		// 해당환자를 제거한 waitList를 다시 어플리케이션에 넣음
				break;
			}
		}
		
		String sql = "delete from patient_checklist where pat_id='" + pat_id + "'";
		// 해당환자의 자가진단결과 삭제
		try {	
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.executeUpdate();
				
		} catch (Exception err) {
			System.out.println("deletePatientChecklist : " + err);
		} finally {
			pool.freeConnection(con, stmt);
		}	
		
		return "/control?cmd=COUNSEL";
	}

}
