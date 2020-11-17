package com.ibk.itep.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainHomeContoller{
	
	
	private static final Logger logger = LoggerFactory.getLogger(MainHomeContoller.class);

	@RequestMapping(value = "/views", method = RequestMethod.GET)
	public String home(Authentication authentication, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String id = (String) authentication.getPrincipal();
		
		session.setAttribute("id", authentication.getPrincipal());
		logger.debug(session.getAttribute("id").toString());
		
		logger.debug("Login  ID : " + authentication.getPrincipal());
		logger.debug("name : " + authentication.getAuthorities().toString());
		return "home";
	}
	

}
