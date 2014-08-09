package it3191.companion.servlet;

import it3191.companion.dao.StudyGroupDao;
import it3191.companion.dao.UserDao;
import it3191.companion.dto.StudyGroup;
import it3191.companion.dto.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * Servlet implementation class UserManagementServlet
 */
@WebServlet("/UserManagementServlet")
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action!= null){
			if(action.equals("getUsers")){
				ArrayList<User> userArray;
				
				UserDao dao = new UserDao();
				userArray = (ArrayList<User>) dao.getAll();
				
				List<Map<String,Object>> jsonArray = new ArrayList<Map<String,Object>>();
				
				for(User user:userArray){
					Map<String,Object> userMap = new HashMap<String,Object>();
					userMap.put("id", user.getId());
					userMap.put("role", user.getRole());
					userMap.put("firstName", user.getFirstName());
					userMap.put("lastName", user.getLastName());
					userMap.put("email", user.getEmail());
					userMap.put("isVerified", user.isVerified());
					
					jsonArray.add(userMap);
				}
								
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(jsonArray);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
		}
		else{
			request.getRequestDispatcher("pages/admin/user-management.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action!= null){
			
		}
		
		response.sendRedirect("user-management");
	}
}
