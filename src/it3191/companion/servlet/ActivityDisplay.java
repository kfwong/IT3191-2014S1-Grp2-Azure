package it3191.companion.servlet;

import it3191.companion.dao.ActivityDao;
import it3191.companion.dto.Activity;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActivityDisplay
 */
@WebServlet("/ActivityDisplay")
public class ActivityDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityDisplay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityDao activityDao = new ActivityDao();
		List<Activity> activities = activityDao.getAll();
		
		request.setAttribute("activities", activities);
		
		request.getRequestDispatcher("activity").forward(request, response);
	}

}
