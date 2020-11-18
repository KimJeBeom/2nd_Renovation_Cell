package com.ibk.itep.controller.eduApply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.controller.eduApply.pop.EduInfoPopController;
import com.ibk.itep.service.eduApply.EduListService;
import com.ibk.itep.service.eduApply.NewEduApplyService;
import com.ibk.itep.vo.eduApply.EduListVo;
import com.ibk.itep.vo.eduApply.NewEduApplyVo;

@Controller
public class NewEduApplyController{
		
	@Autowired
	private NewEduApplyService service;
	private static final Logger logger = LoggerFactory.getLogger(NewEduApplyController.class);

	@RequestMapping(value = "/views/eduApply/newEduApply", method = RequestMethod.POST)
	public boolean NewEduApplyPost(NewEduApplyVo vo,Model model,
			@RequestParam(value="modAct", required = false) String modAct) {
		
		logger.info("NewEduApplyController POST Start");
		boolean addRst = false;
		if(modAct!=null) {
			addRst = service.addNewEdu(vo);
			logger.info("Service return OK :"+addRst);
		}
		model.addAttribute("addRst", addRst);
		logger.info("NewEduApplyController POST End");
		return addRst;
	}
	
	@RequestMapping(value = "/views/eduApply/newEduApply", method = RequestMethod.GET)
	public String NewEduApplyGet() {
		logger.info("NewEduApplyController GET Start");
		logger.info("NewEduApplyController GET End");
		return "/eduApply/newEduApply";
	}

}
