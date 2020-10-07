package com.ibk.itep.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view")
public class MainHomeContoller extends HttpServlet{
	
<<<<<<< HEAD
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
=======
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/views", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);
>>>>>>> refs/heads/devLES
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			
		PrintWriter out = response.getWriter();
		
		int cnt = 100;
		String cnt_ = request.getParameter("cnt");
		
		if(cnt_ != null && !cnt_.equals("")) {
			cnt = Integer.parseInt(cnt_);
		}
				
		for (int i = 0; i < cnt; i++) {
			out.println((i+1)+" : ¾È³ç~! Servlet<br >");
		} 
		
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request,response);
	}

}