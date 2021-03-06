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
import com.ibk.itep.vo.myClass.EduListSrchVO;
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
							   HttpServletRequest request, Model model, EduMyHistoryVO vo) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		//전체 리스트 건수 및 페이지 계산
		double listCnt = myClassService.selectHistoryList(sttgYmd, fnshYmd, ssnInfo, -1).size();
		double listcntD1 = listCnt/10;
		double listcntD2 = Math.ceil(listcntD1);
		int listSize = (int) listcntD2;
		logger.info(" listCnt : "+listCnt);
		logger.info(" listcntD1 : "+listcntD1);
		logger.info(" listcntD2 : "+listcntD2);
		logger.info(" listSize : "+listSize);
		
		List<EduMyHistoryVO> eduMyHistroy = myClassService.selectHistoryList(sttgYmd, fnshYmd, ssnInfo, 0);
		
		model.addAttribute("listSize",listSize);
		model.addAttribute("eduMyHistroy", eduMyHistroy);
		
		return "/myClass/eduMyHistory";
	}

	/*수강신청이력 > 기간 조회 + 페이지 넘기기*/
	@RequestMapping(value = "/views/myClass/eduHistorySearch", method = RequestMethod.POST)
	public @ResponseBody List<EduMyHistoryVO> completeSearch(@RequestParam(value="sttgYmd", required=false) String sttgYmd,
			             @RequestParam(value="fnshYmd", required=false) String fnshYmd, @RequestParam("pageNum") String pageNum, HttpServletRequest request, Model model) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		logger.info("기간조회 시 pageNum :" + pageNum);
		int pageSet = (Integer.parseInt(pageNum)-1)*10;
		logger.info("기간조회 시 pageSet :" + pageSet);
		
		List<EduMyHistoryVO> eduMyHistroy = myClassService.selectHistoryList(sttgYmd, fnshYmd, ssnInfo, pageSet);
		model.addAttribute("eduMyHistroy", eduMyHistroy);
		
		return eduMyHistroy;
	}

}