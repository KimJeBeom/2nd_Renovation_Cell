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
import com.ibk.itep.repository.CmmDao;
import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.service.admin.EduRegModService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.cmm.CldVo;



@Controller
public class EduRegModController{
	
	private static final Logger logger = LoggerFactory.getLogger(EduRegModController.class);
	
	
	@Autowired
	private EduRegModService eduRegModService;
	@Autowired
	private CmmService cmmService;
	
	
	@RequestMapping(value = "/views/admin/eduRegMod", method = RequestMethod.POST)
	public String eduRegModPOST(Model model) {
	    
		return eduRegMod(model);
	}
	
	@RequestMapping(value = "/views/admin/eduRegMod", method = RequestMethod.GET)
	public String eduRegMod(Model model) {		
		
		CldVo cldVo = new CldVo();
		cldVo.setUseYn("Y");
		
		List<CldVo> cldVoList = cmmService.selectCld(cldVo);
		model.addAttribute("cldVoList", cldVoList);
/*		EduRegModVo ermVo = new EduRegModVo();
		
		List<EduRegModVo> eduRegModVoList = eduRegModService.selectEduRegMod(ermVo);
		model.addAttribute("eduRegModVoList", eduRegModVoList);*/
		return "/admin/eduRegMod";
	}
	
	@RequestMapping(value = "/views/admin/selectEduRegMod", method = RequestMethod.POST)
	public @ResponseBody List<EduRegModVo> selectEduRegMod(@RequestParam("edctClsfCd") String edctClsfCd, @RequestParam("edctNm") String edctNm) {
		logger.info("컨트롤러 진입완료");
		EduRegModVo ermVo = new EduRegModVo();
		ermVo.setEdctClsfCd(edctClsfCd);
		ermVo.setEdctNm(edctNm);
		
		List<EduRegModVo> eduRegModVoList = eduRegModService.selectEduRegMod(ermVo);
		logger.info("{}", eduRegModVoList);
		
		return eduRegModVoList;		
	}
	

}
