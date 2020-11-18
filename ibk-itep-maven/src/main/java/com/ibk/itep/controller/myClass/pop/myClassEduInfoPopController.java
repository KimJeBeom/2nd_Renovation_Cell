package com.ibk.itep.controller.myClass.pop;

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
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.EduReadyVO;

@Controller
public class myClassEduInfoPopController{
	
	@Autowired
	private MyClassService myClassService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*교육 신청내용 상세조회*/
	@RequestMapping(value = "/views/myClass/pop/eduInfoPop", method = RequestMethod.GET)
	public  String EduInfo(@RequestParam(value = "edctAplcId") int edctAplcId, Model model) {
		EduInfoPopVO eduInfoPop = myClassService.getEduInfoPop(edctAplcId);
		
		model.addAttribute("eduInfoPop", eduInfoPop);
		
		return "/myClass/pop/eduInfoPop";
}
	
	/*수강신청 목록 - 반려건 재결재요청*/
	@RequestMapping(value = "/views/myClass/pop/eduInfoPop/reApply", method = RequestMethod.POST)
	public @ResponseBody int reApply(@RequestParam("edctAplcId") int edctAplcId, Model model) {

		return myClassService.updateEduInfoPop(edctAplcId);

	}

}
