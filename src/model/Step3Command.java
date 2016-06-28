package model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Step3Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		HttpSession session = req.getSession();
		ServletContext application = req.getServletContext();
		String[] waitPatient = new String[4];				// 현재 환자의 정보를 담을 공간
		ArrayList<String[]> waitList = new ArrayList<>();	// 상담을 기다리는 모든 환자들을 담을 공간
		int count = 1;		// 현재 환자보다 앞에서 대기하고 있는 환자들을 세기 위한 변수
		
		
		// 현재 환자의 정보를 배열에 담음 -> {선택한 의사번호, 환자ID, 환자이름,환자 번호} 
		waitPatient[0] = req.getParameter("doc_num");
		waitPatient[1] = (String)session.getAttribute("id"); 
		waitPatient[2] = (String)session.getAttribute("pat_name");
		waitPatient[3] = (String)session.getAttribute("pat_num");
		// 상담을 기다리고 있는 모든 환자들 목록(waitList)에 추가 -> application
		if(application.getAttribute("waitList") == null){
			waitList.add(waitPatient);
			application.setAttribute("waitList", waitList);

		}
		else{
			// 지금까지의 waitList에 현재 환자의 정보가 들어있는지 확인
			boolean check = false;
			for(int i = 0; i < waitList.size(); i++){
				if(waitList.get(i)[1].equals(session.getAttribute("id"))){
					check = true;
				}
			}
			
			// waitList에 현재 환자의 정보가 없을 때, waitList에 환자 추
			if(check == false){
				waitList = (ArrayList<String[]>)application.getAttribute("waitList");
				waitList.add(waitPatient);
				application.setAttribute("waitList", waitList);
			}
		}		
		
		for(int i = 0; i < waitList.size(); i++){
			if(waitList.get(i)[1].equals(waitPatient[1])){ // 현재 환자의 정보를 만나면 for문 탈출!
				break;		
			}
			else if(waitList.get(i)[0].equals(waitPatient[0])){	
				// waitList에서 현재환자가 상담하고자하는 의사번호(waitPatient[0])와  같은 경우만 count++
				count++;
			}
		}
		
		req.setAttribute("waitCount", count);	
		
		return "/design/main/step3.jsp";
	}

}
