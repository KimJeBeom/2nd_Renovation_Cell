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

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.ApprMngService;
import com.ibk.itep.vo.apprMng.ApprStatDetailVo;
import com.ibk.itep.vo.apprMng.ApprStatVo;

@Controller
public class ApprStatController{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ApprMngService apprMngService;
	
	/* 결재현황, 첫번째 결재건의 결재이력 조회 */
	@RequestMapping(value = "/views/apprMng/apprStat", method = RequestMethod.GET)
	public String apprStat(@RequestParam(value="sttgYmd", required=false) String sttgYmd
						 , @RequestParam(value="fnshYmd", required=false) String fnshYmd
						 , @RequestParam(value="aplcStg", required=false) String aplcStg, Model model) {
		
		/* 결재현황 조회 */
		List<ApprStatVo> apprStat = apprMngService.selectApprStat(sttgYmd, fnshYmd, aplcStg);
		ApprStatDetailVo apprDetail = null; // 상세 내용을 담기위한 객체
		
		/* 결재 대상이 하나라도 있으면 첫번째 결재건에 대한 상세내용 조회 */
		if(apprStat != null) {
			if (!apprStat.isEmpty()) {
				int edctAplcId = apprStat.get(0).getEdctAplcId(); // 첫번째 결재건의 신청ID
				apprDetail = apprMngService.selectApprStatDetail(edctAplcId); // 상세내용 조회
			}
		}
		model.addAttribute("apprStat", apprStat);
		model.addAttribute("apprDetail", apprDetail);
		
		return "/apprMng/apprStat";
	}

	@RequestMapping(value = "/views/apprMng/apprStatSearch", method = RequestMethod.POST)
	public @ResponseBody List<ApprStatVo> apprStatSearch(@RequestParam(value="sttgYmd", required=false) String sttgYmd
						 , @RequestParam(value="fnshYmd", required=false) String fnshYmd
						 , @RequestParam(value="aplcStg", required=false) String aplcStg, Model model) {
		
		List<ApprStatVo> apprStat = apprMngService.selectApprStat(sttgYmd, fnshYmd, aplcStg);
		return apprStat;
	}
	
	/* 교육신청ID에 따른 상세내용 조회 */
	@RequestMapping(value = "/views/apprMng/apprStatDetail", method = RequestMethod.POST)
	public @ResponseBody ApprStatDetailVo apprStatDetail(@RequestParam("edctAplcId") String edctAplcId) {
		ApprStatDetailVo apprStatDetail = apprMngService.selectApprStatDetail(Integer.parseInt(edctAplcId));
		return apprStatDetail;
	}
}
