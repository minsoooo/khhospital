package model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		ServletContext application = req.getServletContext();
		
		if(session.getAttribute("user").equals("doctor")){
			// 의사가 로그아웃할 때, 접속중인 의사목록에서 제거
			ArrayList<String> doctors = (ArrayList<String>)application.getAttribute("doctors");		

			if(doctors != null){
				for(int i = 0; i < doctors.size(); i++){
					if(session.getAttribute("id").equals(doctors.get(i))){
						doctors.remove(i);
						application.setAttribute("doctors", doctors);	// 해당 의사를 제거한 접속의료진 목록(doctors)을 다시 어플리케이션에 넣음
						break;
					}
				}
			}
		}
		
		else if(session.getAttribute("user").equals("doctor")){
			// 환자가 로그아웃할 때
			ArrayList<String[]> waitList = (ArrayList<String[]>)application.getAttribute("waitList");
			
			if(waitList != null){
				// waitList에 있으면 해당 환자 제거
				for(int i = 0; i < waitList.size(); i++){
					if(session.getAttribute("id").equals(waitList.get(i)[1])){
						waitList.remove(i);
						application.setAttribute("waitList", waitList);		// 해당환자를 제거한 waitList를 다시 어플리케이션에 넣음
						break;
					}
				}			
			}
		}
		
		session.invalidate();		
		
		return "/control?cmd=INDEX";
	}

}
