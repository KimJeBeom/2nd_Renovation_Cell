package com.ibk.itep.controller.myClass;

import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
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
import com.ibk.itep.common.file.FileVo;
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
		 
		  int result = myClassService.updateEduReady(edctAplcId);
		  
			/* 세션정보를 담은 SessionVo 가져옴 */
			HttpSession session = request.getSession();
			SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
			
			logger.info("취소 업데이트 cnt" + result);
		 List<EduReadyVO> eduReadyList = myClassService.getReadyList(ssnInfo);
		 return eduReadyList;
	 }
	 
		/*수강신청 목록 - 반려건 재결재요청*/
		@RequestMapping(value = "/views/myClass/eduInfoPop/reApply", method = RequestMethod.POST)
		public @ResponseBody int reApply(@RequestParam("code_nm") String code_nm,  @RequestParam("pbns_id") String pbns_id,
										 @RequestParam("fileNoArray[]") int[] fileNoDel, MultipartHttpServletRequest mpRequest,
										 HttpServletRequest request, Model model, EduInfoPopVO infoVo) {
			
			/* 세션정보를 담은 SessionVo 가져옴 */
			HttpSession session = request.getSession();
			SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
			
			//첨부파일 업로드
			logger.info("FILE Upload Start");
			
			Iterator<String> iterator = mpRequest.getFileNames();
			
			List<FileVo> fileVoList = fileUtil.selectFileList("EDA", infoVo.getEdctAplcId());
			logger.info("fileNoDel : "+ fileNoDel.length + " fileVoList : " + fileVoList.size() + " 결과 : " + (fileNoDel.length - fileVoList.size()));
			int cnt = fileNoDel.length - fileVoList.size();
				
			//첨부된 파일이 없을 경우 리턴
			if(iterator.hasNext() == false && cnt == 0) {
				logger.info("iterator.hasNext():" + iterator.hasNext() );
				logger.info("cnt :" + cnt);
				logger.info("파일이 없습니다.");
					return 0;
			}else {

				logger.info("정상 업로드");
				
				int id;
				id = Integer.parseInt(pbns_id);
				fileUtil.fileUpdate(fileNoDel,code_nm,id,mpRequest);
				
				logger.info("FILE Upload End");
				
				return myClassService.updateEduInfoPop(infoVo, ssnInfo);
			}
	}

}

	




	 
