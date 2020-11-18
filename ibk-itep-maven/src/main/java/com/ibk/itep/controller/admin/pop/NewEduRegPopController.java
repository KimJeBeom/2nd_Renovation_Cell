package com.ibk.itep.controller.admin.pop;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.admin.EduRegModService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;

@Controller
public class NewEduRegPopController{	
	
	private static final Logger logger = LoggerFactory.getLogger(NewEduRegPopController.class);
	
	@Autowired
	private CmmService cmmService;
	@Autowired
	private EduRegModService eduRegModService;

	@RequestMapping(value = "/views/admin/pop/newEduRegPop", method = RequestMethod.GET)
	public String newEduRegPop(Model model) {
		logger.info("컨트롤러 진입완료");
		CldVo cldVo = new CldVo();
		CliVo cliVo = new CliVo();
		cldVo.setUseYn("Y");
		cliVo.setUseYn("Y");
		
		List<CldVo> cldVoList = cmmService.selectCld(cldVo);
		List<CliVo> cliVoList = cmmService.selectCli(cliVo);
		model.addAttribute("cldVoList", cldVoList);
		model.addAttribute("cliVoList", cliVoList);
		
		return "/admin/pop/newEduRegPop";
	}
	
	@RequestMapping(value = "/views/admin/pop/insertNewEduRegPop", method = RequestMethod.POST)
	public @ResponseBody boolean insertNewEduRegPop(EduRegModVo ermVo) {
		logger.info("insert 컨트롤러 진입완료");
		return eduRegModService.insertEduRegMod(ermVo);
		
	}

}
