/*
 * �ۼ��� : ������
 * ���� : �ǻ簡 ȯ�ڿ� ����� �� '�������'��ư�� ������ �� �۵��ϴ� Ŀ���.
 * ��ü �������(waitList)���� ��� ����� ���� ȯ���� ������ ����
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
			System.out.println("EndCounselCommand DB���� : " + err);
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
				waitList.remove(i);			// waitList���� �ش�ȯ�� ����
				application.setAttribute("waitList", waitList);		// �ش�ȯ�ڸ� ������ waitList�� �ٽ� ���ø����̼ǿ� ����
				break;
			}
		}
		
		String sql = "delete from patient_checklist where pat_id='" + pat_id + "'";
		// �ش�ȯ���� �ڰ����ܰ�� ����
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
