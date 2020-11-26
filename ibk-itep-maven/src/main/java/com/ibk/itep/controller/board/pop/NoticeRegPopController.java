package com.ibk.itep.controller.board.pop;

import java.util.List;

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

import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.service.board.NoticeService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.cmm.CldVo;

/* 게시판>공지사항>등록팝업 */
@Controller
public class NoticeRegPopController {

	@Autowired	private NoticeService service;
	@Autowired	private CmmService cmmService;
	@Autowired	FileUtil fileUtil;

	private static final Logger logger = LoggerFactory.getLogger(NoticeRegPopController.class);

	@RequestMapping(value = "/views/board/pop/noticeRegPop", method = RequestMethod.POST)
	public @ResponseBody boolean NoticeRegPopPost(NoticeVo vo, Model model, HttpServletRequest request
			,@RequestParam(value = "modType", required = false) String modType
			,@RequestParam("code_nm") String code_nm
			,@RequestParam(value = "pbns_id", required = false) String pbns_id
			,@RequestParam("addFileCnt") String addFileCnt
			, MultipartHttpServletRequest mpRequest) {
		// 화면에서 Vo + 수정모드(insert)를 파라미터로 받아온다.
		// 수정모드(modType)은 String으로 받으며 필수값이 아님

		logger.info("NoticeRegPopPost Start");
		boolean modRst = false;
		logger.info("NoticeRegPopPost Go : --"+ modType+"--");

		if (modType != null) {// modType = insert

			/* 세션정보를 담은 SessionVo 가져옴 */
			HttpSession session = request.getSession();
			SessionVo ssnInfo = (SessionVo) session.getAttribute("ssnInfo");

			logger.info("NoticeRegControll Insert Start");
			logger.info("--- @RequestParam : " + modType);

			// 화면에서 입력 받은 정보(Vo) 및 변경정보를 Service로 던져 boolean(성공/실패)로 받아옴
			modRst = service.modAction(vo, modType, ssnInfo);
			model.addAttribute("modRst", modRst);

			logger.info("NoticeRegContoll Insert End" + modRst);

			if(modRst==true && Integer.parseInt(addFileCnt) > 0) {
				//파일 업로드를 위한 공지사항ID를 받아온다.
				logger.info("NoticeRegControll FILE Upload Start");
				//int id = Integer.parseInt(pbns_id); 
				int pId = cmmService.getPrstKey("TB_IEP_BDN001M");	
				int uploadcount = fileUtil.fileUpload(code_nm, pId, mpRequest);
				logger.info("NoticeRegControll FILE Upload End");
				logger.debug(" --- upload file count : " + String.valueOf(uploadcount));
			}else {
				logger.info("EduInfoPopPost FILE Upload Cancle");
				logger.info(" --- modRst : "+ modRst + "/ fileCnt: " + addFileCnt);
			}
			
		}

		logger.info("NoticeRegPopPost End");

		// insert는 상세조회 기능 필요 없음으로 인한 별도 재조회 없이 화면을 호출하여 창종료 시킴
		return modRst;
	}

	@RequestMapping(value = "/views/board/pop/noticeRegPop", method = RequestMethod.GET)
	public String NoticeRegPopGet(NoticeVo vo, CldVo dVo, Model model,
			@RequestParam(value = "modType", required = false) String modType) {
		// 화면에서 Vo + 수정모드(insert)를 파라미터로 받아온다.
		// 수정모드(modType)은 String으로 받으며 필수값이 아님
		// modType이 있을경우 = 빈화면 호출 / 없을경우 창종료

		logger.info("NoticeRegPopGet Start");

		dVo.setUseYn("Y");
		List<CldVo> edctClsfCdList = cmmService.selectCld(dVo);
		model.addAttribute("edctClsfCdList", edctClsfCdList);

		logger.info("NoticeRegPopGet End");

		// insert는 상세조회 기능 필요 없음으로 인한 별도 재조회 없이 화면을 호출하여 창종료 시킴
		return "/board/pop/noticeRegPop";
	}

}
