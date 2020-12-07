package com.ibk.itep.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ibk.itep.service.admin.EduRegModService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.cmm.CldVo;



@Controller
public class EduRegModController{
	
	private static final Logger logger = LoggerFactory.getLogger(EduRegModController.class);
	
	
	@Autowired
	private EduRegModService eduRegModService;
	@Autowired
	private CmmService cmmService;
	
	
	@RequestMapping(value = "/views/admin/eduRegMod", method = RequestMethod.POST)
	public String eduRegModPOST(Model model) {
	    
		return eduRegMod(model);
	}
	
	@RequestMapping(value = "/views/admin/eduRegMod", method = RequestMethod.GET)
	public String eduRegMod(Model model) {		
		
		CldVo cldVo = new CldVo();
		cldVo.setUseYn("Y");
		
		List<CldVo> cldVoList = cmmService.selectCld(cldVo);
		model.addAttribute("cldVoList", cldVoList);
/*		EduRegModVo ermVo = new EduRegModVo();
		
		List<EduRegModVo> eduRegModVoList = eduRegModService.selectEduRegMod(ermVo);
		model.addAttribute("eduRegModVoList", eduRegModVoList);*/
		return "/admin/eduRegMod";
	}
	
	@RequestMapping(value = "/views/admin/selectEduRegMod", method = RequestMethod.POST)
	public @ResponseBody List<EduRegModVo> selectEduRegMod(
			@RequestParam("edctClsfCd") String edctClsfCd,
			@RequestParam("edctNm") String edctNm,
			@RequestParam(value="pageNum", required = false) String pageNum) { //현재 페이지
		
		logger.info("컨트롤러 진입완료");
		EduRegModVo ermVo = new EduRegModVo();
		ermVo.setEdctClsfCd(edctClsfCd);
		ermVo.setEdctNm(edctNm);
		logger.info(" --- pageNum" + pageNum);		
		int pageSet = (Integer.parseInt(pageNum)-1)*10; //현재 페이지 숫자를 쿼리의 offset설정값으로 변환(2->10)
		ermVo.setPageSet(pageSet);
		
		List<EduRegModVo> eduRegModVoList = eduRegModService.selectEduRegMod(ermVo);
		logger.info("{}", eduRegModVoList);
		
		return eduRegModVoList;		
	}
	
	@RequestMapping(value = "/views/admin/deleteEduRegMod", method = RequestMethod.POST)
	public @ResponseBody boolean deleteEduRegMod(@RequestParam("edctId") int edctId) {
		logger.info("컨트롤러 진입완료");
		EduRegModVo ermVo = new EduRegModVo();
		ermVo.setEdctId(edctId);
		
		boolean result=eduRegModService.deleteEduRegMod(ermVo);
		return result;		
	}
	
	/* 엑셀 다운로드 */
	@RequestMapping(value = "/views/admin/EduRegModExcelDown", method = RequestMethod.POST)
	public void EduRegModExcelDown(MultipartHttpServletRequest req, HttpServletResponse res) {

		eduRegModService.EduRegModExcelDown(req, res);  
	}

}
