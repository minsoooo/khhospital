
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
		
		ArrayList<String[]> myWaitList = new ArrayList<>();	
		
		String id = (String)session.getAttribute("id");		
		
		if(waitList != null){
			for(int i = 0; i < waitList.size(); i++){
				if(waitList.get(i)[0].equals(id)){				
					String[] myPatient = new String[4];			
					
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
