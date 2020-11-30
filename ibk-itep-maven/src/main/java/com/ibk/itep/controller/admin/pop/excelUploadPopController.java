package com.ibk.itep.controller.admin.pop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibk.itep.controller.HomeController;

@Controller
public class excelUploadPopController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/views/admin/pop/excelUploadPop", method = RequestMethod.GET)
	public String excelUploadPop(Model model) {
		
		return "/admin/pop/excelUploadPop";
	}
}
