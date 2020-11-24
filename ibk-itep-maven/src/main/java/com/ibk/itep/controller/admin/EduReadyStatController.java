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

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.cmm.CldVo;

@Controller
public class EduReadyStatController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(EduReadyStatController.class);
	
	
	@Autowired
	private CmmService cmmService;

	@RequestMapping(value = "/views/admin/eduReadyStat", method = RequestMethod.GET)
	public String home(Model model) {
		
		CldVo cldVo = new CldVo();
		cldVo.setUseYn("Y");
		
		List<CldVo> cldVoList = cmmService.selectCld(cldVo);
		model.addAttribute("cldVoList", cldVoList);

		return "/admin/eduReadyStat";
	}

}
