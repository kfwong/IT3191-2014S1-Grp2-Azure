package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.Role;
import it3191.companion.dto.User;
import it3191.companion.util.Hash;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.net.URLCodec;
import org.apache.commons.io.IOUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.sun.org.apache.xml.internal.security.utils.Base64;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	
	private static final Logger log = LogManager.getLogger(UserRegistration.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String accessToken = null;
			Integer expires = null;

			it3191.companion.dto.User user = new User();
			UserDao userDao = new UserDao();
			
			URLCodec urlCodec = new URLCodec();
        	
        	String redirectURI = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/UserRegistration?type=facebook";

			InputStream inputStream = new URL("https://graph.facebook.com/oauth/access_token?client_id=390095387796223&redirect_uri="+urlCodec.encode(redirectURI)+"&client_secret=9503acd1dc6276b1bf64673d0fb4db7e&code=" + request.getParameter("code")).openStream();
			try {
				String[] pairs = IOUtils.toString(inputStream).split("&");
				for (String pair : pairs) {
					String[] kv = pair.split("=");
					if (kv.length != 2) {
						throw new RuntimeException("Unexpected auth response");
					} else {
						if (kv[0].equals("access_token")) {
							accessToken = kv[1];
						}
						if (kv[0].equals("expires")) {
							expires = Integer.valueOf(kv[1]);
						}
					}
				}

				FacebookClient facebookClient = new DefaultFacebookClient(accessToken);
				com.restfb.types.User fbUser = facebookClient.fetchObject("me", com.restfb.types.User.class);

				user.setFacebookId(fbUser.getId());
				user.setFirstName(fbUser.getFirstName());
				user.setLastName(fbUser.getLastName());
				user.setEmail(fbUser.getEmail());
				user.setGender(fbUser.getGender());
								
				if (userDao.isExist(user)) {
					log.warn("Client failed to register with existing Facebook ID \"" + user.getFacebookId() + "\".");
					response.sendRedirect(this.getServletContext().getContextPath()+"/register?info=registration_failed");
				} else {
					userDao.saveOrUpdate(user);
					log.info("Client with email \""+user.getEmail()+"\" and Facebook ID " + user.getFacebookId() +" registered successfully"+".");
					response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=registration_successful");
				}
			} catch (NullPointerException ex) {
				log.warn("Client failed to register with invalid Facebook ID.");
				response.sendRedirect(this.getServletContext().getContextPath()+"/register?info=registration_failed");
			} finally {
				IOUtils.closeQuietly(inputStream);
			}
		} catch (Exception ex) {
			log.error("User login operation aborted due to application error. "+ ex.getMessage());
			response.sendRedirect(this.getServletContext().getContextPath()+"/register?info=registration_failed");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		switch (request.getParameter("type")) {
			case "normal":
				String remoteAddr = request.getRemoteAddr();
				ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
				reCaptcha.setPrivateKey("6LduAvYSAAAAAGto0ISKfxATI9iATrIrbCX1jQlz");

				String challenge = request.getParameter("recaptcha_challenge_field");
				String uresponse = request.getParameter("recaptcha_response_field");
				ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

				if (reCaptchaResponse.isValid()) {
					User user = new User();
					UserDao userDao = new UserDao();

					user.setFirstName(request.getParameter("firstname"));
					user.setLastName(request.getParameter("lastname"));
					user.setEmail(request.getParameter("email"));
					user.setGender(request.getParameter("gender"));
					user.setHandphoneNo(request.getParameter("handphone"));
					user.setPasswordSHA1(Base64.encode(Hash.hash(request.getParameter("password").toCharArray(), Hash.getNextSalt())));
					user.setSalt(Base64.encode(Hash.getNextSalt()));
					user.setSecurityQuestion(Integer.parseInt(request.getParameter("securityquestion")));
					user.setAnswer(request.getParameter("answer"));
					
					//testing rbac
					if(user.getEmail().equals("admin@gmail.com")){
						user.setRole(Role.ADMIN);
					}
					else{
						user.setRole(Role.REGULAR);
					}
					//end of testing

					if (userDao.isExist(user)) {
						log.warn("Client from " + request.getRemoteAddr() +" failed to register with an existing email \""+request.getParameter("email")+"\".");
						response.sendRedirect(this.getServletContext().getContextPath()+"/register?info=registration_failed");

					} else {
						userDao.saveOrUpdate(user);
						log.info("Client from " + request.getRemoteAddr() +" successfully registered with email \""+request.getParameter("email")+"\".");
						response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=registration_successful");
					}
				} else {
					log.warn("Client from " + request.getRemoteAddr() +" failed the captcha test.");
					response.sendRedirect(this.getServletContext().getContextPath()+"/register.jsp");
				}

				break;
			case "facebook":
				try{
					if (request.getParameter("error") != null) {
						log.warn("Client from " + request.getRemoteAddr() +" failed to initiate facebook OAuth. " + request.getParameter("error") + ".");
						response.sendRedirect(this.getServletContext().getContextPath()+"/register?info=registration_failed");
					} else if (request.getParameter("code") == null) {
						
						URLCodec urlCodec = new URLCodec();
			        	
			        	String redirectURI = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/UserRegistration?type=facebook";
			        	
						response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id=390095387796223&response_type=code&redirect_uri="+urlCodec.encode(redirectURI)+"&scope=email,user_about_me,user_birthday,user_friends,user_hometown,user_location,user_relationship_details,user_relationships,user_religion_politics,user_website");
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}
				break;
			default:
				log.warn("Client from " + request.getRemoteAddr() +" attempting invalid registration method.");
				response.sendRedirect(this.getServletContext().getContextPath()+"/register?info=registration_failed");
				break;
		}
	}
}
