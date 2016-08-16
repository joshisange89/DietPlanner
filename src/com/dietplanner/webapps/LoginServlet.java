package com.dietplanner.webapps;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dietplanner.dao.*;
import com.dietplanner.valueobjects.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserVO user = new UserVO();
	ProfileVO userProfile = new ProfileVO();
	DietVO diet = new DietVO();

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String emailId = null;
        String password = null;
       
        emailId = request.getParameter("username");
        password = request.getParameter("password");
        
        user = LoginDAO.validateUser(emailId, password);
        int userId = user.getUserId();
        
        if (user.getEmailId() != null && user.getPassword() != null) {
       
        	if (ProfileDAO.validateProfile(userId)) {
            	diet = DietPlanDAO.getDietPlan(user.getUserId());
            	userProfile = ProfileDAO.getProfile(user.getUserId());
        		session.setAttribute("userProfile", userProfile);
        		session.setAttribute("dietPlan", diet);
    			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Home.jsp");
    		    requestDispatcher.forward(request, response);
    		    return;
        	}
        	else {
        		session.setAttribute("userId", userId);
    			RequestDispatcher requestDispatcher = request.getRequestDispatcher("CreateProfile.jsp");
    		    requestDispatcher.forward(request, response);
    		    return;
        	}
        } else {
        	request.setAttribute("error", "Username or Password is wrong!!! Please sign up if you haven't");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
		    requestDispatcher.forward(request, response);
		    return;
        }
	}
}