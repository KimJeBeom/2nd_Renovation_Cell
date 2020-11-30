package com.ibk.itep.controller.admin.pop;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.admin.EduHistoryService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduHistoryVo;

@Controller
public class MemoRegPopController{
	
	private static final Logger logger = LoggerFactory.getLogger(MemoRegPopController.class);
	@Autowired
	private CmmService cmmService;
	@Autowired
	private EduHistoryService eduHistoryService;

	@RequestMapping(value = "/views/admin/pop/memoRegPop", method = RequestMethod.GET)
	public String memoRegPop(EduHistoryVo ehVo, Model model) {
		logger.debug("Start - memoRegPop");
		cmmService.objFieldTest(ehVo);
		
		List<EduHistoryVo> ehVoList = eduHistoryService.selectEduHistory(ehVo);
		ehVo = ehVoList.get(0);
		ehVo.setRfrcCon(ehVo.getRfrcCon().replace("\n", "\\n"));
		model.addAttribute("eduHistoryVo", ehVo);
		
		
		cmmService.objFieldTest(ehVo);
		logger.debug("End - memoRegPop");
		return "/admin/pop/memoRegPop";
	}
	
	@RequestMapping(value = "/views/admin/pop/updateRfrcCon", method = RequestMethod.POST)
	public @ResponseBody boolean updateRfrcCon(EduHistoryVo ehVo, Model model) {
		logger.debug("Start - updateRfrcCon");
		cmmService.objFieldTest(ehVo);
		
		boolean result = eduHistoryService.updateEduHistory(ehVo);		
		
		logger.debug("End - updateRfrcCon / 결과값 : {}", result);
		return result;
	}

}
