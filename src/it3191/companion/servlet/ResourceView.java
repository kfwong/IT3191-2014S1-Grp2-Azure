package it3191.companion.servlet;

import it3191.companion.dao.ResourceDao;
import it3191.companion.dto.Resource;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResourceBrowse
 */
@WebServlet("/ResourceView")
public class ResourceView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResourceView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResourceDao resourceDao = new ResourceDao();
		List<Resource> resources = resourceDao.getAll();
		
		request.setAttribute("resources", resources);
		
		request.getRequestDispatcher(this.getServletContext().getContextPath()+"/resource").forward(request, response);		
	}

}
