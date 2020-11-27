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

import com.ibk.itep.service.admin.EduRegModService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;

@Controller
public class EduModPopController{

	private static final Logger logger = LoggerFactory.getLogger(EduModPopController.class);
	
	@Autowired
	private EduRegModService eduRegModService;
	@Autowired
	private CmmService cmmService;
	
	@RequestMapping(value = "/views/admin/pop/eduModPop", method = RequestMethod.GET)
	public String eduModPop(EduRegModVo ermVo, Model model) {
		logger.debug("컨트롤러 Start - eduModPop / edctId = {}", ermVo.getEdctId());
		//Start  [공통] 교육 분류 교육 기관 받아오는 부분 //
		CldVo cldVo = new CldVo();
		CliVo cliVo = new CliVo();
		cldVo.setUseYn("Y");
		cliVo.setUseYn("Y");
		List<CldVo> cldVoList = cmmService.selectCld(cldVo);
		List<CliVo> cliVoList = cmmService.selectCli(cliVo);
		
		model.addAttribute("cldVoList", cldVoList);
		model.addAttribute("cliVoList", cliVoList);
		//End  [공통] 교육 분류 교육 기관 받아오는 부분 //
		
		//Start 교육 상세정보 받아오는 부분 //
		cmmService.objFieldTest(ermVo);
		ermVo = eduRegModService.selectEduRegModDetail(ermVo);
		cmmService.objFieldTest(ermVo);
		
		model.addAttribute("eduRegModVo", ermVo);
		//End 교육 상세정보 받아오는 부분 //
		logger.debug("컨트롤러 End - eduModPop");
		
		return "/admin/pop/eduModPop";
	}
	
	@RequestMapping(value = "/views/admin/pop/updateEduRegMod", method = RequestMethod.POST)
	public @ResponseBody boolean updateEduRegMod(EduRegModVo ermVo) {
		//교육메인정보 update
		logger.debug("컨트롤러 Start - updateEduRegMod / edctId = {}", ermVo.getEdctId());
		cmmService.objFieldTest(ermVo);
		boolean result = eduRegModService.updateEduRegMod(ermVo);
		logger.debug("컨트롤러 End - updateEduRegMod, 결과값 {}", result);
		
		return result;
	}

}
