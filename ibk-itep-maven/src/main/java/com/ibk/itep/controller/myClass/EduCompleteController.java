package com.ibk.itep.controller.myClass;

import java.util.List;

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
import com.ibk.itep.vo.apprMng.ApprStatVo;
import com.ibk.itep.vo.myClass.EduCompleteVO;

@Controller
public class EduCompleteController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MyClassService myClassService;

	/*수강완료한 교육*/
	@RequestMapping(value = "/views/myClass/eduComplete", method = RequestMethod.GET)
	public String eduComplete(@RequestParam(value="sttgYmd", required=false) String sttgYmd
							, @RequestParam(value="fnshYmd", required=false) String fnshYmd, Model model) {

		List<EduCompleteVO> eduCompleteList = myClassService.selectEduComplete(sttgYmd, fnshYmd);
		
		model.addAttribute("eduCompleteList", eduCompleteList);

		return "/myClass/eduComplete";
	}

	/*수강완료한 교육 > 기간 조회*/
	@RequestMapping(value = "/views/myClass/completeSearch", method = RequestMethod.POST)
	public @ResponseBody List<EduCompleteVO> completeSearch(@RequestParam(value="sttgYmd", required=false) String sttgYmd
						 , @RequestParam(value="fnshYmd", required=false) String fnshYmd, Model model) {
		
		List<EduCompleteVO> eduCompleteList = myClassService.selectEduComplete(sttgYmd, fnshYmd);
		
		return eduCompleteList;
	}

}
