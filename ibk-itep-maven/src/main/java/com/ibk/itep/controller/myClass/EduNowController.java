package com.ibk.itep.controller.myClass;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.controller.myClass.EduNowController;
import com.ibk.itep.repository.MyClassDao;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.EduNowVO;

@Controller
public class EduNowController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(EduNowController.class);
	
	@Autowired
	private MyClassService myClassService;

	/*수강중인 교육 조회*/
	@RequestMapping(value = "/views/myClass/eduNow", method = RequestMethod.GET)
	public String EduNow(HttpServletRequest request, Model model) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");

		List<EduNowVO> eduNowList = myClassService.getList(ssnInfo);
		model.addAttribute("eduNowList", eduNowList);
				
		return "/myClass/eduNow";
	}	
}