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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ResDto;
import dbcp.DBConnectionMgr;

public class ReserveProcCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	
	public ReserveProcCommand(){
		try{
			pool= DBConnectionMgr.getInstance();
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
				req.setCharacterEncoding("euc-kr");
				resp.setCharacterEncoding("euc-kr");
				// 파라미터 가져오기.
				ResDto dto = null;
				String doc_num =req.getParameter("doc_num");
				String now_month = req.getParameter("now_month");
				String now_year =req.getParameter("now_year");
				String pat_num = req.getParameter("pat_num");
				String res_date = req.getParameter("res_date");
				String res_type = req.getParameter("res_type");
				String work_month = now_year+"/"+now_month;
				System.out.println(res_type);
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
					
					// 예약정보 가져오는 SQL문 
					String sql2 ="select res_num, doc_name, doc_part, dept_name"
							+ ",pat_name, res_year, res_date,res_type from v_details_reserve where patient_info_pat_num=? and"
							+ " res_date =? and doc_info_doc_num=? ";
					stmt = con.prepareStatement(sql2);
					stmt.setString(1, pat_num);
					stmt.setString(2, res_date);
					stmt.setString(3, doc_num);
					rs = stmt.executeQuery();
					//DB연결 
					while(rs.next()){
						dto = new ResDto();
						dto.setRes_num(rs.getString("res_num"));
						dto.setDoc_name(rs.getString("doc_name"));
						dto.setDoc_part(rs.getString("doc_part"));
						dto.setDept_name(rs.getString("dept_name"));
						dto.setPat_name(rs.getString("pat_name"));
						dto.setRes_date(rs.getString("res_date"));
						dto.setRes_year(rs.getString("res_year").split("/")[0]);
						dto.setRes_month(rs.getString("res_year").split("/")[1]);
						// 예약 타입 판단후 값 담기.
						if(rs.getString("res_type").equals("a")){
							dto.setRes_type("오후");
						}else{
							dto.setRes_type("오전");
						}
						
				
					}
					req.setAttribute("reserve", dto);
				}catch(Exception err){
					err.printStackTrace();
				}finally{
					pool.freeConnection(con, stmt,rs);
				}
	
				return "/design/main/reserve_result.jsp";
				
		}

}
