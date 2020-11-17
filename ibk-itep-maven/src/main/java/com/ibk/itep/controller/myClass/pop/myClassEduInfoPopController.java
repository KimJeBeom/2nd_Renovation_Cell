package com.ibk.itep.controller.myClass.pop;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduInfoPopVO;

@Controller
public class myClassEduInfoPopController{
	
	@Autowired
	private MyClassService myClassService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//상세확인 팝업 신청내용 조회
	@RequestMapping(value = "/views/myClass/pop/eduInfoPop", method = RequestMethod.GET)
	public  String EduInfo(@RequestParam(value = "edctAplcId") int edctAplcId, Model model) {
		EduInfoPopVO eduInfoPop = myClassService.getEduInfoPop(edctAplcId);
		
		model.addAttribute("eduInfoPop", eduInfoPop);
		
		return "/myClass/pop/eduInfoPop";

	
}
	
}
