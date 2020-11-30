package com.ibk.itep.controller.eduApply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.eduApply.EduListService;
import com.ibk.itep.vo.eduApply.EduListVo;

@Controller
public class EduListController{
	
	@Autowired private EduListService service;
	
	private static final Logger logger = LoggerFactory.getLogger(EduListController.class);

	//GET거래 : 최초 조회시
	@RequestMapping(value = "/views/eduApply/eduList", method = RequestMethod.GET)
	public String EduListGET(Model model) {
		logger.info("EduListGET Start");
		
		//전체 리스트 개수 및 페이지수 계산 로직
		int cntAll = -1; //OffSet없이 조회됨
		double listcnt = service.getList("","","TOTAL",cntAll).size();
		double listcntD1 = listcnt/10;
		double listcntD2 = Math.ceil(listcntD1);
		int listSize = (int) listcntD2;
		logger.info("-- listCnt line : "+listSize);
		logger.info("-- listCnt line : "+listcntD1);
		logger.info("-- listCnt line : "+listcntD2);
		
		//최초 화면 호출시 '전체' 탭의 1번째 페이지 호출
		List<EduListVo> list = service.getList("","","TOTAL",0);
		model.addAttribute("listSize",listSize);
		model.addAttribute("list", list);
		
		logger.info("EduListGET End");
			
		return "/eduApply/eduList";
	}
	
	//POST거래 : 탭변경 / 조회 / 페이지변경
	@RequestMapping(value = "/views/eduApply/eduList", method = RequestMethod.POST)
	public @ResponseBody List<EduListVo> EduListPOST(Model model, HttpServletRequest request,
		   @RequestParam(value="schType", required = false) String schType, //조회조건
		   @RequestParam(value="schValue", required = false) String schValue, //조회값
		   @RequestParam(value="tabValue", required = false) String tabValue, //선택 탭
		   @RequestParam(value="pageNum", required = false) String pageNum) { //현재 페이지
		logger.info("EduListPOST Start");
		
		logger.info(" --- pageNum" + pageNum);		
		int pageSet = (Integer.parseInt(pageNum)-1)*10; //현재 페이지 숫자를 쿼리의 offset설정값으로 변환(2->10)
		
		//설정된 pageSet의 현재 탭 리스트 값 출력
		List<EduListVo> list = service.getList(schType,schValue,tabValue,pageSet);
		logger.info("Service Retrn OK");
		logger.info("-- List line : "+list.size());
		
		//model을 통한 결과값 화면(.jsp)에 전달
		model.addAttribute("list", list);
		logger.info("EduListPOST End");
			
		return list;
		
	}

}
