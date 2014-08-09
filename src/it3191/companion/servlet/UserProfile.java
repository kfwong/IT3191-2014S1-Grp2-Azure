package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserProfile
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userdao=new UserDao();
		User userprofile=new User();
		User sessionUser = (User)request.getSession().getAttribute("user");
		userprofile=userdao.get(sessionUser.getId());
		request.setAttribute("userprofile", userprofile);
		
		request.getRequestDispatcher("pages/user-profile.jsp").forward(request, response);
	}


}
