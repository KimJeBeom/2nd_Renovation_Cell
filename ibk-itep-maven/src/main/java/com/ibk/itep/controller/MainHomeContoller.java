package com.ibk.itep.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibk.itep.service.MainHomeService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.HomeNoticeVo;
import com.ibk.itep.vo.HomeEduNowVO;

@Controller
public class MainHomeContoller{
	
	private static final Logger logger = LoggerFactory.getLogger(MainHomeContoller.class);

	@Autowired
	private MainHomeService mainHomeService;

	@RequestMapping(value = "/views", method = RequestMethod.GET)
	public String home(Authentication authentication, HttpServletRequest request, Model model) {
		
		logger.info("############ MainHome Start ############");
		HttpSession session = request.getSession();
		String id = (String) authentication.getPrincipal();
		SessionVo ssnInfo = mainHomeService.selectSessionInfo(id); // 로그인한 id 기준으로 사용자 정보 조회
		
		session.setAttribute("ssnInfo", ssnInfo); // 사용자 정보 세션에 담음
		
		List<HomeNoticeVo> bdnList = mainHomeService.selectHomeBdnList(); // 공지사항
		List<HomeEduNowVO> eduNowList = mainHomeService.selectHomeEduNow(id); // 수강중인 교육
		
		model.addAttribute("bdnList", bdnList);
		model.addAttribute("eduNowList", eduNowList);
		logger.info("############ welcome "+ssnInfo.getUserNm()+"!! ############");

		return "home";
	}
}