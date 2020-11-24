package com.ibk.itep.controller.eduApply.pop;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibk.itep.service.eduApply.EduListService;
import com.ibk.itep.vo.eduApply.EduListVo;

@Controller
public class EduApplyPopController {

	@Autowired
	private EduListService service;
	private static final Logger logger = LoggerFactory.getLogger(EduApplyPopController.class);

	@RequestMapping(value = "/views/eduApply/pop/eduApplyPop", method = RequestMethod.GET)
	public String EduApplyPop(EduListVo vo, Model model) {

		logger.info("EduApplyPop Start");

		EduListVo outVo = service.getDetail(vo);      //교육상세정보 service호출
		List<EduListVo> list = service.getCntList(vo);//교육 차수 목록 service호출
		
		logger.info("Service Retrn OK");
		
		//model을 통한 결과값 화면에 전달 
		model.addAttribute("list", list);
		model.addAttribute("vo",outVo);
		
		logger.info("EduApplyPop End");
		
		return "/eduApply/pop/eduApplyPop";
	}

}