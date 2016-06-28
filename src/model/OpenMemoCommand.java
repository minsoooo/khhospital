/*
 *  작성자 :박민수
 *  작성일 :2016-06-20
 * 	설명 : momo 페이지 연결/ 환자 아이디 넘겨주기 
 */
package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OpenMemoCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pat_num = req.getParameter("pat_num");
		req.setAttribute("pat_num", pat_num);
		
		return "/design/doctor/memo.jsp";
	}

}
