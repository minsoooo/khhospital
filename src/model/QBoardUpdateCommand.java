 /*	메인인덱스 문의하기 게시판 글 수정하기를 눌렀을 때 
 *  비밀번호를 입력받는 페이지로 연결해준다.
 * 	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QBoardUpdateCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/design/board/question_update.jsp";
	}

}
