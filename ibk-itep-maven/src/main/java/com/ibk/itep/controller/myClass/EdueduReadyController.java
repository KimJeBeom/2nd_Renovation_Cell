package com.ibk.itep.controller.myClass;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduReadyVO;

@Controller
public class EdueduReadyController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired private MyClassService myClassService;
	@Autowired FileUtil fileUtil;

	/* 수강 신청한 교육 */
	@RequestMapping(value = "/views/myClass/eduReady", method = RequestMethod.GET)
	public String eduReady(HttpServletRequest request,Model model) {

		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");

		// 과정개설 신청목록
		List<EduNewReadyVO> eduNewList = myClassService.getNewList(ssnInfo);
		// 수강신청 목록
		List<EduReadyVO> eduReadyList = myClassService.getReadyList(ssnInfo);

		model.addAttribute("eduNewList", eduNewList);
		model.addAttribute("eduReadyList", eduReadyList);

		return "/myClass/eduReady";
	}
	
	  /*수강신청 목록 - 취소요청처리*/
	  @RequestMapping(value = "/views/myClass/eduReady/cancel", method = RequestMethod.POST)
	  public @ResponseBody List<EduReadyVO> eduReadyList(HttpServletRequest request, @RequestParam("edctAplcId") int edctAplcId, Model model) {
	  
		 myClassService.updateEduReady(edctAplcId);
		  
			/* 세션정보를 담은 SessionVo 가져옴 */
			HttpSession session = request.getSession();
			SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
			
		 List<EduReadyVO> eduReadyList = myClassService.getReadyList(ssnInfo);
	   
	   return eduReadyList;
	 
	 }
	 
		/*수강신청 목록 - 반려건 재결재요청*/
		@RequestMapping(value = "/views/myClass/eduInfoPop/reApply", method = RequestMethod.POST)
		public @ResponseBody int reApply(@RequestParam("code_nm") String code_nm,  @RequestParam("pbns_id") String pbns_id,
										 @RequestParam("fileNoArray[]") int[] fileNoDel, @RequestParam("addFileCnt") String addFileCnt, 
										 MultipartHttpServletRequest mpRequest, HttpServletRequest request, Model model, EduInfoPopVO infoVo) {
			
			/* 세션정보를 담은 SessionVo 가져옴 */
			HttpSession session = request.getSession();
			SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
			
			//첨부파일 업로드
			logger.info("FILE Upload Start");
			logger.info("addFileCnt : " + addFileCnt + "  fileNoDel : " + fileNoDel.length);
			
			if(Integer.parseInt(addFileCnt) > 0 || fileNoDel.length > 0) {
			logger.info("addFileCnt : " + addFileCnt + "  fileNoDel : " + fileNoDel.length);	
			int id;
			id = Integer.parseInt(pbns_id);
			fileUtil.fileUpdate(fileNoDel,code_nm,id,mpRequest);
			
			logger.info("FILE Upload End");

	   }else {
		   logger.info("업데이트파일이 없네요! addFileCnt : " + addFileCnt + "  fileNoDel : " + fileNoDel.length);
	   }
			
			return myClassService.updateEduInfoPop(infoVo, ssnInfo);
	}
	

}


	 
