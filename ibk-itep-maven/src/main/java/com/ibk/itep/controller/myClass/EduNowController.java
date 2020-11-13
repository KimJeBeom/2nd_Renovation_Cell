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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.controller.myClass.EduNowController;
import com.ibk.itep.repository.MyClassDao;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.myClass.EduNowVO;

@Controller
public class EduNowController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(EduNowController.class);
	
	@Autowired
	private MyClassService myClassService;
	
	@RequestMapping(value = "/views/myClass/eduNow", method = RequestMethod.GET)
	public String home(Model model) {

		List<EduNowVO> list = myClassService.getList("42374");
		model.addAttribute("list", list);
				
		return "/myClass/eduNow";
	}
	
}