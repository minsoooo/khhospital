/*
 * 작성자 : 양진원
 * 설명 : 의사가 의사페이지에서 '실시간 상담'메뉴를 누르면 작동하는 커멘드.
 * 전체 상담대기목록(waitLis) 중 나와의 상담을 기다리는 환자들의 목록(myWaitList)을 보내줌
 */

package model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CounselCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		ServletContext application = req.getServletContext();
		
		ArrayList<String[]> waitList = (ArrayList<String[]>) application.getAttribute("waitList");
		// waitList는 {의사번호, 환자ID, 환자이름, 환자번호} 형식, 전체 waitList
		
		ArrayList<String[]> myWaitList = new ArrayList<>();	// 현재 접속한 의사를 기다리는 환자들의 대기목록을 담을 공간
		
		String id = (String)session.getAttribute("id");		// 현재 접속한 의사ID		
		
		if(waitList != null){
			for(int i = 0; i < waitList.size(); i++){
				if(waitList.get(i)[0].equals(id)){				// waitList중 현재 접속한 의사를 기다리는 환자일 경우
					String[] myPatient = new String[4];			// 현재 접속한 의사를 기다리는 각각 환자 정보를 담을 공간
					
					myPatient[0] = waitList.get(i)[0];
					myPatient[1] = waitList.get(i)[1];
					myPatient[2] = waitList.get(i)[2];	
					myPatient[3] = waitList.get(i)[3];					
					
					myWaitList.add(myPatient);
				}
			}
		}			
		
		if(myWaitList != null){
			
			System.out.println(myWaitList.size());
		}
		
		req.setAttribute("count", myWaitList.size());
		req.setAttribute("myWaitList", myWaitList);
		
		return "/design/doctor/counsel.jsp";
	}

}
