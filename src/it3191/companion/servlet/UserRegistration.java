package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.User;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.List;

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
	public static final String PBKDF2_ALGORITHM = "PBKDF2WithHmacSHA1";
	public static final int salt_size = 24;
	public static final int hash_size = 24;
	public static final int pbkdf2_iterations = 1000;
	public static final int iteration_index = 0;
	public static final int salt_index = 1;
	public static final int pbkdf2_index = 2;

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
				user.setPasswordMD5(Base64.encode(request.getParameter("password").getBytes()));
				user.setPasswordSHA1(Base64.encode(request.getParameter("password").getBytes()));
				user.setPasswordHash(request.getParameter("password"));

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

	public static String createHash(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
		return createHash(password.toCharArray());
	}

	/*
	 * Returns a salted PBKDF2 hash of the password.
	 */
	public static String createHash(char[] password) throws NoSuchAlgorithmException, InvalidKeySpecException {
		// Generate a random salt
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[salt_size];
		random.nextBytes(salt);

		// Hash the password
		byte[] hash = pbkdf2(password, salt, pbkdf2_iterations, hash_size);

		return pbkdf2_iterations + ":" + toHex(salt) + ":" + toHex(hash);
	}

	public static boolean validatePassword(String password, String correctHash) throws NoSuchAlgorithmException, InvalidKeySpecException {
		return validatePassword(password.toCharArray(), correctHash);
	}

	public static boolean validatePassword(char[] password, String correctHash) throws NoSuchAlgorithmException, InvalidKeySpecException {
		// Decode the hash into its parameters
		String[] params = correctHash.split(":");
		int iterations = Integer.parseInt(params[iteration_index]);
		byte[] salt = fromHex(params[salt_index]);
		byte[] hash = fromHex(params[pbkdf2_index]);
		// Compute the hash of the provided password, using the same salt,
		// iteration count, and hash length
		byte[] testHash = pbkdf2(password, salt, iterations, hash.length);
		// Compare the hashes in constant time. The password is correct if
		// both hashes match.
		return slowEquals(hash, testHash);
	}

	private static boolean slowEquals(byte[] a, byte[] b) {
		int diff = a.length ^ b.length;
		for (int i = 0; i < a.length && i < b.length; i++)
			diff |= a[i] ^ b[i];
		return diff == 0;
	}

	private static byte[] pbkdf2(char[] password, byte[] salt, int iterations, int bytes) throws NoSuchAlgorithmException, InvalidKeySpecException {
		PBEKeySpec spec = new PBEKeySpec(password, salt, iterations, bytes * 8);
		SecretKeyFactory skf = SecretKeyFactory.getInstance(PBKDF2_ALGORITHM);
		return skf.generateSecret(spec).getEncoded();
	}

	/*
	 * Converts a string of hexadecimal characters into a byte array.
	 */
	private static byte[] fromHex(String hex) {
		byte[] binary = new byte[hex.length() / 2];
		for (int i = 0; i < binary.length; i++) {
			binary[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
		}
		return binary;
	}

	/*
	 * Converts a byte array into a hexadecimal string.
	 */
	private static String toHex(byte[] array) {
		BigInteger bi = new BigInteger(1, array);
		String hex = bi.toString(16);
		int paddingLength = (array.length * 2) - hex.length();
		if (paddingLength > 0)
			return String.format("%0" + paddingLength + "d", 0) + hex;
		else
			return hex;
	}
}
