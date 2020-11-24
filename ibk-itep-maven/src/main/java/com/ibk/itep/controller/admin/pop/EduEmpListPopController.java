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

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.admin.EduReadyStatService;
import com.ibk.itep.vo.admin.EduEmpListVo;

@Controller
public class EduEmpListPopController{
	
	@Autowired
	private EduReadyStatService eduReadyStatService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/views/admin/pop/eduEmpListPop", method = RequestMethod.GET)
	public String eduEmpListPop(Model model	, @RequestParam(value="edctCntId", required=false) String edctCntId) {

		List<EduEmpListVo> eduEmpList = eduReadyStatService.selectEduEmpListPop(edctCntId);

		model.addAttribute("eduEmpList", eduEmpList );		
		return "/admin/pop/eduEmpListPop";
	}

}
