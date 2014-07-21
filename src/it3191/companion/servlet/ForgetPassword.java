package it3191.companion.servlet;

import it3191.companion.dao.UserDao;

import it3191.companion.dto.User;
import it3191.companion.util.Email;

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

/**
 * Servlet implementation class UserUpdate
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.getWriter().println(request.getParameter("sessionKey"));
    	UserDao userDao=new UserDao();
    	String sessionKey=request.getParameter("sessionKey");
    	User user = userDao.getByForgetPasswordSessionKey(sessionKey);
    	if(user==null){
    		response.getWriter().println("User cannot reset the password");
    	}
    	else{
    		response.getWriter().println("User can reset the password");
    		
    	}
    		
    	
    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Retrieve post variable
		String email = request.getParameter("email");
		int securityquestion = Integer.parseInt(request.getParameter("securityquestion"));
		String answer= request.getParameter("answer");
		
		
		//Check against the database against the details
		UserDao userDao=new UserDao();
		User user = userDao.getByEmail(email);		
		
		//1)Check against email, if the email doesn't exist, the user object will be null, so check the null value
		if(user==null){
			response.sendRedirect(this.getServletContext().getContextPath()+"/404");
			System.out.println("user/email does not exist");
		}else{
			if(user.getSecurityQuestion() == securityquestion){
				if(user.getAnswer().equals(answer)){
					MessageDigest md;
					String forgotPasswordSessionKey;
					try {
						md = MessageDigest.getInstance("MD5");
						forgotPasswordSessionKey= Hex.encodeHexString(md.digest(UUID.randomUUID().toString().getBytes()));
						
						user.setForgetPasswordSessionKey(forgotPasswordSessionKey);
						userDao.saveOrUpdate(user);
						Email emailuser=new Email();
			    		emailuser.setFrom("Companion@example.com");
			    		emailuser.setMessage("Thank you for using Companion. Please click on this link to reset your password.<a href=\"http://localhost:8080/IT3191-2014S1-Grp2-Azure/password-reset.jsp?sessionKey="+forgotPasswordSessionKey+"\">Click Here</a> ");
			    		emailuser.setSubject("Reset Your Password");
			    		emailuser.setTo(user.getEmail());
						emailuser.send();
						System.out.println(this.getServletContext().getContextPath()+"/ForgetPassword?sessionKey="+forgotPasswordSessionKey);
						
						response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=email_check");
						
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else{
					response.sendRedirect(this.getServletContext().getContextPath()+"/404");
					System.out.println("answer q is wrong.");
				}
			}else{
				response.sendRedirect(this.getServletContext().getContextPath()+"/404");
				System.out.println("security q is wrong.");
			}
		}
		
		
		
		
		
		
		
	}

}
