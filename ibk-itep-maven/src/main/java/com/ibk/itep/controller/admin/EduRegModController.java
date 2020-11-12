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
import com.ibk.itep.repository.CmmDao;
import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.cmm.CldVo;



@Controller
public class EduRegModController{
	
	private static final Logger logger = LoggerFactory.getLogger(EduRegModController.class);

	@RequestMapping(value = "/views/admin/eduRegMod", method = RequestMethod.GET)
	public String eduRegMod(Locale locale, Model model) {

		logger.info("Start_EduRegModController", locale);
		
		CldVo tst = new CldVo();
		logger.info("make finish cldvo");		
		logger.info("before set y : {}.", tst);
		tst.setUseYn("Y");
		logger.info("after set y : {}.", tst.getUseYn());
		
		CmmDao cdao = new CmmDao();
		logger.info("make finish cmmdao");
		
		
		
		//List<cldVo> resultlist = new List<cldVo>; 
		
		logger.info("{}.", cdao.selectCld(tst));
		
		
		
		
		
		return "/admin/eduRegMod";
	}

}
