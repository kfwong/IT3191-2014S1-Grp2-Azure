package it3191.companion.servlet;

import it3191.companion.dao.ActivityDao;
import it3191.companion.dao.ResourceDao;
import it3191.companion.dto.Activity;
import it3191.companion.dto.Resource;
import it3191.companion.dto.User;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResourcePublish
 */
@WebServlet("/ResourcePublish")
public class ResourcePublish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResourcePublish() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Resource resource = new Resource();
		resource.setDescription(request.getParameter("description"));
		resource.setDropboxLink(request.getParameter("dropboxLink"));
		resource.setTitle(request.getParameter("title"));
		resource.setTags(Arrays.asList(request.getParameter("tags").split(",")));
		resource.setCreatedBy((User) request.getSession().getAttribute("user"));
		resource.setCreatedOn(new Date());

		ResourceDao resourceDao = new ResourceDao();
		resourceDao.saveOrUpdate(resource);

		response.sendRedirect(this.getServletContext().getContextPath() + "/resource/view");
	}

}
