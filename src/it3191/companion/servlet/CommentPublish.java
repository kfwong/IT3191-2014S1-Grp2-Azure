package it3191.companion.servlet;

import it3191.companion.dao.ActivityDao;
import it3191.companion.dao.CommentDao;
import it3191.companion.dto.Activity;
import it3191.companion.dto.Comment;
import it3191.companion.dto.User;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class CommentPublish
 */
@WebServlet("/CommentPublish")
public class CommentPublish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentPublish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityDao activityDao = new ActivityDao();
		Activity activity = activityDao.get(Integer.parseInt(request.getParameter("activity-id")));
		
		Comment comment = new Comment();
		comment.setCommentedBy((User)request.getSession().getAttribute("user"));
		comment.setCommentedOn(new Date());
		comment.setContent(request.getParameter("content"));
		comment.setActivity(activity);
		
		
		CommentDao commentDao = new CommentDao();
		commentDao.saveOrUpdate(comment);
		
		// Refresh comments and send back result to client
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(comment);
		
		response.setContentType("application/json");
		
		response.getWriter().println(json);
	}

}
