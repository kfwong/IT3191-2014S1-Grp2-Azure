package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.User;

import java.io.IOException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public static String createHash(String password)
            throws NoSuchAlgorithmException, InvalidKeySpecException
        {
            return createHash(password.toCharArray());
        }

        /*
         *Returns a salted PBKDF2 hash of the password.
         */
        public static String createHash(char[] password)
            throws NoSuchAlgorithmException, InvalidKeySpecException
        {
            // Generate a random salt
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[salt_size];
            random.nextBytes(salt);

            // Hash the password
            byte[] hash = pbkdf2(password, salt, pbkdf2_iterations, hash_size);
          
            return pbkdf2_iterations + ":" + toHex(salt) + ":" +  toHex(hash);
        }

       
        public static boolean validatePassword(String password, String correctHash)
            throws NoSuchAlgorithmException, InvalidKeySpecException
        {
            return validatePassword(password.toCharArray(), correctHash);
        }

     
        public static boolean validatePassword(char[] password, String correctHash)
            throws NoSuchAlgorithmException, InvalidKeySpecException
        {
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

     
        private static boolean slowEquals(byte[] a, byte[] b)
        {
            int diff = a.length ^ b.length;
            for(int i = 0; i < a.length && i < b.length; i++)
                diff |= a[i] ^ b[i];
            return diff == 0;
        }

        private static byte[] pbkdf2(char[] password, byte[] salt, int iterations, int bytes)
            throws NoSuchAlgorithmException, InvalidKeySpecException
        {
            PBEKeySpec spec = new PBEKeySpec(password, salt, iterations, bytes * 8);
            SecretKeyFactory skf = SecretKeyFactory.getInstance(PBKDF2_ALGORITHM);
            return skf.generateSecret(spec).getEncoded();
        }

        /*
          Converts a string of hexadecimal characters into a byte array.
         */
        private static byte[] fromHex(String hex)
        {
            byte[] binary = new byte[hex.length() / 2];
            for(int i = 0; i < binary.length; i++)
            {
                binary[i] = (byte)Integer.parseInt(hex.substring(2*i, 2*i+2), 16);
            }
            return binary;
        }

        /*
         Converts a byte array into a hexadecimal string.
         */
        private static String toHex(byte[] array)
        {
            BigInteger bi = new BigInteger(1, array);
            String hex = bi.toString(16);
            int paddingLength = (array.length * 2) - hex.length();
            if(paddingLength > 0) 
                return String.format("%0" + paddingLength + "d", 0) + hex;
            else
                return hex;
        }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		
		user.setFirstName(request.getParameter("firstname"));
		user.setLastName(request.getParameter("lastname"));
		user.setUserName(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setDob(request.getParameter("dob"));
		user.setGender(request.getParameter("gender"));
		user.setHandphoneNo(request.getParameter("handphoneno"));
		user.setPasswordMD5(Base64.encode(request.getParameter("password").getBytes()));
		user.setPasswordSHA1(Base64.encode(request.getParameter("password").getBytes()));
		user.setPasswordHash(request.getParameter("password"));
		
		UserDao userDao = new UserDao();
		userDao.saveOrUpdate(user);
		
		response.sendRedirect("pages/examples/login.html");
	}
	

}
