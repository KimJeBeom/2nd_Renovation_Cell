package com.ibk.itep.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController { 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
		
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
	
		logger.debug("SSO Check 1 : SSO인증 티켓 추출");
		return "index";
	}
	
	@RequestMapping(value = "/ssoLogin", method = RequestMethod.GET)
	public String home(Model model 
			,@RequestParam(value="ticket", required = false) String ticket) {
			
		logger.debug("SSO Check 1 : SSO 사용자ID 추출");		
		model.addAttribute("ticket", ticket);  	//SSO인증 티켓
		
		return "ssoLogin";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model 
			,@RequestParam(value="userId", required = false) String userId
			,@RequestParam(value="show", required = false) String show) {
		
		model.addAttribute("userId", userId);  	//직원번호
		model.addAttribute("show", show); 		//수동로그인
		
		logger.debug("Login page 호출 : POST");
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(Model model 
			,@RequestParam(value="userId", required = false) String userId
			,@RequestParam(value="show", required = false) String show) {
		
		model.addAttribute("userId", userId);  	//직원번호
		model.addAttribute("show", show); 		//수동로그인
		
		logger.debug("Login page 호출 : GET");
		return "login";
	}
}
