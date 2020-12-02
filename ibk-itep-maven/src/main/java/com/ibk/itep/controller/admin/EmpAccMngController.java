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
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
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
		
		// 전체 리스트 크기 조회
		int listSize = eduAccMngService.selectEmpAccMng("", "", "", -1).size();
		listSize = (int) Math.ceil((double)listSize / 10);
				
		List<EmpAccMngVo> empAccList = eduAccMngService.selectEmpAccMng("", "", "", 0);
		List<CmbVo> cmbList = cmmService.selectCmb();
		
		ClaVo claVo = new ClaVo();
		claVo.setUseYn("Y");
		List<ClaVo> claList = cmmService.selectCla(claVo);

		model.addAttribute("empAccList", empAccList );
		model.addAttribute("cmbList", cmbList );
		model.addAttribute("claList", claList );
		model.addAttribute("listSize", listSize );
		return "/admin/empAccMng";
	}
	
	
	/* 사용자 계정 검색 */
	@RequestMapping(value = "/views/admin/empAccMngSearch", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> empAccMngSearch(Model model 
						 			 , @RequestParam(value="brcd", required=false) String brcd
									 , @RequestParam(value="userIdNm", required=false) String userIdNm
									 , @RequestParam(value="athrCd", required=false) String athrCd
									 , @RequestParam(value="pageNum", required=false) String pageNum) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		// pageNum < 0 이면 => 전체 카운트 조회 & 첫번째 페이지 조회
		// 그 외는 페이지만큼 조회
		if(Integer.parseInt(pageNum) < 0) {
			int listSize = eduAccMngService.selectEmpAccMng(brcd, userIdNm, athrCd, -1).size();
			listSize = (int) Math.ceil((double)listSize / 10);
			
			List<EmpAccMngVo> list = eduAccMngService.selectEmpAccMng(brcd, userIdNm, athrCd, 0);
			
			result.put("listSize", listSize);
			result.put("list", list);
		}
		else {
			List<EmpAccMngVo> list = eduAccMngService.selectEmpAccMng(brcd, userIdNm, athrCd, (Integer.parseInt(pageNum)-1)*10);
			
			result.put("list", list);
		}
		
		ClaVo claVo = new ClaVo();
		claVo.setUseYn("Y");
		List<ClaVo> claList = cmmService.selectCla(claVo);
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

	/* 엑셀 업로드 - 현재 미사용 */ 
	/*
	 * @RequestMapping(value = "/views/admin/EmpAccMngExcelUp", method =
	 * RequestMethod.POST) public String excelUpload(@RequestParam("file")
	 * MultipartFile file, Model model) throws java.io.IOException {
	 * 
	 * List<EmpAccMngExcelVo> excelList = eduAccMngService.EmpAccMngExcelUp(file);
	 * model.addAttribute("excelList", excelList); // 5
	 * 
	 * return "/admin/pop/excelResultPop";
	 * 
	 * }
	 */
}
