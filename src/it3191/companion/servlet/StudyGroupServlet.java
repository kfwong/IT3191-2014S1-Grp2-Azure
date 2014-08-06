package it3191.companion.servlet;

import it3191.companion.dao.StudyGroupDao;
import it3191.companion.dto.StudyGroup;
import it3191.companion.dto.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class StudyGroup
 */
@WebServlet("/StudyGroupServlet")
public class StudyGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyGroupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action!= null){
			if(action.equals("getCalendar")){
				ArrayList<StudyGroup> studyGroupArray;
				
				StudyGroupDao dao = new StudyGroupDao();
				studyGroupArray = (ArrayList<StudyGroup>) dao.getAll();
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(studyGroupArray);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
			else if(action.equals("view")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				StudyGroup sg = new StudyGroup();
				
				StudyGroupDao dao = new StudyGroupDao();
				sg = dao.get(id);
				
				User user = (User) request.getSession().getAttribute("user");
				
				Map<String, Object> studyGroup = new HashMap<String, Object>();
				studyGroup.put("id", sg.getId());
				studyGroup.put("title", sg.getTitle());
				studyGroup.put("start", sg.getStart());
				studyGroup.put("end", sg.getEnd());
				studyGroup.put("allDay", sg.isAllDay());
				studyGroup.put("isParticipant", sg.isParticipantExist(user));
				
				List<Map<String, String>> participants = new ArrayList<Map<String, String>>();
				for(User participant : sg.getParticipants()){
					Map<String, String> participantMap = new HashMap<String, String>();
					participantMap.put("id", Integer.toString(participant.getId()));
					participantMap.put("firstName", participant.getFirstName());
					participantMap.put("lastName", participant.getLastName());
					participantMap.put("email", participant.getEmail());
					
					participants.add(participantMap);
				}
				
				studyGroup.put("participants", participants);
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(studyGroup);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
			else{
				request.getRequestDispatcher("404").forward(request, response);
			}
		}
		else{
			request.getRequestDispatcher("/pages/study-group.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action != null){
		
			if(action.equals("create")){
				String title = request.getParameter("title");
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				String allDay = request.getParameter("allDay");
				
				if(allDay != null && allDay.equals(true)){
					//do nothing for now
				}
				
				User user = (User) request.getSession().getAttribute("user");
				
				StudyGroup sd = new StudyGroup();
				sd.setTitle(title);
				sd.setStart(start);
				sd.setEnd(end);
				sd.setAllDay(allDay);
				sd.setCreatedBy(user);
				sd.setCreatedOn(new Date());
				
				StudyGroupDao dao = new StudyGroupDao();
				dao.saveOrUpdate(sd);
			}
			if(action.equals("edit")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				String title = request.getParameter("title");
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				String allDay = request.getParameter("allDay");
				String participantStr = request.getParameter("participant");
				
				StudyGroupDao dao = new StudyGroupDao();
				StudyGroup sd = dao.get(id);
				sd.setId(id);
				sd.setTitle(title);
				sd.setStart(start);
				sd.setEnd(end);
				sd.setAllDay(allDay);

				User user = (User) request.getSession().getAttribute("user");
				
				if(participantStr == null){
					//do nothing for now
				}
				else{
					if(participantStr.equals("true")){
						sd.addParticipant(user);
					}
					else if(participantStr.equals("false")){
						sd.removeParticipant(user);
					}
				}
					
 				dao.saveOrUpdate(sd);
			}
			if(action.equals("delete")){
				int id  = Integer.parseInt(request.getParameter("id"));
				
				StudyGroupDao dao = new StudyGroupDao();
				StudyGroup sd = dao.get(id);
				dao.delete(sd);
			}
		}
		
		response.sendRedirect("study-group");
	}

}
