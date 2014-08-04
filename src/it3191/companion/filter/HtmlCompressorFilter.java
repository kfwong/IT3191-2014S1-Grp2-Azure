package it3191.companion.filter;

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

import com.googlecode.htmlcompressor.compressor.HtmlCompressor;

/**
 * Servlet Filter implementation class HtmlCompressorFilter
 */
@WebFilter("/HtmlCompressorFilter")
public class HtmlCompressorFilter implements Filter {
	private HtmlCompressor compressor;
    /**
     * Default constructor. 
     */
    public HtmlCompressorFilter() {
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
		
		ServletResponseWrapper responseWrapper = new ServletResponseWrapper(res);
		
		// pass the request along the filter chain, the final servlet will write its response to the ServletResponseWrapper
		chain.doFilter(request, responseWrapper);
		
		try{
			String servletResponse = new String(responseWrapper.toString());
		    res.getWriter().write(compressor.compress(servletResponse));
		}
		catch(Exception e){
			
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		compressor = new HtmlCompressor();
	    compressor.setCompressCss(true);
	    compressor.setCompressJavaScript(true);
	}

}
