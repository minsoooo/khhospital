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
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ResDto;
import dbcp.DBConnectionMgr;

public class MyReserveCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	
	public MyReserveCommand(){
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
				// 지금 접속한 환자 번호  가져오기.
				HttpSession session = req.getSession();
				String pat_num = (String)session.getAttribute("pat_num");
				
				ArrayList<ResDto> list = new ArrayList<ResDto>();
				ResDto dto = null;
				// 예약정보 가져오는 SQL문 
				String sql ="select res_num, doc_name, doc_part, dept_name"
						+ ",pat_name, res_year, res_date,res_type from v_details_reserve where patient_info_pat_num=?";
				//DB 연결
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					stmt.setString(1, pat_num);
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
						//dto 리스트에 담기 
						list.add(dto);
					}
					req.setAttribute("resList", list);
				}catch(Exception err){
					err.printStackTrace();
				}finally{
					pool.freeConnection(con, stmt,rs);
				}	
				return "/design/main/my_reservation.jsp";
				
		}

}
