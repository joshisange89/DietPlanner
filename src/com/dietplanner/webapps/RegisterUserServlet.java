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

import com.dietplanner.dao.LoginDAO;
import com.dietplanner.dao.ProfileDAO;
import com.dietplanner.valueobjects.UserVO;

/**
 * Servlet implementation class RegisterUserServlet
 */
@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserVO user = new UserVO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUserServlet() {
        super();
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
        
        if (LoginDAO.RegisterUser(emailId, password)) {
        	request.setAttribute("error", "Thank you for Signing UP, Please Sign In to continue..");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
		    requestDispatcher.forward(request, response);
		    return;
        }
	}
}
