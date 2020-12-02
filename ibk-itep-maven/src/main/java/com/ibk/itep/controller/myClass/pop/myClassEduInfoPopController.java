package com.ibk.itep.controller.myClass.pop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ibk.itep.common.file.FileDao;
import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.common.file.FileVo;
import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.ApprMngService;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprStatDetailVo;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.myClass.EduInfoPopVO;

@Controller
public class myClassEduInfoPopController{
	
	@Autowired
	private MyClassService myClassService;
	@Autowired
	private CmmService CmService;
	@Autowired
	private ApprMngService apprMngService;
	@Autowired FileUtil fileUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*교육 신청내용 상세조회*/
	@RequestMapping(value = "/views/myClass/pop/eduInfoPop", method = RequestMethod.GET)
	public String EduInfo(@RequestParam(value = "edctAplcId") int edctAplcId, 
						  @RequestParam(value = "modType") String modType, HttpServletRequest request, Model model) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		//교육내용 상세조회
		EduInfoPopVO eduInfoPop = myClassService.getEduInfoPop(edctAplcId);
		model.addAttribute("eduInfoPop", eduInfoPop);
		
		//부서결재자 조회
		List<CluVo> dpmList = CmService.selectDpm(ssnInfo);
		model.addAttribute("dpmList", dpmList);
		
		//수강신청이력 내 상세확인 시 재결재요청 불가
		model.addAttribute("modType",modType);
		
		//첨부파일 리스트 조회
		List<FileVo> fileVoList = fileUtil.selectFileList("EDA", edctAplcId);
		if(!fileVoList.isEmpty()) {
			logger.debug(fileVoList.get(0).getOrg_file_name());
			logger.debug(fileVoList.get(0).getFile_size().toString());
			model.addAttribute("fileVoList",fileVoList);
		}
		
		//결재정보 조회
		ApprStatDetailVo apprDetail = apprMngService.selectApprStatDetail(edctAplcId);
		model.addAttribute("apprDetail",apprDetail);

		return "/myClass/pop/eduInfoPop";

	}

}