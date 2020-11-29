package com.ibk.itep.controller.admin;

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
import com.ibk.itep.service.admin.EduHistoryService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduHistoryVo;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.cmm.CldVo;

@Controller
public class EduHistoryController{

	private static final Logger logger = LoggerFactory.getLogger(EduHistoryController.class);

	@Autowired
	private CmmService cmmService;
	
	@Autowired
	private EduHistoryService eduHistoryService;
	
	@RequestMapping(value = "/views/admin/eduHistory", method = RequestMethod.GET)
	public String eduHistory(Model model) {
		logger.debug("컨트롤러 Start - eduHistory");
		CldVo cldVo = new CldVo();
		cldVo.setUseYn("Y");
	
		List<CldVo> cldVoList = cmmService.selectCld(cldVo);
		model.addAttribute("cldVoList", cldVoList);
		logger.debug("컨트롤러 End - eduHistory");
		return "/admin/eduHistory";
	}
	
	@RequestMapping(value = "/views/admin/selectEduHistory", method = RequestMethod.POST)
	public @ResponseBody List<EduHistoryVo> selectEduHistory(EduHistoryVo ehVo) {
		logger.debug("컨트롤러 Start - selectEduHistory");
		cmmService.objFieldTest(ehVo);
		List<EduHistoryVo> eduHistoryVoList = eduHistoryService.selectEduHistory(ehVo);
		logger.debug("컨트롤러 End - selectEduHistory");
		
		return eduHistoryVoList;		
	}

}
