package com.ibk.itep.controller.myClass;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduMyHistoryVO;

@Controller
public class EduMyHistoryController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(EduMyHistoryController.class);
	
	@Autowired
	private MyClassService myClassService;

	/*수강신청 이력조회*/
	@RequestMapping(value = "/views/myClass/eduMyHistory", method = RequestMethod.GET)
	public String eduMyHistory(Model model) {
		
		SessionVo ssnVo = new SessionVo();
		ssnVo.setUserId("42374");
		ssnVo.setBrcd("0710");
		ssnVo.setAthrCd("ADM");
		
		List<EduMyHistoryVO> eduMyHistroy = myClassService.getHistoryList(ssnVo);
		
		
		model.addAttribute("eduMyHistroy", eduMyHistroy);
		
		return "/myClass/eduMyHistory";
	}

}