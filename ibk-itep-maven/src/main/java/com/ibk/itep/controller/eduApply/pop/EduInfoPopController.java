package com.ibk.itep.controller.eduApply.pop;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.service.eduApply.EduListService;
import com.ibk.itep.vo.eduApply.EduListVo;

@Controller
public class EduInfoPopController{
	
	@Autowired
	private EduListService service;
	private static final Logger logger = LoggerFactory.getLogger(EduInfoPopController.class);

	@RequestMapping(value = "/views/eduApply/pop/eduInfoPop", method = RequestMethod.GET)
	public String home(EduListVo vo, Model model, 
			@RequestParam(value="modType", required = false) String modType, 
			@RequestParam(value="modAct", required = false) String modAct){
		
		logger.info("EduListContoll Start");

		boolean modRst = false;
		if(modAct!=null) {// modType = update or insert
			
			//화면에서 입력 받은 정보(Vo) 및 변경정보를 Service로 던져 boolean(성공/실패)로 받아옴
			modRst = service.modAction(vo,modType);
			
			logger.info("Service Retrn OK");
			logger.info("---Return modRst : "+modRst);
		}
		
		EduListVo outVo = service.getDetail(vo);
		
		logger.info("Service Retrn OK");
		
		//model을 통한 결과값 화면에 전달 
		model.addAttribute("vo",outVo);
		model.addAttribute("modRst",modRst);
		model.addAttribute("modType",modType);
		
		logger.info("EduListContoll End");

		return "/eduApply/pop/eduInfoPop";
	}

}