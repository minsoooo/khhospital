/*
 *  작성자 : 박민수	
 *  작성일 : 2016-06-14
 *  설명 : 의사의 근무 테이블과 예약 테이블을 비교하여 예약인원이 5명 이하인 날짜와/ 오늘날짜 이후 날짜를 판단하여
 *  전송 해주는 커맨드.
 * 
 * 
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
import javax.servlet.http.HttpSession;

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class MyWorkCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;
	
	
	public MyWorkCommand(){
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
				DocDto dto = null;
				HttpSession session = req.getSession();
				String doc_num=(String)session.getAttribute("doc_num");
				String now_month = req.getParameter("now_month");
				
				String now_year =req.getParameter("now_year");
				String checkNew = req.getParameter("checkNew");
				String work_month = now_year+"/"+now_month;
				if(now_month.length()<2){
					work_month =now_year+"/0"+now_month;
					// 형식 맞춰주기.
				}
				String check = req.getParameter("check");
				req.setAttribute("check", check);
				// 등록 되있지 않은 근무월은 새로 생성해준다.
				// DB상에 Primary 키로 등록 되 있기 때문에 이미 있으면 생성 안됨
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
				try{
					System.out.println("work_month" + work_month);
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
						// 의사 이미지 가져오기, 이미지가 없으면 default 값을 입력한다.
						if(rs.getString("doc_img")!= null){
							dto.setDoc_img(rs.getString("doc_img"));
						}else{
							dto.setDoc_img("default.jpg");
						}
						dto.setNow_month(now_month);
						dto.setNow_year(now_year);
						dto.setDoc_num(doc_num);
					}
					req.setAttribute("work", dto);
				}catch(Exception err){
					err.printStackTrace();
				}finally{
					pool.freeConnection(con, stmt, rs);
				}
					
		
				return "/design/doctor/mywork.jsp";
				
		}

}
