/*
 *  작성자 : 박민수	
 *  작성일 : 2016-06-14
 *  설명 : 의사의 근무 테이블과 예약 테이블을 비교하여 예약인원이 5명 이하인 날짜와/ 오늘날짜 이후 날짜를 판단하여
 *  전송 해주는 커맨드.
 * 
 * 	수정자: 박민수
 *  수정일 : 2016-06-21
 *  설명 : 각 과로 부터 오는 요청을 구분하기 위헤 where 파라미터 사용 
 * 
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
import dbcp.DBConnectionMgr;

public class ReserveCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	
	public ReserveCommand(){
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
				DocDto dto = null;
				String where = req.getParameter("where");
				String doc_num =req.getParameter("doc_num");
				String now_month = req.getParameter("now_month");
				String now_year =req.getParameter("now_year");
				String checkNew = req.getParameter("checkNew");
				String work_month = now_year+"/"+now_month;
				String res_days="";
				if(now_month.length()<2){
					work_month =now_year+"/0"+now_month;
					// 형식 맞춰주기.
				}
				String check = req.getParameter("check");
				req.setAttribute("check", check);
				if(checkNew != null){
					String upSql = "insert into doc_work values('0','0',?,?)";
					try{
						con = pool.getConnection();
						stmt = con.prepareStatement(upSql);
						stmt.setString(1, work_month);
						stmt.setString(2, doc_num);
						stmt.executeUpdate();
					}catch(Exception err){
						err.printStackTrace();
					}
				}
				
				String sql = "select work_m_days, Work_A_days, work_month, doc_name, dept_name, doc_img, doc_part from v_details_Wdoc where doc_num=? and"
						+ " work_month=?";
				String sql2 ="select res_date from reservation where "
						+"res_year =? and doc_info_doc_num =?";
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					stmt.setString(1, doc_num);
					stmt.setString(2, work_month);
					rs = stmt.executeQuery();
					while(rs.next()){
						dto = new DocDto();
						dto.setDept_name(rs.getString("dept_name"));
						dto.setDoc_name(rs.getString("doc_name"));
						dto.setWork_a_days(rs.getString("work_a_days"));
						dto.setWork_m_days(rs.getString("work_m_days"));
						dto.setDoc_part(rs.getString("doc_part"));
						if(rs.getString("doc_img")!= null){
							dto.setDoc_img(rs.getString("doc_img"));
						}else{
							dto.setDoc_img("default.jpg");
						}
						dto.setNow_month(now_month);
						dto.setNow_year(now_year);
						dto.setDoc_num(doc_num);
					}
					stmt = con.prepareStatement(sql2);
					stmt.setString(1, work_month);
					stmt.setString(2, doc_num);
					rs = stmt.executeQuery();
					
					// 하루에 환자 5명 만 받기 위한 판단. for문
					while(rs.next()){
						res_days+="/"+rs.getString("res_date");
					}
						String[] days = res_days.split("/");
					 	String date ="";
					 	for(int i=0; i<days.length;i++){
					 		int cnt =0;
					 		for(int j=0; j<days.length;j++){
					 			if (days[i].equals(days[j])){
					 				cnt++;
					 				if(cnt== 5){
					 					date += "/" +days[i];
					 				}
					 			}
					 		}
					 	}
					dto.setRes_days(date);
					req.setAttribute("work", dto);
				}catch(Exception err){
					err.printStackTrace();
				}finally{
					pool.freeConnection(con, stmt, rs);
				}
				if(where.equals("surg")){
					return "/design/dept/surgery/surg_reserve.jsp";
				}else if(where.equals("inter")){
					return "/design/dept/internal/inter_reserve.jsp";
				}else if(where.equals("dent")){
					return "/design/dept/dent/dent_reserve.jsp";
				}else if(where.equals("skin")){
					return "/design/dept/skin/skin_reserve.jsp";
				}else if(where.equals("opti")){
					return "/design/dept/opti/opti_reserve.jsp";
				}else if(where.equals("psy")){
					return "/design/dept/psy/psy_reserve.jsp";
				}else{
					return "/design/main/reserve.jsp";
				}	
		
				
		}

}
