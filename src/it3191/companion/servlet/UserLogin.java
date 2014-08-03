package it3191.companion.servlet;

import it3191.companion.dao.UserDao;
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

import org.apache.commons.io.IOUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.sun.org.apache.xml.internal.security.utils.Base64;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger log = LogManager.getLogger(UserLogin.class.getName());

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        try {
            String accessToken = null;
            Integer expires = null;
            
            it3191.companion.dto.User user = new User();
            UserDao userDao = new UserDao();
            
            InputStream inputStream = new URL("https://graph.facebook.com/oauth/access_token?client_id=390095387796223&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FIT3191-2014S1-Grp2-Azure%2FUserLogin%3Ftype%3Dfacebook&client_secret=9503acd1dc6276b1bf64673d0fb4db7e&code=" + request.getParameter("code")).openStream();
            try{            
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
                
                if(userDao.isExist(user)){
                    user = userDao.authenticate(fbUser.getId());
                    request.getSession().setAttribute("user", user);

                    log.info("Client with email \""+user.getEmail()+"\" and Facebook ID " + user.getFacebookId() +" login successfully"+".");
                    response.sendRedirect(this.getServletContext().getContextPath());
                }else{
                	log.warn("Client failed to login with invalid Facebook ID \"" + user.getFacebookId() + "\".");

                    response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                }               
            } catch (NullPointerException ex) {
            	log.warn("Client failed to login with invalid user account or Facebook ID.");
                response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
            } finally {
                IOUtils.closeQuietly(inputStream);
            }
        }catch(IOException ex){
        	log.error("User login operation aborted due to application error. "+ ex.getMessage());
            response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
        }
        
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (request.getParameter("type")) {
            case "normal":            	
                User user = new User();
                UserDao userDao = new UserDao();
                user.setEmail(request.getParameter("email"));
                
                if(userDao.isExist(user)){
                    user = userDao.getByEmail(request.getParameter("email"));
                    if(Hash.isExpectedPassword(request.getParameter("password").toCharArray(), user.getSalt().getBytes(), user.getPasswordSHA1().getBytes())){
                        user = userDao.authenticate(request.getParameter("email"), Base64.encode(request.getParameter("password").getBytes()));
                    }
                    
                    if(user == null){
                    	log.warn("Client from " + request.getRemoteAddr() +" failed to login using email \""+request.getParameter("email")+"\" with invalid password.");
                        response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                    }else{
                        request.getSession().setAttribute("user", user);

                    	log.info("Client from " + request.getRemoteAddr() +" login successfully using email \""+request.getParameter("email")+"\".");
                        response.sendRedirect(this.getServletContext().getContextPath());
                    }
                    
                }else{
                    user = null;
                    log.warn("Client from " + request.getRemoteAddr() +" failed to login with non-existence email \""+request.getParameter("email")+"\".");
                    response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                }
                break;
            case "facebook":
                if (request.getParameter("error") != null){
                	log.warn("Client from " + request.getRemoteAddr() +" failed to initiate facebook OAuth. " + request.getParameter("error") + ".");
                    response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                }else if (request.getParameter("code") == null) {
                    response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id=390095387796223&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FIT3191-2014S1-Grp2-Azure%2FUserLogin%3Ftype%3Dfacebook&scope=email,user_about_me,user_birthday,user_friends,user_hometown,user_location,user_relationship_details,user_relationships,user_religion_politics,user_website");
                }               
                break;
            default:
                break;
        }
    }

}
