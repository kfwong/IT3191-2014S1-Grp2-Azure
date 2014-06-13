package it3191.companion.servlet;

import it3191.companion.dao.ActivityDao;
import it3191.companion.dto.Activity;
import it3191.companion.dto.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActivityTest
 */
@WebServlet("/ActivityDemo")
public class ActivityDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityDemo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Activity activity = new Activity();
		ActivityDao activityDao = new ActivityDao();
		System.out.println(request.getParameter("type"));
		switch(Integer.parseInt(request.getParameter("type"))){
			case Activity.LOOKING_FOR_TUTOR:
				activity.setType(Activity.LOOKING_FOR_TUTOR);
				activity.setContent("I'm looking for someone to teach me Mathematics!");
				activity.setUser((User)request.getSession().getAttribute("user"));
				
				
				activityDao.saveOrUpdate(activity);
				break;
			case Activity.FORMED_A_STUDY_GROUP:
				break;
			case Activity.SHARED_A_PROJECT:
				break;
			case Activity.SHARED_A_WRITTEN_ASSIGNENT:
				break;
			case Activity.SHARED_A_STUDY_NOTE:
				activity.setType(Activity.SHARED_A_STUDY_NOTE);
				activity.setContent("Sharing my exam study note to all of you!");
				activity.setUser((User)request.getSession().getAttribute("user"));
				activity.setDropboxPublicUrl(request.getParameter("dropboxPublicUrl"));
				
				activityDao.saveOrUpdate(activity);
				break;
		}
		response.sendRedirect("ActivityDisplay");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
