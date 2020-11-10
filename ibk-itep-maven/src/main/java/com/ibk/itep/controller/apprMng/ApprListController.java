package com.ibk.itep.controller.apprMng;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.repository.ApprMngDAO;
import com.ibk.itep.service.ApprMngService;
import com.ibk.itep.vo.ApprListVO;

@Controller
public class ApprListController{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApprMngService apprMngService;

	@RequestMapping(value = "/views/apprMng/apprList", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<ApprListVO> apprList = apprMngService.getApprList("42664");
//		Timestamp timestamp = testService.getTimeStamp();
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("apprList", apprList);
//		model.addAttribute("timestamp", timestamp);
//		model.addAttribute("date", date);
		
		return "/apprMng/apprList";
	}

}
