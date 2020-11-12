package com.ibk.itep.controller.apprMng;

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

import com.ibk.itep.service.ApprMngService;
import com.ibk.itep.vo.ApprListDetailVo;
import com.ibk.itep.vo.ApprListVo;
import com.ibk.itep.vo.SessionVo;

@Controller
public class ApprListController{
	
	private static final Logger logger = LoggerFactory.getLogger(ApprListController.class);
	
	@Autowired
	private ApprMngService apprMngService;
	
	@RequestMapping(value = "/views/apprMng/apprList", method = RequestMethod.POST)
	public String apprListPOST(Model model) {
	    
		return apprList(model);
	}

	@RequestMapping(value = "/views/apprMng/apprList", method = RequestMethod.GET)
	public String apprList(Model model) {
	    
		/* 테스트를 위한 임의의 세션VO 객체 생성 */
		SessionVo ssnVO = new SessionVo();
		ssnVO.setUserId("42664");
		ssnVO.setBrcd("0710");
		ssnVO.setAthrCd("ADM");
		
		/* 결재목록 조회 */
		List<ApprListVo> apprList = apprMngService.selectApprList(ssnVO); 
		ApprListDetailVo apprDetail = null; // 상세 내용을 담기위한 객체
		
		/* 결재 대상이 하나라도 있으면 첫번째 결재건에 대한 상세내용 조회 */
		if(apprList != null) {
			int edctAplcId = apprList.get(0).getEdctAplcId(); // 첫번째 결재건의 신청ID
			apprDetail = apprMngService.selectApprListDetail(edctAplcId); // 상세내용 조회
		}
		model.addAttribute("apprList", apprList);
		model.addAttribute("apprDetail", apprDetail);
		
		return "/apprMng/apprList";
	}

	@RequestMapping(value = "/views/apprMng/apprListDetail", method = RequestMethod.POST)
	public @ResponseBody ApprListDetailVo apprListDetail(@RequestParam("edctAplcId") String edctAplcId) {
		
		// Service한테 결재상세정보 받아오기
		ApprListDetailVo apprListDetail = apprMngService.selectApprListDetail(Integer.parseInt(edctAplcId));
		return apprListDetail;
	}
}








