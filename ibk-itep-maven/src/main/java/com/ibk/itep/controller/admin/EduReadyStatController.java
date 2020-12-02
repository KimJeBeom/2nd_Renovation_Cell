package com.ibk.itep.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ibk.itep.service.admin.EduReadyStatService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.cmm.CldVo;

@Controller
public class EduReadyStatController{
	
	@Autowired
	private EduReadyStatService eduReadyStatService;

	@Autowired
	private CmmService cmmService;
	
	private static final Logger logger = LoggerFactory.getLogger(EduReadyStatController.class);

	/* 수강신청현황 & 과정개설신청현황 */
	@RequestMapping(value = "/views/admin/eduReadyStat", method = RequestMethod.GET)
	public String eduReadyStat(EduReadyStatVo ersVo, EduOpenReadyStatVo edoVo, Model model){
		
		// 수강신청현황 전체 리스트 크기 조회
		int ersSize = eduReadyStatService.selectEduReadyStat(ersVo).size();
		ersSize = (int) Math.ceil((double)ersSize / 10);
		
		// 수강신청현황 첫번째 페이지 조회
		ersVo.setPageSet(0);
		List<EduReadyStatVo> ersList = eduReadyStatService.selectEduReadyStat(ersVo);
		
		// 과정개설신청현황 전체 리스트 크기 조회
		int edoSize = eduReadyStatService.selectEduOpenReadyStat("", "", "", -1).size();
		edoSize = (int) Math.ceil((double)edoSize / 10);
				
		// 과정개설신청현황 조회
		List<EduOpenReadyStatVo> edoList = eduReadyStatService.selectEduOpenReadyStat("", "", "", 0);
		
		// 교육분류 조회
		CldVo cldVo = new CldVo();
		cldVo.setUseYn("Y");
		List<CldVo> cldList = cmmService.selectCld(cldVo);

		model.addAttribute("ersList", ersList );
		model.addAttribute("edoList", edoList );
		model.addAttribute("ersSize", ersSize );
		model.addAttribute("edoSize", edoSize );
		model.addAttribute("cldList", cldList );
		
		return "/admin/eduReadyStat";
	}
	
	/* 수강신청현황 검색 */
	@RequestMapping(value = "/views/admin/eduReadyStatSearch", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> eduReadyStatSearch(EduReadyStatVo vo, HttpServletRequest req, Model model
											,@RequestParam(value="pageNum", required=false) String pageNum) {
			
		// pageNum < 0 이면 => 전체 카운트 조회 & 첫번째 페이지 조회
		// 그 외는 페이지만큼 조회
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(Integer.parseInt(pageNum) < 0) {
			int listSize = eduReadyStatService.selectEduReadyStat(vo).size();
			listSize = (int) Math.ceil((double)listSize / 10);
			
			vo.setPageSet(0);
			List<EduReadyStatVo> list = eduReadyStatService.selectEduReadyStat(vo);
			
			result.put("listSize", listSize);
			result.put("list", list);
		}
		else {
			vo.setPageSet((Integer.parseInt(pageNum)-1)*10);
			List<EduReadyStatVo> list = eduReadyStatService.selectEduReadyStat(vo);
			
			result.put("list", list);
		}
		
		return result;
	}
	
	/* 과정개설신청현황 검색 */
	@RequestMapping(value = "/views/admin/eduOpenReadyStatSearch", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> eduOpenReadyStatSearch(HttpServletRequest request, Model model 
						 			 , @RequestParam(value="cnfaYn", required=false) String cnfaYn
									 , @RequestParam(value="userIdNm", required=false) String userIdNm
									 , @RequestParam(value="edctNm", required=false) String edctNm
									 , @RequestParam(value="pageNum", required=false) String pageNum) {
		
		// pageNum < 0 이면 => 전체 카운트 조회 & 첫번째 페이지 조회
		// 그 외는 페이지만큼 조회
				
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(Integer.parseInt(pageNum) < 0) {
			int listSize = eduReadyStatService.selectEduOpenReadyStat(cnfaYn, userIdNm, edctNm, -1).size();
			listSize = (int) Math.ceil((double)listSize / 10);
			
			List<EduOpenReadyStatVo> list = eduReadyStatService.selectEduOpenReadyStat(cnfaYn, userIdNm, edctNm, 0);
			
			result.put("listSize", listSize);
			result.put("list", list);
		}
		else {
			List<EduOpenReadyStatVo> list = eduReadyStatService.selectEduOpenReadyStat(cnfaYn, userIdNm, edctNm, (Integer.parseInt(pageNum)-1)*10);
			
			result.put("list", list);
		}
		
		return result;
	}
}
