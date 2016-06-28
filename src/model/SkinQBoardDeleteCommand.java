/*	피부과 온라인질문 게시판 글 삭제 비밀번호 확인
 * 	글삭제 버튼을 눌렀을 때 비밀번호를 매칭할 수 있는 페이지로 간다.
 *	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SkinQBoardDeleteCommand implements Command {
		
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/design/dept/skin/skin_question_delete.jsp";
	}

}
