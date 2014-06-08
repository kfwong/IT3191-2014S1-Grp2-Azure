package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.User;
import it3191.companion.util.Hash;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.sun.org.apache.xml.internal.security.utils.Base64;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final Random random = new SecureRandom();
    private static final int ITERATIONS = 10000;
    private static final int KEY_LENGTH = 256;

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

			InputStream inputStream = new URL("https://graph.facebook.com/oauth/access_token?client_id=390095387796223&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FIT3191-2014S1-Grp2-Azure%2FUserRegistration%3Ftype%3Dfacebook&client_secret=9503acd1dc6276b1bf64673d0fb4db7e&code=" + request.getParameter("code")).openStream();
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
					response.sendRedirect("register?info=registration_failed");
				} else {
					userDao.saveOrUpdate(user);
					response.sendRedirect("login?info=registration_successful");
				}
			} catch (NullPointerException ex) {
				response.sendRedirect("register?info=registration_failed");
			} finally {
				IOUtils.closeQuietly(inputStream);
			}
		} catch (IOException ex) {
			response.sendRedirect("register?info=registration_failed");
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		switch (request.getParameter("type")) {
			case "normal":
				User user = new User();
				UserDao userDao = new UserDao();

				user.setFirstName(request.getParameter("firstname"));
				user.setLastName(request.getParameter("lastname"));
				user.setEmail(request.getParameter("email"));
				user.setGender(request.getParameter("gender"));
				user.setHandphoneNo(request.getParameter("handphone"));
				// Hash.hash(rq.getpr("ps").tochray, Hash.getnextsalt)
				user.setPasswordMD5(Base64.encode(Hash.hash(request.getParameter("password").toCharArray(), Hash.getNextSalt())));
				user.setPasswordSHA1(Base64.encode(Hash.hash(request.getParameter("password").toCharArray(), Hash.getNextSalt())));
				user.setPasswordHash(Base64.encode(Hash.hash(request.getParameter("password").toCharArray(), Hash.getNextSalt())));

				if (userDao.isExist(user)) {
					response.sendRedirect("register?info=registration_failed");
				} else {
					userDao.saveOrUpdate(user);
					response.sendRedirect("login?info=registration_successful");
				}

				break;
			case "facebook":
				if (request.getParameter("error") != null) {
					response.sendRedirect("register?info=registration_failed");
				} else if (request.getParameter("code") == null) {
					response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id=390095387796223&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FIT3191-2014S1-Grp2-Azure%2FUserRegistration%3Ftype%3Dfacebook&scope=email,user_about_me,user_birthday,user_friends,user_hometown,user_location,user_relationship_details,user_relationships,user_religion_politics,user_website");
				}
				break;
			default:
				response.sendRedirect("register?info=registration_failed");
				break;
		}
	}

	
	

}
