package com.ibk.itep.controller.eduApply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.eduApply.EduListService;
import com.ibk.itep.vo.eduApply.EduListVo;

@Controller
public class EduListController{
	
	@Autowired private EduListService service;
	
	private static final Logger logger = LoggerFactory.getLogger(EduListController.class);

	@RequestMapping(value = "/views/eduApply/eduList", method = RequestMethod.GET)
	public String EduListGET(Model model) {
		logger.info("EduListGET Start");
		
		//최초 화면 호출시 post메서드에 있는 List값 return
		EduListPOST(model, null, "", "");
		
		logger.info("EduListGET End");
			
		return "/eduApply/eduList";
	}
	
	@RequestMapping(value = "/views/eduApply/eduList", method = RequestMethod.POST)
	public @ResponseBody List<EduListVo> EduListPOST(Model model, HttpServletRequest request,
		   @RequestParam(value="schType", required = false) String schType,
		   @RequestParam(value="schValue", required = false) String schValue ) {
		logger.info("EduListPOST Start");
		
		//List형태로 Vo값을 Return받아옴(Input Vo -> OutPut List)
		List<EduListVo> list = service.getList(schType,schValue);
		
		logger.info("Service Retrn OK");
		logger.info("-- List line : "+list.size());
		
		//model을 통한 결과값 화면(.jsp)에 전달
		model.addAttribute("list", list);
		logger.info("EduListPOST End");
			
		return list;
		
	}

}
