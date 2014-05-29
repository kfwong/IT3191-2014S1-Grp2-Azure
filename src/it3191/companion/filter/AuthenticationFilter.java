package it3191.companion.filter;

import it3191.companion.dto.User;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthenticationFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession ses = req.getSession();
		
		if(ses.isNew()){
			res.sendRedirect("login?info=new_session");
		}else{
			System.out.println(ses.getId());
			// pass the request along the filter chain
			if(req.getRequestURI().endsWith("/login") || req.getRequestURI().endsWith("/register") || req.getRequestURI().endsWith("UserLogin") || req.getRequestURL().toString().contains("/css/") || req.getRequestURL().toString().contains("/js/")){
				chain.doFilter(request, response);
			}else{
				if(ses.getAttribute("user") == null){
					res.sendRedirect("login?info=new_session");
				}else{
					chain.doFilter(request, response);
				}
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
