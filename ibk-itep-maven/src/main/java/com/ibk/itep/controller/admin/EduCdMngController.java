package com.ibk.itep.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.admin.EduCdMngService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;

@Controller
public class EduCdMngController{
	
	@Autowired
	private CmmService cmmService;
	
	@Autowired
	private EduCdMngService eduCdMngService;
	
	private static final Logger logger = LoggerFactory.getLogger(EduCdMngController.class);

	@RequestMapping(value = "/views/admin/eduCdMng", method = RequestMethod.GET)
	public String eduCdMng(Model model) {
		
		CldVo cldVo = new CldVo();
		List<CldVo> cldList = cmmService.selectCld(cldVo);
		
		CliVo cliVo = new CliVo();
		List<CliVo> cliList = cmmService.selectCli(cliVo);
		
		model.addAttribute("cldList", cldList);
		model.addAttribute("cliList", cliList);
		return "/admin/eduCdMng";
	}
	
	/* 코드 내용 수정 */
	@RequestMapping(value = "/views/admin/updateCmm", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> updateCmm(Model model
									   ,@RequestParam("cldData") String[] cldData
									   ,@RequestParam("cliData") String[] cliData) {
		
		eduCdMngService.updateCmm(cldData, cliData);
		
		CldVo cldVo = new CldVo();
		CliVo cliVo = new CliVo();
		List<CldVo> cldList = cmmService.selectCld(cldVo);
		List<CliVo> cliList = cmmService.selectCli(cliVo);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("cldList", cldList);
		result.put("cliList", cliList);
		return result;
	}
	
	/* 코드 추가 */
	@RequestMapping(value = "/views/admin/pop/addEduCd", method = RequestMethod.POST)
	public @ResponseBody int addEduCd(Model model
									   ,@RequestParam("eduCdType") String eduCdType
									   ,@RequestParam("cd") String cd
									   ,@RequestParam("nm") String nm) {
	
		return eduCdMngService.insertCmm(eduCdType, cd, nm);
	}
}
