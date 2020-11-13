package com.ibk.itep.controller.myClass;

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
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduReadyVO;

@Controller
public class EdueduReadyController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    	@Autowired
		private MyClassService myClassService;
		
		@RequestMapping(value = "/views/myClass/eduReady", method = RequestMethod.GET)
		public String home(Model model) {

			List<EduNewReadyVO> list = myClassService.getNewList("42374");
			List<EduReadyVO> list1 = myClassService.getReadyList("42374");
			
			model.addAttribute("list", list);
			model.addAttribute("list1", list1);
					
					
		return "/myClass/eduReady";
	}
}
