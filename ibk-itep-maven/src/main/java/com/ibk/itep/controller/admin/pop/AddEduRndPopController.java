package com.ibk.itep.controller.admin.pop;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.admin.EduRegModService;
import com.ibk.itep.service.admin.EduRndRegModService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EduRndRegModVo;


@Controller
public class AddEduRndPopController{
	
	private static final Logger logger = LoggerFactory.getLogger(AddEduRndPopController.class);
	
	@Autowired
	private EduRndRegModService eduRndRegModService;
	@Autowired
	private EduRegModService eduRegModService;
	@Autowired
	private CmmService cmmService;

	@RequestMapping(value = "/views/admin/pop/addEduRndPop", method = RequestMethod.GET)
	public String AddEduRndPop(EduRegModVo ermVo, Model model) {
		logger.debug("컨트롤러 진입");
		
		List<EduRegModVo> ermVoList = eduRegModService.selectEduRegMod(ermVo);
		int edctId = ermVoList.get(0).getEdctId();
		String edctNm = ermVoList.get(0).getEdctNm();
		/*
		EduRndRegModVo errmVo = new EduRndRegModVo();
		errmVo.setEdctId(edctId);
		
		List<EduRndRegModVo> errmVoList = eduRndRegModService.selectEduRndRegMod(errmVo);
		
		model.addAttribute("eduRndRegModVoList", errmVoList);
		*/
		model.addAttribute("edctId", edctId);
		model.addAttribute("edctNm", edctNm);
		logger.debug("컨트롤러 종료 직전");		
		return "/admin/pop/addEduRndPop";
	}
	
	@RequestMapping(value = "/views/admin/pop/selectEduRndRegMod", method = RequestMethod.POST)
	public @ResponseBody List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo errmVo) {
		logger.debug("컨트롤러 start - selectEduRndRegMod");		
		List<EduRndRegModVo> errmVoList = eduRndRegModService.selectEduRndRegMod(errmVo);
		cmmService.objFieldTest(errmVoList);
		logger.debug("컨트롤러 End - selectEduRndRegMod");
		
		return errmVoList;		
	}
	
	@RequestMapping(value = "/views/admin/pop/insertEduRndRegMod", method = RequestMethod.POST)
	public @ResponseBody boolean insertEduRndRegMod(EduRndRegModVo errmVo) {
		logger.debug("컨트롤러 Start : insertEduRndRegMod");
		cmmService.objFieldTest(errmVo);
		boolean result = eduRndRegModService.insertEduRndRegMod(errmVo);
		logger.debug("컨트롤러 End : insertEduRndRegMod : result : {}", result);
		return result;
	}

	@RequestMapping(value = "/views/admin/pop/updateEduRndRegMod", method = RequestMethod.POST)
	public @ResponseBody boolean updateEduRndRegMod(EduRndRegModVo errmVo) {
		logger.debug("컨트롤러 Start : updateEduRndRegMod");
		cmmService.objFieldTest(errmVo);
		boolean result = eduRndRegModService.updateEduRndRegMod(errmVo);
		logger.debug("컨트롤러 End : updateEduRndRegMod, 결과값 {}", result);
		return result;
	}

	@RequestMapping(value = "/views/admin/pop/deleteEduRndRegMod", method = RequestMethod.POST)
	public @ResponseBody boolean deleteEduRndRegMod(EduRndRegModVo errmVo) {
		logger.debug("컨트롤러 Start : deleteEduRndRegMod");
		cmmService.objFieldTest(errmVo);
		boolean result = eduRndRegModService.deleteEduRndRegMod(errmVo);
		logger.debug("컨트롤러 End : deleteEduRndRegMod, 결과값 {}", result);
		return result;
	}

}
