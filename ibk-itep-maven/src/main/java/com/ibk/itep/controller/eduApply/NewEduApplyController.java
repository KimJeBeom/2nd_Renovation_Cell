package com.ibk.itep.controller.eduApply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.eduApply.NewEduApplyService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.eduApply.NewEduApplyVo;

@Controller
public class NewEduApplyController{
		
	@Autowired
	private NewEduApplyService service;
	private static final Logger logger = LoggerFactory.getLogger(NewEduApplyController.class);
	
	//newEduApply.jsp 신청
	@RequestMapping(value = "/views/eduApply/newEduApply", method = RequestMethod.POST)
	public @ResponseBody String NewEduApplyPost(NewEduApplyVo vo,Model model,HttpServletRequest request,
			@RequestParam(value="modAct", required = false) String modAct) {
		
		logger.info("NewEduApplyController POST Start");
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		String addRst = null;
		if(modAct!=null) { //modAct=='insert'
			addRst = service.addNewEdu(vo,ssnInfo);
			logger.info("Service return OK :"+addRst);
		}
		
		model.addAttribute("addRst", addRst);
		logger.info("NewEduApplyController POST End");
		return addRst;
	}
	
	//newEduApply.jsp 조회
	@RequestMapping(value = "/views/eduApply/newEduApply", method = RequestMethod.GET)
	public String NewEduApplyGet() {
		logger.info("NewEduApplyController GET Start");
		logger.info("NewEduApplyController GET End");
		return "/eduApply/newEduApply";
	}

}
