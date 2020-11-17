package com.ibk.itep.controller.myClass;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduCompleteVO;

@Controller
public class EduCompleteController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MyClassService myClassService;

	/*수강완료한 교육*/
	@RequestMapping(value = "/views/myClass/eduComplete", method = RequestMethod.GET)
	public String eduComplete(Model model) {
		
		SessionVo ssnVo = new SessionVo();
		ssnVo.setUserId("42374");
		ssnVo.setBrcd("0710");
		ssnVo.setAthrCd("ADM");
		
		List<EduCompleteVO> eduCompleteList = myClassService.getCompleteList(ssnVo);
		
		model.addAttribute("eduCompleteList", eduCompleteList);

		return "/myClass/eduComplete";
	}

}
