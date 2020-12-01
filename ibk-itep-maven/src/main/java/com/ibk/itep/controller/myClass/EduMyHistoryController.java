package com.ibk.itep.controller.myClass;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ibk.itep.vo.myClass.EduCompleteVO;
import com.ibk.itep.vo.myClass.EduMyHistoryVO;

@Controller
public class EduMyHistoryController{
	
	
	private static final Logger logger = LoggerFactory.getLogger(EduMyHistoryController.class);
	
	@Autowired
	private MyClassService myClassService;

	/*수강신청 이력조회*/
	@RequestMapping(value = "/views/myClass/eduMyHistory", method = RequestMethod.GET)
	public String eduMyHistory(@RequestParam(value="sttgYmd", required=false) String sttgYmd,
							   @RequestParam(value="fnshYmd", required=false) String fnshYmd, 
							   HttpServletRequest request, Model model) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
			
		List<EduMyHistoryVO> eduMyHistroy = myClassService.selectHistoryList(sttgYmd, fnshYmd, ssnInfo);
		
		
		model.addAttribute("eduMyHistroy", eduMyHistroy);
		
		return "/myClass/eduMyHistory";
	}

	/*수강신청이력 > 기간 조회*/
	@RequestMapping(value = "/views/myClass/eduHistorySearch", method = RequestMethod.POST)
	public @ResponseBody List<EduMyHistoryVO> completeSearch(EduMyHistoryVO vo, @RequestParam(value="sttgYmd", required=false) String sttgYmd,
			             @RequestParam(value="fnshYmd", required=false) String fnshYmd, @RequestParam("pageNum") String pageNum, HttpServletRequest request, Model model) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		int pageSet = (Integer.parseInt(pageNum)-1)*10;
		vo.setPageSet(pageSet); //List로 받아올 페이지 Set
		
		List<EduMyHistoryVO> eduMyHistroy = myClassService.selectHistoryList(sttgYmd, fnshYmd, ssnInfo);
		
		return eduMyHistroy;
	}

}