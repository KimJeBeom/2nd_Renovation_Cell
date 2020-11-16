package com.ibk.itep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibk.itep.service.MainHomeService;
import com.ibk.itep.vo.HomeBdnVo;
import com.ibk.itep.vo.HomeEduNowVo;

@Controller
public class MainHomeContoller{
	
	@Autowired
	private MainHomeService mainHomeService;

	@RequestMapping(value = "/views", method = RequestMethod.GET)
	public String home(Model model) {
		
		String userId = "40868";
		
		List<HomeBdnVo> bdnList = mainHomeService.selectHomeBdnList();
		List<HomeEduNowVo> eduNowList = mainHomeService.selectHomeEduNow(userId);
		model.addAttribute("bdnList", bdnList);
		model.addAttribute("eduNowList", eduNowList);
		
		return "home";
	}
}
