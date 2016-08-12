package com.dietplanner.webapps;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.ServletException;
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
        
        if (user.getEmailId() != null && user.getPassword() != null) {
        	userProfile = ProfileDAO.validateProfile(user.getUserId());
        	if (userProfile.getUserId() > 0 ) {
        		session.setAttribute("userProfile", userProfile);
    			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Home.jsp");
    		    requestDispatcher.forward(request, response);
    		    return;
        	}
        	else {
        		session.setAttribute("userId", user.getUserId());
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
