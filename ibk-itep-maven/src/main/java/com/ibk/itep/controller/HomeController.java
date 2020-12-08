package com.ibk.itep.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.service.TestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController { 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	TestService testService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model 
			,@RequestParam(value="userId", required = false) String userId
			,@RequestParam(value="show", required = false) String show) {
		
		/*Index.jsp로 리턴하여 SSO자동 로그인 기능 구현 예정*/
		
		model.addAttribute("userId", userId);  	//직원번호
		model.addAttribute("show", show); 		//수동로그인
		
		logger.debug("Login page 호출");
		return "login";
	}
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
	
		logger.debug("SSO체크 1");
		return "index";
	}
	@RequestMapping(value = "/ssoLogin", method = RequestMethod.GET)
	public String home(Model model 
			,@RequestParam(value="ticket", required = false) String ticket) {
			
		logger.debug("SSO체크 2");		
		model.addAttribute("ticket", ticket);  	//SSO인증 티켓
		
		return "ssoLogin";
	}
	*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model 
			,@RequestParam(value="userId", required = false) String userId
			,@RequestParam(value="show", required = false) String show) {
		
		model.addAttribute("userId", userId);  	//직원번호
		model.addAttribute("show", show); 		//수동로그인
		
		logger.debug("Login page 호출");
		return "login";
	}
	
}
