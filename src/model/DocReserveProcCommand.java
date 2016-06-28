/*
 *  작성자 : 박민수
 *  작성일자: 2016-06-16
 * 	설명 : 환자예약 DB 연결 및 값 가져오기
 * 	
 */


package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DocDto;
import bean.ResDto;
import dbcp.DBConnectionMgr;

public class DocReserveProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	
	public DocReserveProcCommand(){
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
				Calendar cal = Calendar.getInstance();
				int today = cal.get(Calendar.DATE);
				req.setAttribute("today", today);	
		
				req.setCharacterEncoding("euc-kr");
				resp.setCharacterEncoding("euc-kr");
				// 파라미터 가져오기.
				DocDto dto = null;
				
				String doc_num =req.getParameter("doc_num");
				String now_month = req.getParameter("now_month");
				String now_year =req.getParameter("now_year");
				String pat_num = req.getParameter("pat_num");
				String res_date = req.getParameter("res_date");
				String res_type = req.getParameter("res_type");
				String work_month = now_year+"/"+now_month;
				if(now_month.length()<2){
					work_month =now_year+"/0"+now_month;
					// WorkMonth 형식 맞춰주기.
				}
				//예약 등록 SQL 문
				String sql = "insert into reservation(res_date, res_year, Patient_info_pat_num, "
						+ "doc_info_doc_num,res_type) values(?,?,?,?,?)";
				
				//DB 연결
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					stmt.setString(1, res_date);
					stmt.setString(2, work_month);
					stmt.setString(3, pat_num);
					stmt.setString(4, doc_num);
					stmt.setString(5, res_type);
					stmt.executeUpdate();
					dto = new DocDto();
					
					dto.setNow_month(now_month);
					dto.setNow_year(now_year);
					dto.setRes_days(res_date);
					if(res_type.equals("a")){
						req.setAttribute("type", "오후");
					}else{
						req.setAttribute("type", "오전");
					}
					req.setAttribute("result", dto);
				}catch(Exception err){
					err.printStackTrace();
				}finally{
					pool.freeConnection(con, stmt,rs);
				}
	
				return "/design/doctor/doc_resdone.jsp";
				
				}

}
