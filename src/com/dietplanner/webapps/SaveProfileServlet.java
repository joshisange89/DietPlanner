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

import com.dietplanner.dao.DietPlanDAO;
import com.dietplanner.dao.ProfileDAO;
import com.dietplanner.valueobjects.DietVO;
import com.dietplanner.valueobjects.ProfileVO;



/**
 * Servlet implementation class SaveProfileServlet
 */
@WebServlet("/SaveProfileServlet")
public class SaveProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProfileVO userProfile = new ProfileVO();
	DietVO diet = new DietVO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		userProfile = (ProfileVO) session.getAttribute("userProfile");
		session.setAttribute("userProfile", userProfile);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("CreateProfile.jsp");
	    requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String firstname = null;
        String lastname = null;
        int height = 0;
        String hfeet = null;
        String hinches = null;
        String weight = null;
        String age = null;
        String gender = null;
        String body = null;
        String food = null;
        String goal = null;
        String timeframe = null;
        String startDate = null;
       
        firstname = request.getParameter("firstname");
        lastname = request.getParameter("lastname");
        hfeet = request.getParameter("feet");
        hinches = request.getParameter("inches");
        weight = request.getParameter("weight");
        age = request.getParameter("age");
        gender = request.getParameter("gender");
        body = request.getParameter("body");
        food = request.getParameter("food");
        goal = request.getParameter("goal");
        timeframe = request.getParameter("timeframe");
        startDate = request.getParameter("startDate");
        
        height = Integer.parseInt(hfeet) * 12 + Integer.parseInt(hinches); 
             
        if ( session.getAttribute("userId") != null ) {
        	userProfile.setUserId( (int) session.getAttribute("userId"));
	        if (ProfileDAO.createProfile(userProfile)) {
	        	session.setAttribute("userProfile", userProfile);
	        	
	        	diet = DietPlanDAO.getDietPlan(userProfile.getUserId());        	    	
	    		session.setAttribute("dietPlan", diet);
	        }
        } else {        	
	        userProfile.setFirstname(firstname);
	        userProfile.setLastname(lastname);
	        userProfile.setHeight(height);
	        userProfile.setWeight(Integer.parseInt(weight));
	        userProfile.setAge(Integer.parseInt(age));
	        userProfile.setGender(gender);
	        userProfile.setBodyshape(body);
	        userProfile.setFood(food);
	        userProfile.setGoal(goal);
	        userProfile.setTimeFrame(timeframe);
	        userProfile.setStartDate(startDate);      
        	
	        if (ProfileDAO.updateProfile(userProfile)) {
	        	session.setAttribute("userProfile", userProfile);
	        	
	        	diet = DietPlanDAO.getDietPlan(userProfile.getUserId());        	    	
	    		session.setAttribute("dietPlan", diet);
	        }
        }    		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Home.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
}