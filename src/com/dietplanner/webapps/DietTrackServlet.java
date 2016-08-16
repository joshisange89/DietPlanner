package com.dietplanner.webapps;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dietplanner.dao.DietTrackDAO;
import com.dietplanner.valueobjects.ProfileVO;

/**
 * Servlet implementation class DietTrackServlet
 */
@WebServlet("/DietTrackServlet")
public class DietTrackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DietTrackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ProfileVO userProfile = new ProfileVO();
		userProfile = (ProfileVO) session.getAttribute("userProfile");
		int tracDays = DietTrackDAO.getTracking(userProfile.getUserId());
		session.setAttribute("trackDays", tracDays);
		session.setAttribute("userProfile", userProfile);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Track.jsp");
	    requestDispatcher.forward(request, response);
	    return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String dayOfWeek = null;
        String day = null;
        int userId = (int) session.getAttribute("userId");
       
        dayOfWeek = request.getParameter("dayOfWeek");
        day = request.getParameter("day");
        DietTrackDAO.UpdateTracking(userId, dayOfWeek, day);
	}

}
