package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.User;
import it3191.companion.util.Hash;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccountVerification
 */
@WebServlet("/AccountVerification")
public class AccountVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountVerification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao=new UserDao();
		String sessionKey=request.getParameter("sessionKey");
		User user = userDao.getByForgetPasswordSessionKey(sessionKey);
		user.setForgetPasswordSessionKey(null);
		user.setVerified(true);
		userDao.saveOrUpdate(user);	
		response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=verification_successful");	
			
		}
	}

