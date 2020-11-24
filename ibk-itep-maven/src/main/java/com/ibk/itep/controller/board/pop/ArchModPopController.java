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

import com.ibk.itep.service.board.ArchieveService;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.board.ArchieveVo;
import com.ibk.itep.vo.cmm.CldVo;

/*게시판>자료실>상세조회팝업*/
@Controller
public class ArchModPopController{
	
	@Autowired private ArchieveService service;
	@Autowired private CmmService cmmService;
	
	private static final Logger logger = LoggerFactory.getLogger(ArchModPopController.class);
	
	@RequestMapping(value = "/views/board/pop/archModPop", method = RequestMethod.POST)
	public @ResponseBody boolean ArchModPopPost(ArchieveVo vo, Model model, HttpServletRequest request,
			@RequestParam(value="modType", required = false) String modType) {
	//화면에서  Vo + 수정모드(insert)를 파라미터로 받아온다.
	//수정모드(modType)은 String으로 받으며 필수값이 아님 
	//modType이 있을경우 = 빈화면 호출 / 없을경우 창종료
		
		logger.info("ArchModPopPost Start");
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		boolean modRst = false;
		if(modType!=null) {//modType = insert
			logger.info("ArchModPopPost job Start");
			logger.info("--- @RequestParam : " + modType);
			
			//화면에서 입력 받은 정보(Vo) 및 변경정보를 Service로 던져 boolean(성공/실패)로 받아옴
			modRst = service.modAction(vo,modType,ssnInfo);
			model.addAttribute("modRst",modRst);
			
			logger.info("ArchModPopPost job End" + modRst);
		}
		
		logger.info("ArchModPopPost End");
		
		//insert는 상세조회 기능 필요 없음으로 인한 별도 재조회 없이 화면을 호출하여 창종료 시킴
		return modRst;
	}

	@RequestMapping(value = "/views/board/pop/archModPop", method = RequestMethod.GET)
	public String ArchModPopGet(ArchieveVo vo, CldVo dVo, Model model, @RequestParam(value="modType", required = false) String modType) {
	//화면에서  Vo + 수정모드(update/delete)를 파라미터로 받아온다.
	//수정모드(modType)은 String으로 받으며 필수값이 아님 
	//modType이 있을경우 = 상세정보 호출 / 없을경우(update/delete)후 변경화면 호출
		
		logger.info("ArchModPopGet Start");
		logger.info("--- @RequestParam : " + vo.getRflbId());
		logger.info("--- @RequestParam : " + modType);
				
		//교육구분코드 선택을 위한 select박스 구성 List
		dVo.setUseYn("Y");
		List<CldVo> edctClsfCdList = cmmService.selectCld(dVo);	
		model.addAttribute("edctClsfCdList",edctClsfCdList);
		
		//상세정보 확인을 위한 결과값 Vo로 받음
		ArchieveVo outVo = service.getDetail(vo);
		
		logger.info("Service Retrn OK");
		logger.info("---Return getRflbId : "+outVo.getRflbId());
		
		//결과값을 화면으로 전달(modtype을 같이 전달하여 삭제완료-> 창종료 / 변경완료 -> 변경후 정보 재조회
		model.addAttribute("vo",outVo);
		model.addAttribute("modType", modType);
		
		logger.info("ArchModPopGet End");
		
		return "/board/pop/archModPop";
	}

}