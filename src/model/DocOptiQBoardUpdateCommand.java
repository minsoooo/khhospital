/*	안과 온라인 질문 글 수정하기를 눌렀을 때 
 *  비밀번호를 입력받는 페이지로 연결해준다.
 * 	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DocOptiQBoardUpdateCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/design/doctor/opti/doc_opti_question_update.jsp";
	}
}
