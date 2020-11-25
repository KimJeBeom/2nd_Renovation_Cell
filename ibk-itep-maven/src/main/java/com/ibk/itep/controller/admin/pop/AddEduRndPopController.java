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
		logger.info("selectEduRndRegMod 컨트롤러 진입완료");		
		List<EduRndRegModVo> errmVoList = eduRndRegModService.selectEduRndRegMod(errmVo);
		int id = errmVoList.get(0).getEdctCntId();
		logger.debug("selectEduRndRegMod 컨트롤러 종료 직전 edct cnt id : {}", id);
		
		return errmVoList;		
	}
	
	@RequestMapping(value = "/views/admin/pop/insertEduRndRegMod", method = RequestMethod.POST)
	public @ResponseBody boolean insertEduRndRegMod(EduRndRegModVo errmVo) {
		logger.debug("컨트롤러 Start : insertEduRndRegMod : errmVo : {}",errmVo.toString());
		cmmService.objFieldTest(errmVo);
		//List<EduRndRegModVo> errmVoList = eduRndRegModService.selectEduRndRegMod(errmVo);
		//int id = errmVoList.get(0).getEdctCntId();
		logger.debug("컨트롤러 End : insertEduRndRegMod ");
		
		return true; 
	}
	
	/*
	 * @RequestMapping(value = "/views/admin/selectEduRndRegModDetail", method =
	 * RequestMethod.POST) public @ResponseBody List<EduRndRegModVo>
	 * selectEduRndRegModDetail(EduRndRegModVo errmVo) {
	 * logger.info("selectEduRndRegModDetail 컨트롤러 진입완료"); List<EduRndRegModVo>
	 * errmVoList = eduRndRegModService.selectEduRndRegMod(errmVo);
	 * logger.debug("selectEduRndRegModDeatil 컨트롤러 종료 직전");
	 * 
	 * return errmVoList; }
	 */

}
