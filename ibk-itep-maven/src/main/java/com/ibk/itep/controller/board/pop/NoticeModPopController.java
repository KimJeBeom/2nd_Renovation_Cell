package com.ibk.itep.controller.board.pop;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.service.board.NoticeService;
import com.ibk.itep.vo.board.NoticeVo;

/* 게시판>공지사항>상세조회팝업 */
@Controller
public class NoticeModPopController{
	
	@Autowired private NoticeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeModPopController.class);

	@RequestMapping(value = "/views/board/pop/noticeModPop", method = RequestMethod.GET)
	public String NoticeModPop(NoticeVo vo, Model model, @RequestParam(value="modType", required = false) String modType) {
	//화면에서  Vo + 수정모드(update/delete)를 파라미터로 받아온다.
	//수정모드(modType)은 String으로 받으며 필수값이 아님 
	//modType이 있을경우 = 상세정보 호출 / 없을경우(update/delete)후 변경화면 호출
		
		logger.info("NoticeModContoll Start");
		logger.info("--- @RequestParam : " + vo.getPbnsId());
		logger.info("--- @RequestParam : " + modType);
		
		if(modType!=null) {// modType = update or insert
			
			//화면에서 입력 받은 정보(Vo) 및 변경정보를 Service로 던져 boolean(성공/실패)로 받아옴
			boolean modRst = service.modAction(vo,modType);
			
			logger.info("Service Retrn OK");
			logger.info("---Return modRst : "+modRst);
		}
		
		//상세정보 확인을 위한 결과값 Vo로 받음
		NoticeVo outVo = service.getDetail(vo);
		
		logger.info("Service Retrn OK");
		logger.info("---Return getPbnsId : "+outVo.getPbnsId());
		
		//결과값을 화면으로 전달(modtype을 같이 전달하여 삭제완료-> 창종료 / 변경완료 -> 변경후 정보 재조회
		model.addAttribute("vo",outVo);
		model.addAttribute("modType", modType);
		
		logger.info("NoticeModContoll End");
		
		return "/board/pop/noticeModPop";
	}

}