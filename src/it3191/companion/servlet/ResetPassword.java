package it3191.companion.servlet;

import it3191.companion.dao.UserDao;

import it3191.companion.dto.User;
import it3191.companion.util.Email;
import it3191.companion.util.Hash;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Hex;

import com.sun.org.apache.xml.internal.security.utils.Base64;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao userDao=new UserDao();
		byte[] salt;
		try {
			salt = Hash.getNextSalt();
			String sessionKey=request.getParameter("sessionKey");
			User user = userDao.getByForgetPasswordSessionKey(sessionKey);
			 byte[] bDigest = Hash.getHash(request.getParameter("password"),salt);
		        String sDigest = Hash.byteToBase64(bDigest);
		        String sSalt = Hash.byteToBase64(salt);
				user.setPasswordSHA1(sDigest);
				user.setSalt(sSalt);
			user.setForgetPasswordSessionKey(null);
			userDao.saveOrUpdate(user);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}		
		response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=successfully_update");	
	}

}
