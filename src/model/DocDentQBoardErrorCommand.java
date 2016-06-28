/*	치과 온라인질문 에러페이지
 * 	글 수정이나 삭제시 비밀번호를 입력하는데, DB의 입력된 번호가 아니라면
 *  비밀번호 입력이 틀렸다고 인식시켜주는 페이지
 *	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DocDentQBoardErrorCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/design/doctor/dent/doc_dent_question_error.jsp";
	}

}
