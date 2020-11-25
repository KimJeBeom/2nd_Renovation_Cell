package com.ibk.itep.controller.admin.pop;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.admin.EduReadyStatService;
import com.ibk.itep.vo.admin.EduEmpListVo;

@Controller
public class EduEmpListPopController{
	
	@Autowired
	private EduReadyStatService eduReadyStatService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/* 교육신청직원목록 */
	@RequestMapping(value = "/views/admin/pop/eduEmpListPop", method = RequestMethod.GET)
	public String eduEmpListPop(Model model	, @RequestParam(value="edctCntId", required=false) String edctCntId) {

		List<EduEmpListVo> eduEmpList = eduReadyStatService.selectEduEmpListPop(Integer.parseInt(edctCntId));

		model.addAttribute("eduEmpList", eduEmpList );		
		return "/admin/pop/eduEmpListPop";
	}
	
	/* 교육신청직원목록 > 차수완료, 수료처리 */
	@RequestMapping(value = "/views/admin/pop/eduEmpListPopFinEduCnt", method = RequestMethod.POST)
	public @ResponseBody int eduEmpListPopFinEduCnt(Model model
							, @RequestBody Map<String, String> map) {

		eduReadyStatService.updateEduEmpListPop(map);
		return 1;
	}


}
