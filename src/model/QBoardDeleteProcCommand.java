/*  메인인덱스 문의하기 게시판  글 삭제  DB연결부분
 * 	작성 글 번호를 전달받은 후, 
 *  비밀번호가 일치하면 삭제하고, 일치하지않으면 에러페이지로 전송한다.
 *  번호로 삭제하고 원래 글 목록으로 돌아간다.
 *	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;

public class QBoardDeleteProcCommand implements Command {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public QBoardDeleteProcCommand(){
		try{			
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("QBoardDeleteProcCommand : " + err);
		}
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		String realpass = req.getParameter("realpass");
		String userpass = req.getParameter("userpass");		
		String url = "";
				
		if(realpass.equals(userpass)){
			try {
				String sql = "delete from QBoard_main where qb_num_main=" + num;
							
				con = pool.getConnection();
			    stmt =  con.prepareStatement(sql);
			    stmt.executeUpdate();
			}
			
			catch (Exception e) {			
				System.out.println("QBoardDeleteCommand : " + e);
			}
			finally{
				 pool.freeConnection(con,stmt);
			}
			
			url = "/control?cmd=QBOARDMAIN&nowPage=0&nowBlock=0";
		}
		
		else{
			url = "/control?cmd=QBOARDERROR&num="+num;
		}
		
		return url;
	}

}
