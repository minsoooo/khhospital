/*
 *  작성자 : 박민수	
 *  작성일자 : 2016-06-13
 *  설명 : 각 과별로 DB 연결후 값 가져오기. 
 * 	수정일자 : 2016-06-16 - 파라미터 check를 이용해서  호출 위치 알아오기.
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

public class SearchDeptCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;

	public SearchDeptCommand(){
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
			String dept_no = req.getParameter("dept_no");
			req.setAttribute("check", check);
			String sql ="select doc_name, doc_num, dept_name from v_details_Idoc where dept_info_dept_no ='"+dept_no+"' order by dept_name";
			
			DocDto dto = null;
			ArrayList<DocDto> list = new ArrayList<DocDto>();

			try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
	
				while(rs.next()){
					dto = new DocDto();
					dto.setDoc_name(rs.getString("doc_name"));
					dto.setDoc_num(Integer.toString(rs.getInt("doc_num")));
					dto.setDept_name(rs.getString("dept_name"));
					list.add(dto);
					
				}
				req.setAttribute("docList", list);
			}catch(Exception err){
				System.out.println("에러 :" +err);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
		
			return "/design/main/search_result.jsp";
		
		}

	}


