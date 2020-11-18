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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduReadyVO;

@Controller
public class EdueduReadyController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MyClassService myClassService;

	/* 수강 신청한 교육 */
	@RequestMapping(value = "/views/myClass/eduReady", method = RequestMethod.GET)
	public String eduReady(Model model) {

		SessionVo ssnVo = new SessionVo();
		ssnVo.setUserId("42374");
		ssnVo.setBrcd("0710");
		ssnVo.setAthrCd("ADM");

		// 과정개설 신청목록
		List<EduNewReadyVO> eduNewList = myClassService.getNewList(ssnVo);
		// 수강신청 목록
		List<EduReadyVO> eduReadyList = myClassService.getReadyList(ssnVo);

		model.addAttribute("eduNewList", eduNewList);
		model.addAttribute("eduReadyList", eduReadyList);

		return "/myClass/eduReady";
	}
	
	  /*수강신청 목록 - 취소요청처리*/
	  @RequestMapping(value = "/views/myClass/eduReady/cancel", method = RequestMethod.POST)
	  public @ResponseBody int cancel(@RequestParam("edctAplcId") int edctAplcId, Model model) {
	  
	  return myClassService.updateEduReady(edctAplcId);
	 
	 }
	 

	 
}
