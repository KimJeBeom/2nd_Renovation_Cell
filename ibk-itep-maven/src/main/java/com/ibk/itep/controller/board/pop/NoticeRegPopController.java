package com.ibk.itep.controller.board.pop;

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

/* 게시판>공지사항>등록팝업 */
@Controller
public class NoticeRegPopController{
	
	@Autowired private NoticeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeRegPopController.class);

	@RequestMapping(value = "/views/board/pop/noticeRegPop", method = RequestMethod.GET)
	public String NoticeRegPop(NoticeVo vo, Model model, @RequestParam(value="modType", required = false) String modType) {
	//화면에서  Vo + 수정모드(insert)를 파라미터로 받아온다.
	//수정모드(modType)은 String으로 받으며 필수값이 아님 
	//modType이 있을경우 = 빈화면 호출 / 없을경우 창종료
		
		logger.info("NoticeRegContoll Start");
		
		if(modType!=null) {//modType = insert
			logger.info("NoticeRegControll Insert Start");
			logger.info("--- @RequestParam : " + vo.getPbnsId());
			logger.info("--- @RequestParam : " + modType);
			
			//화면에서 입력 받은 정보(Vo) 및 변경정보를 Service로 던져 boolean(성공/실패)로 받아옴
			boolean modRst = service.modAction(vo,modType);
			model.addAttribute("modRst",modRst);
			
			logger.info("NoticeRegContoll Insert End");
		}
		
		logger.info("NoticeRegContoll End");
		
		//insert는 상세조회 기능 필요 없음으로 인한 별도 재조회 없이 화면을 호출하여 창종료 시킴
		return "/board/pop/noticeRegPop";
	}

}
