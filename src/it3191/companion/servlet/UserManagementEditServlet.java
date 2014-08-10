package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.Role;
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
 * Servlet implementation class UserManagementEditServlet
 */
@WebServlet("/UserManagementEditServlet")
public class UserManagementEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delete = request.getParameter("delete");
				
		if(delete != null && delete.equals("true")){
			
		}
		else{
			
		}
		
		String action = request.getParameter("action");
		
		if(action!= null){
			/*if(action.equals("getUsers")){
				String[] idArray = null;
				idArray = request.getParameterValues("id");
				if(idArray != null){
					ArrayList<Integer> idArrayList = new ArrayList<Integer>();
					for(int i=0; i<idArray.length; i++){
						idArrayList.add(Integer.parseInt(idArray[i]));
					}
					
					ArrayList<User> userArray = new ArrayList<User>();
					
					UserDao dao = new UserDao();

					for(Integer eachUserId:idArrayList){
						userArray.add(dao.get(eachUserId));
					}
					
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
			}*/
		}
		else{
			request.getRequestDispatcher("/pages/admin/user-management-edit.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] idArray = null;
		idArray = request.getParameterValues("id");
		ArrayList<Integer> idArrayList = new ArrayList<Integer>();
		for(int i=0; i<idArray.length; i++){
			idArrayList.add(Integer.parseInt(idArray[i]));
		}
		
		String [] roleArray = request.getParameterValues("role");
		
		for(int i=0; i<idArrayList.size(); i++){
			UserDao dao = new UserDao();
			User user = dao.get(idArrayList.get(i));

			if(roleArray[i].equals("REGULAR")){
				user.setRole(Role.REGULAR);
			}
			else if(roleArray[i].equals("ADMIN")){
				user.setRole(Role.ADMIN);
			}

			dao.saveOrUpdate(user);
		}
		
		response.sendRedirect("user-management");
		
	}
}
