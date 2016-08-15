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

import com.dietplanner.valueobjects.ProfileVO;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.getWriter().append("Served at: ").append(req.getContextPath());
	}

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession(false);

		ProfileVO userProfile = (ProfileVO) session.getAttribute("userProfile");

		int height = userProfile.getHeight();
		int weight = userProfile.getWeight();

		if ("bmi".equals(req.getParameter("calculateAction"))) {
			// Calculate BMI
			int bmi;
			bmi = (weight * 703) / (height * height);

			session.setAttribute("userProfile", userProfile);
			req.setAttribute("bmi", bmi);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("Home.jsp");
			requestDispatcher.forward(req, resp);
			return;

		} else if ("ibw".equals(req.getParameter("calculateAction"))) {
			// Calculate IBW
			String gender = null;
			int ibw;
			int diff;
			gender = userProfile.getGender();
			if (gender == "male") {
				diff = height - 60;
				ibw = 110 + (5 * diff);
			} else {
				diff = height - 60;
				ibw = 100 + (5 * diff);
			}
			session.setAttribute("userProfile", userProfile);
			req.setAttribute("ibw", ibw);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("Home.jsp");
			requestDispatcher.forward(req, resp);
			return;
		} else if ("exercise".equals(req.getParameter("calculateAction"))){
			//Show Exercise
			String body= userProfile.getBodyshape();
			
			if("Pear".equals(body)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("exercise1.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("Apple".equals(body)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("exercise2.jsp");
			    requestDispatcher.forward(req, resp);
			    return;
			}
			else if("Curvy/Hourglass".equals(body)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("exercise3.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("Banana/straight".equals(body)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("exercise4.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			
		}else if("dietplan".equals(req.getParameter("calculateAction"))){
			//View Diet Plan
			
			String food = userProfile.getFood();
			String goal = userProfile.getGoal();
			String timeframe = userProfile.getTimeFrame();
			
			if("veg".equals(food) && "weightLose".equals(goal) && "2month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan8.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("veg".equals(food) && "weightLose".equals(goal) && "1month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan7.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("nonveg".equals(food) && "weightLose".equals(goal) && "2month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan6.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("nonveg".equals(food) && "weightLose".equals(goal) && "1month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan5.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("veg".equals(food) && "weightGain".equals(goal) && "2month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan4.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("veg".equals(food) && "weightGain".equals(goal) && "1month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan3.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("nonveg".equals(food) && "weightGain".equals(goal) && "2month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan2.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
			else if("nonveg".equals(food) && "weightGain".equals(goal) && "1month".equals(timeframe)){
				session.setAttribute("userProfile", userProfile);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dietPlan1.jsp");
    		    requestDispatcher.forward(req, resp);
    		    return;
			}
		}
	}

}
