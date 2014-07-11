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

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.sun.org.apache.xml.internal.security.utils.Base64;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
                    response.sendRedirect(this.getServletContext().getContextPath() + "/dashboard");
                }else{                  
                    response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                }               
            } catch (NullPointerException ex) {
                response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
            } finally {
                IOUtils.closeQuietly(inputStream);
            }
        }catch(IOException ex){
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
                        response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                    }else{
                        request.getSession().setAttribute("user", user);
                        response.sendRedirect(this.getServletContext().getContextPath() + "/dashboard");
                    }
                    
                }else{
                    user = null;
                    response.sendRedirect(this.getServletContext().getContextPath()+"/login?info=login_failed");
                }
                break;
            case "facebook":
                if (request.getParameter("error") != null){
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
