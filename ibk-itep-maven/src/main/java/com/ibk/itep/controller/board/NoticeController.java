package com.ibk.itep.controller.board;

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

import com.ibk.itep.service.board.NoticeService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.board.NoticeVo;

/* 게시판>공지사항 */
@Controller
public class NoticeController{
	
	@Autowired private NoticeService service;

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/views/board/notice", method = RequestMethod.POST)
	public @ResponseBody List<NoticeVo> NoticePost(NoticeVo vo, Model model, HttpServletRequest request
			,@RequestParam("pageNum") String pageNum) { //화면에서 받아온 파라미터를 Vo에 저장
		logger.info("NoticePost Start");
		logger.info("@@@ReauestParam (Title): " + vo.getTtl());
		
		logger.info(" --- pageNum" + pageNum);		
		int pageSet = (Integer.parseInt(pageNum)-1)*10;
		vo.setPageSet(pageSet);
		//List형태로 Vo값을 Return받아옴(Input Vo -> OutPut List)
		List<NoticeVo> list = service.getList(vo);
		
		logger.info("Service Retrn OK");
		logger.info("-- List line : "+list.size());

		logger.info("NoticePost End");
		
		return list;
	}
	
	@RequestMapping(value = "/views/board/notice", method = RequestMethod.GET)
	public String NoticeGet(NoticeVo vo, Model model, HttpServletRequest request) { //화면에서 받아온 파라미터를 Vo에 저장
		logger.info("NoticeGet Start");
		logger.info("@@@ReauestParam (Title): " + vo.getTtl());
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		String athrCd = ssnInfo.getAthrCd();
		
		//List형태로 Vo값을 Return받아옴(Input Vo -> OutPut List)
		List<NoticeVo> listCnt = service.getList(vo);
		int listSize= listCnt.size()/10;
		listSize = (int) Math.ceil(listSize);
		logger.info("-- listCnt line : "+listCnt.size());
		
		vo.setPageSet(0);
		//List형태로 Vo값을 Return받아옴(Input Vo -> OutPut List)
		List<NoticeVo> list = service.getList(vo);
		logger.info("Service Retrn OK");
		
		//model을 통한 결과값 화면(notice.jsp)에 전달
		model.addAttribute("list", list);
		//사용자권한 전달
		model.addAttribute("athrCd", athrCd);
		model.addAttribute("listSize",listSize);
		
		logger.info("NoticeGet End");
		
		return "/board/notice";
	}

}
