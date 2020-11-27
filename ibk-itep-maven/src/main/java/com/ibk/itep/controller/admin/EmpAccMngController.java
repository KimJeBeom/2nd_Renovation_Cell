package com.ibk.itep.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ibk.itep.service.admin.EmpAccMngService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EmpAccMngVo;
import com.ibk.itep.vo.cmm.ClaVo;
import com.ibk.itep.vo.cmm.CmbVo;

@Controller
public class EmpAccMngController{
	
	@Autowired
	private EmpAccMngService eduAccMngService;
	
	@Autowired
	private CmmService cmmService;

	@RequestMapping(value = "/views/admin/empAccMng", method = RequestMethod.GET)
	public String empAccList(Model model) {
		
		List<EmpAccMngVo> empAccList = eduAccMngService.selectEmpAccMng("", "", "");
		List<CmbVo> cmbList = cmmService.selectCmb();
		
		ClaVo claVo = new ClaVo();
		claVo.setUseYn("Y");
		List<ClaVo> claList = cmmService.selectCla(claVo);

		model.addAttribute("empAccList", empAccList );
		model.addAttribute("cmbList", cmbList );
		model.addAttribute("claList", claList );
		return "/admin/empAccMng";
	}
	
	
	/* 사용자 계정 검색 */
	@RequestMapping(value = "/views/admin/empAccMngSearch", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> empAccMngSearch(Model model 
						 			 , @RequestParam(value="brcd", required=false) String brcd
									 , @RequestParam(value="userIdNm", required=false) String userIdNm
									 , @RequestParam(value="athrCd", required=false) String athrCd) {
		
		List<EmpAccMngVo> empAccList = eduAccMngService.selectEmpAccMng(brcd, userIdNm, athrCd);
		
		ClaVo claVo = new ClaVo();
		claVo.setUseYn("Y");
		List<ClaVo> claList = cmmService.selectCla(claVo);
		
		// 사용자리스트와 권한리스트를 같이 반환하기 위해 HashMap 사용
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("empAccList", empAccList);
		result.put("claList", claList);
		
		return result;
	}
	
	
	/* 사용자 계정권한 변경 */
	@RequestMapping(value = "/views/admin/updateEmpAccMng", method = RequestMethod.POST)
	public String updateEmpAccMng(Model model 
						 			 , @RequestParam(value="brcd", required=false) String brcd
									 , @RequestParam(value="userIdNm", required=false) String userIdNm
									 , @RequestParam(value="athrCd", required=false) String athrCd
									 , @RequestParam(value="userId") String userId
									 , @RequestParam(value="athrCdTobe") String athrCdTobe) {
		
		eduAccMngService.updateEmpAccMng(userId, athrCdTobe);
		
		return "forward:/views/admin/empAccMngSearch";
	}
	
	
	/* 엑셀 다운로드 */
	@RequestMapping(value = "/views/admin/EmpAccMngExcelDown", method = RequestMethod.POST)
	public void EmpAccMngExcelDown(MultipartHttpServletRequest req, HttpServletResponse res) {

        eduAccMngService.EmpAccMngExcelDown(req, res);  
	}

}
