package it3191.companion.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.FacebookClient.AccessToken;
import com.restfb.Parameter;
import com.restfb.types.Post;
import com.restfb.types.User;

/**
 * Servlet implementation class RestFBTest
 */
@WebServlet("/RestFBTest")
public class RestFBTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RestFBTest() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String accessToken = null;
	     Integer expires = null;
	        
	     if(request.getParameter("code") == null){
			response.sendRedirect("https://www.facebook.com/dialog/oauth?client_id=390095387796223&response_type=code&redirect_uri=http://localhost:8080/IT3191-2014S1-Grp2-Azure/RestFBTest&scope=user_friends,read_stream");
	     }else if(request.getParameter("access_token") == null){
        	URL url = new URL("https://graph.facebook.com/oauth/access_token?client_id=390095387796223&redirect_uri=http://localhost:8080/IT3191-2014S1-Grp2-Azure/RestFBTest&client_secret=9503acd1dc6276b1bf64673d0fb4db7e&code="+request.getParameter("code"));
        	BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
        	String inputLine;
        	StringBuffer sbf = new StringBuffer();
        	while ((inputLine = in.readLine()) != null)
        		sbf.append(inputLine);
        	in.close();
        	
            String[] pairs = sbf.toString().split("&");
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
    		
    		User user = facebookClient.fetchObject("me", User.class);
    		Connection<Post> myFeed = facebookClient.fetchConnection("me/posts", Post.class, Parameter.with("limit", 3), Parameter.with("until", "yesterday"));

    		response.getWriter().println("User name: " + user.getName());
    		for (List<Post> myFeedConnectionPage : myFeed)
    			  for (Post post : myFeedConnectionPage)
    				  response.getWriter().println("Post: " + post.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
