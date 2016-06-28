/*
 *  작성자 : 박민수	
 *  작성일 : 2016-06-17
 *  설명 : keyword 별로 처리후 검색 하여 의사 정보 뿌려주는 커맨드 
 * 
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

import bean.DocDto;
import dbcp.DBConnectionMgr;

public class SearchResultCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;

	public SearchResultCommand(){
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
			
			String check = req.getParameter("check");
			String search = req.getParameter("search");
			String keyword = req.getParameter("keyword");
			//검색 날짜 파싱하기 
			String searchYear ="";
			String searchMonth ="";
			String searchDay ="";
			String work_month ="";
			String totalwork="";
			// DB 컬럼 검색을 위한 날짜 파싱
			if(keyword.equals("날짜")){
				 searchYear = search.split("/")[0];
				 searchMonth = search.split("/")[1];
				 searchDay = search.split("/")[2];
				 work_month = searchYear+"/"+searchMonth;
			}
			req.setAttribute("check", check);
			String sql ="select doc_name, doc_num, dept_name from v_details_Idoc order by dept_name";
			
			DocDto dto = null;
			ArrayList<DocDto> list = new ArrayList<DocDto>();
			if(!search.equals("")){
				if(keyword.equals("이름")){
					sql ="select doc_name, doc_num, dept_name from v_details_Idoc where doc_name like '%"+search+"%' order by dept_name";
				}else if(keyword.equals("진료과")){
					sql ="select doc_name, doc_num, dept_name from v_details_Idoc where dept_name ='"+search+"' order by dept_name";
				}else if(keyword.equals("날짜")){
					sql = "select work_m_days, work_a_days, doc_name, doc_num, dept_name from v_details_Wdoc where work_month='"+work_month+"' order by dept_name";
				}
			}
			try{
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();	
				if(keyword.equals("날짜")){
					// 날짜 값을 다 가져와서 가지고 있는 애들을 판단
					while(rs.next()){
						dto = new DocDto();
						totalwork = rs.getString("work_m_days")+rs.getString("work_a_days");
						String[] Sdays =totalwork.split("/");
						//가져온 의사 정보중 해당 날짜를 가지고 있으면 리스트에 담기.
						for(int i =0; i<Sdays.length;i++){
							if(Sdays[i].equals(searchDay)){
								dto.setDoc_name(rs.getString("doc_name"));
								dto.setDoc_num(Integer.toString(rs.getInt("doc_num")));
								dto.setDept_name(rs.getString("dept_name"));
								list.add(dto);
							}
						}					
					}
					req.setAttribute("docList", list);
				}else{		
					while(rs.next()){
						dto = new DocDto();
						dto.setDoc_name(rs.getString("doc_name"));
						dto.setDoc_num(Integer.toString(rs.getInt("doc_num")));
						dto.setDept_name(rs.getString("dept_name"));
						list.add(dto);
							
					}
					req.setAttribute("docList", list);
				}
			}catch(Exception err){
				System.out.println("에러 :" +err);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			if(check.equals("SEARCHWORK")){
				return "/design/main/search_result.jsp";
			}else if(check.equals("RESERVE")){
				return "/design/main/search_result.jsp";
			}else{
				return "/design/mgr/search_result.jsp";
			}
		}

	}


