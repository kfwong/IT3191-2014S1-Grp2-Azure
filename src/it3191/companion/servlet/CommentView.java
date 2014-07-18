package it3191.companion.servlet;

import it3191.companion.dao.CommentDao;
import it3191.companion.dto.Comment;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class CommentView
 */
@WebServlet("/CommentView")
public class CommentView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDao commentDao = new CommentDao();
		List<Comment> comments = commentDao.getAllByActivityId(Integer.parseInt(request.getParameter("id")));
		
		request.setAttribute("comments", comments);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(comments);
		
		response.setContentType("application/json");
		
		response.getWriter().println(json);
	}

}
