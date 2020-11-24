package com.ibk.itep.controller.admin;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

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
import com.ibk.itep.vo.cmm.CldVo;

@Controller
public class EduReadyStatController{
	
	@Autowired
	private EduReadyStatService eduReadyStatService;

	@Autowired
	private CmmService cmmService;

	/* 수강신청현황 & 과정개설신청현황 */
	@RequestMapping(value = "/views/admin/eduReadyStat", method = RequestMethod.GET)
	public String eduReadyStat(Model model) {

		// 수강신청현황 조회
		List<EduReadyStatVo> eduReadyStatList = eduReadyStatService.selectEduReadyStat("", "", "", "");
		
		// 과정개설신청현황 조회
		List<EduOpenReadyStatVo> edoList = eduReadyStatService.selectEduOpenReadyStat("", "", "");
		
		// 교육분류 조회
		CldVo cldVo = new CldVo();
		cldVo.setUseYn("Y");
		List<CldVo> cldList = cmmService.selectCld(cldVo);

		model.addAttribute("eduReadyStatList", eduReadyStatList );
		model.addAttribute("edoList", edoList );
		model.addAttribute("cldList", cldList );
		
		return "/admin/eduReadyStat";
	}
	
	/* 수강신청현황 검색 */
	@RequestMapping(value = "/views/admin/eduReadyStatSearch", method = RequestMethod.POST)
	public @ResponseBody List<EduReadyStatVo> eduReadyStatSearch(HttpServletRequest request, Model model 
						 			 , @RequestParam(value="sttgYmd", required=false) String sttgYmd
									 , @RequestParam(value="fnshYmd", required=false) String fnshYmd
									 , @RequestParam(value="edctClsfCd", required=false) String edctClsfCd
									 , @RequestParam(value="edctNm", required=false) String edctNm) {
		
		// 수강신청현황 조회
		List<EduReadyStatVo> eduReadyStatList = eduReadyStatService.selectEduReadyStat(sttgYmd, fnshYmd, edctClsfCd, edctNm);
		return eduReadyStatList;
	}
	
	/* 과정개설신청현황 검색 */
	@RequestMapping(value = "/views/admin/eduOpenReadyStatSearch", method = RequestMethod.POST)
	public @ResponseBody List<EduOpenReadyStatVo> eduOpenReadyStatSearch(HttpServletRequest request, Model model 
						 			 , @RequestParam(value="cnfaYn", required=false) String cnfaYn
									 , @RequestParam(value="userIdNm", required=false) String userIdNm
									 , @RequestParam(value="edctNm", required=false) String edctNm) {
		
		// 과정개설신청현황 조회
		List<EduOpenReadyStatVo> edoList = eduReadyStatService.selectEduOpenReadyStat(cnfaYn, userIdNm, edctNm);
		return edoList;
	}
}
