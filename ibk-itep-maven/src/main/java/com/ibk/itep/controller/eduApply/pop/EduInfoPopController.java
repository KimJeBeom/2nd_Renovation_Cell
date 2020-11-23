package com.ibk.itep.controller.eduApply.pop;


import java.util.List;

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

import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.service.eduApply.EduListService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.eduApply.EduListVo;

@Controller
public class EduInfoPopController{
	
	@Autowired	private EduListService service;
	@Autowired	private CmmService CmService;
	private static final Logger logger = LoggerFactory.getLogger(EduInfoPopController.class);

	@RequestMapping(value = "/views/eduApply/pop/eduInfoPop", method = RequestMethod.POST)
	public @ResponseBody String EduInfoPopPost(EduListVo vo,Model model,HttpServletRequest request,
			@RequestParam(value="modAct", required = false) String modAct) {
		
		logger.info("EduInfoPopPost POST START");
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		String modRst = null;
		if(modAct!=null) {
			//화면에서 입력 받은 정보(Vo) 및 변경정보를 Service로 던져 boolean(성공/실패)로 받아옴
			modRst = service.modAction(vo,ssnInfo);			
			logger.info("Service Retrn OK");
			logger.info("---Return modMsg : "+modRst);
		}

		model.addAttribute("modRst", modRst);
		logger.info("EduInfoPopPost POST End");
		return modRst;
	}
	
	@RequestMapping(value = "/views/eduApply/pop/eduInfoPop", method = RequestMethod.GET)
	public String EduInfoPopGet(EduListVo vo, Model model,HttpServletRequest request,
			@RequestParam(value="modType", required = false) String modType){
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		logger.info("EduInfoPopGet Start");

		List<CluVo> dpmList = CmService.selectDpm(ssnInfo);
		EduListVo outVo = service.getDetail(vo);
		
		logger.info("Service Retrn OK");
		
		//model을 통한 결과값 화면에 전달 
		model.addAttribute("vo",outVo);
		model.addAttribute("modType",modType);
		model.addAttribute("dpmList",dpmList);
		
		logger.info("EduInfoPopGet End");

		return "/eduApply/pop/eduInfoPop";
	}

}