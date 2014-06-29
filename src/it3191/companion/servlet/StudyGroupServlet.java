package it3191.companion.servlet;

import it3191.companion.dao.StudyGroupDao;
import it3191.companion.dto.StudyGroup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
			if(action.equals("view")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				StudyGroup sg = new StudyGroup();
				
				StudyGroupDao dao = new StudyGroupDao();
				sg = dao.get(id);
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(sg);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
			/*if(action.equals("getContacts")){	
				StudyGroupDao sgd = new StudyGroupDao();
				ArrayList<Contact> contactArrayList= (ArrayList<Contact>) cd.getAllByType("school");
				contactArrayList.addAll(cd.getAllByType("scc"));
						
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(contactArrayList);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}*/
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
				//int contactId = Integer.parseInt(request.getParameter("contact"));
				
				//Contact contact = new Contact();
				
				//ContactDao cd = new ContactDao();
				//contact = cd.get(contactId);
				
				if(allDay != null && allDay.equals(true)){
					
				}
				
				StudyGroup sd = new StudyGroup();
				sd.setTitle(title);
				sd.setStart(start);
				sd.setEnd(end);
				sd.setAllDay(allDay);
				//sd.setContact(contact);
				
				StudyGroupDao dao = new StudyGroupDao();
				dao.saveOrUpdate(sd);
			}
			if(action.equals("edit")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				String title = request.getParameter("title");
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				String allDay = request.getParameter("allDay");
				//int contactId = Integer.parseInt(request.getParameter("contact"));
				
				//Contact contact = new Contact();
				
				//ContactDao cd = new ContactDao();
				//contact = cd.get(contactId);
				
				StudyGroup sd = new StudyGroup();
				sd.setId(id);
				sd.setTitle(title);
				sd.setStart(start);
				sd.setEnd(end);
				sd.setAllDay(allDay);
				//sd.setContact(contact);
				
				StudyGroupDao dao = new StudyGroupDao();
				dao.saveOrUpdate(sd);
			}
			if(action.equals("delete")){
				int id  = Integer.parseInt(request.getParameter("id"));
				StudyGroup sd = new StudyGroup();
				sd.setId(id);
				
				StudyGroupDao dao = new StudyGroupDao();
				dao.delete(sd);
			}
		}
		
		response.sendRedirect("study-group");
	}

}
