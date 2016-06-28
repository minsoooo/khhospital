/*	내과 온라인질문 글 쓰기를 눌렀을 때 
 *  글쓰기 내용을 입력하는 페이지로 연결해준다.
 * 	작성자 - 백규하
 *	작성일 - 2016-06-16
 */
package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DocInterQBoardWriteCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		return "/design/doctor/internal/doc_inter_question_write.jsp";
	}

}
