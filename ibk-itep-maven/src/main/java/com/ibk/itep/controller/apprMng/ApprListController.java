package com.ibk.itep.controller.apprMng;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.common.file.FileVo;
import com.ibk.itep.service.ApprMngService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprListDetailVo;
import com.ibk.itep.vo.apprMng.ApprListVo;

@Controller
public class ApprListController{
	
	private static final Logger logger = LoggerFactory.getLogger(ApprListController.class);
	
	@Autowired
	private ApprMngService apprMngService;
	@Autowired
	private CmmService cmmService;
	@Autowired 
	private FileUtil fileUtil;

	/* 결재 목록, 첫번째 결재건의 상세내용 조회 */
	@RequestMapping(value = "/views/apprMng/apprList", method = RequestMethod.GET)
	public String apprList(HttpServletRequest request, Model model) {

		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		/* 결재목록 조회 */
		List<ApprListVo> apprList = apprMngService.selectApprList(ssnInfo);
		ApprListDetailVo apprDetail = null; // 상세 내용을 담기위한 객체
		List<FileVo> fileVoList = null;
		
		/* 결재 대상이 하나라도 있으면 첫번째 결재건에 대한 상세내용 조회 */
		if (apprList != null) {
			if (!apprList.isEmpty()) {
				int edctAplcId = apprList.get(0).getEdctAplcId(); // 첫번째 결재건의 신청ID
				apprDetail = apprMngService.selectApprListDetail(edctAplcId); // 상세내용 조회
				fileVoList = fileUtil.selectFileList("EDA", edctAplcId); // 첨부파일
			}
		}
		model.addAttribute("apprList", apprList);
		model.addAttribute("apprDetail", apprDetail);
		model.addAttribute("fileVoList", fileVoList);
		
		return "/apprMng/apprList";
	}

	/* 교육신청ID에 따른 상세내용 조회 */
	@RequestMapping(value = "/views/apprMng/apprListDetail", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> apprListDetail(@RequestParam("edctAplcId") String edctAplcId) {
		ApprListDetailVo apprListDetail = apprMngService.selectApprListDetail(Integer.parseInt(edctAplcId));
		List<FileVo> fileVoList = fileUtil.selectFileList("EDA", Integer.parseInt(edctAplcId));
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		result.put("apprListDetail", apprListDetail);
		result.put("fileVoList", fileVoList);
		
		return result;
	}
	
	/* 결재 승인처리 */
	@RequestMapping(value = "/views/apprMng/apprConf", method = RequestMethod.POST)
	public @ResponseBody int apprConf(HttpServletRequest request, @RequestParam(value="aplcIdArr[]") List<Integer> aplcIdArr) {
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		return apprMngService.updateApprConf(aplcIdArr, ssnInfo);
	}
	
	/* 결재 목록, 첫번째 결재건의 상세내용 조회 */
	@RequestMapping(value = "/apprListCnt", method = RequestMethod.GET)
	public void apprListCnt(@RequestParam(required=true) String userId, HttpServletRequest request,HttpServletResponse response) throws Exception {

		SessionVo ssnInfo = new SessionVo();
		String athrCd = cmmService.selectDpm(userId);
		ssnInfo.setUserId(userId);
		ssnInfo.setAthrCd(athrCd);
		
		logger.info("아이디  " + userId);
		logger.info("권한  " + athrCd);
		
		/* 결재목록 조회 */
		if(athrCd.equals("USR")) {
			String cnt = "callbackFunction" + "({\"ReturnValue\":\"Cnt_IEP#" + 0 +"\"});";
			PrintWriter out = response.getWriter();
			out.print(cnt);
		}else {
			List<ApprListVo> apprList = apprMngService.selectApprList(ssnInfo);
			String cnt = "callbackFunction" + "({\"ReturnValue\":\"Cnt_IEP#" + apprList.size()+"\"});";
			PrintWriter out = response.getWriter();
			out.print(cnt);
		}
	}
}








