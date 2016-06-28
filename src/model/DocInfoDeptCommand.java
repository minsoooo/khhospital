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

public class DocInfoDeptCommand implements Command {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool = null;

	public DocInfoDeptCommand(){
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
			String where =req.getParameter("where");
			String dept_no = req.getParameter("dept_no");
			String sql ="select doc_name, dept_name, doc_part,doc_img,doc_num from v_details_Idoc where dept_info_dept_no ='"+dept_no+"' order by dept_name";
			
			DocDto dto = null;
			ArrayList<DocDto> list = new ArrayList<DocDto>();

			try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
	
				while(rs.next()){
					dto = new DocDto();
					dto.setDoc_name(rs.getString("doc_name"));
					dto.setDoc_part(rs.getString("doc_part"));
					dto.setDept_name(rs.getString("dept_name"));
					dto.setDoc_num(rs.getString("doc_num"));
					if(rs.getString("doc_img")==null){
						dto.setDoc_img("default.jpg");
					}else{
						dto.setDoc_img(rs.getString("doc_img"));			
					}
					list.add(dto);
				}
				req.setAttribute("docList", list);
			}catch(Exception err){
				System.out.println("에러 :" +err);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			if(where.equals("surg")){
				return "/design/dept/surgery/doc_info_surg.jsp";
			}else if(where.equals("inter")){
				return "/design/dept/internal/doc_info_inter.jsp";
			}else if(where.equals("dent")){
				return "/design/dept/dent/doc_info_dent.jsp";
			}else if(where.equals("skin")){
				return "/design/dept/skin/doc_info_skin.jsp";
			}else if(where.equals("opti")){
				return "/design/dept/opti/doc_info_opti.jsp";
			}else if(where.equals("psy")){
				return "/design/dept/psy/doc_info_psy.jsp";
			}else{
				return "/design/main/doc_info_dept.jsp";
			}
		
		}

	}


