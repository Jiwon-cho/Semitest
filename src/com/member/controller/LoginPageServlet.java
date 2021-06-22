package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginPageServlet
 */
@WebServlet("/loginPage")
public class LoginPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String referer = request.getHeader("REFERER")!=null&&!(request.getHeader("REFERER").equals("http://localhost:9090"+request.getContextPath()+"/loginPage"))&&!(request.getHeader("REFERER").equals("http://localhost:9090"+request.getContextPath()+"/map/CampView"))
				&&!(request.getHeader("REFERER").equals("http://localhost:9090"+request.getContextPath()+"/enrollMember"))&&!(request.getHeader("REFERER").equals("http://localhost:9090"+request.getContextPath()+"/enrollMember2"))&&!(request.getHeader("REFERER").equals("http://localhost:9090"+request.getContextPath()+"/enrollMember3"))? request.getHeader("REFERER") : request.getContextPath();
		
		
		request.setAttribute("referer", referer);
		request.getRequestDispatcher("/views/member/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
