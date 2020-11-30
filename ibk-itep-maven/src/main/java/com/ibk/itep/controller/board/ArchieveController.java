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

import com.ibk.itep.service.board.ArchieveService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.board.ArchieveVo;

/*게시판>자료실*/
@Controller
public class ArchieveController{
	
	@Autowired private ArchieveService service;

	private static final Logger logger = LoggerFactory.getLogger(ArchieveController.class);
	
	@RequestMapping(value = "/views/board/archieve", method = RequestMethod.POST)
	public @ResponseBody List<ArchieveVo> ArchievePost(ArchieveVo vo, Model model, HttpServletRequest request
			,@RequestParam("pageNum") String pageNum
			) { //화면에서 받아온 파라미터를 Vo에 저장
		logger.info("ArchievePost Start");
		logger.info("@@@ReauestParam (Title): " + vo.getTtl());
		
		//전달받은 페이지 계산
		logger.info(" --- pageNum" + pageNum);		
		int pageSet = (Integer.parseInt(pageNum)-1)*10;
		vo.setPageSet(pageSet); //List로 받아올 페이지 Set
		
		//페이지 리스트 출력
		List<ArchieveVo> list = service.getList(vo);
		logger.info("Service Retrn OK");
		logger.info("-- List line : "+list.size());
			
		logger.info("ArchievePost End");
		
		return list;
	}
	
	@RequestMapping(value = "/views/board/archieve", method = RequestMethod.GET)
	public String ArchieveGet(ArchieveVo vo, Model model, HttpServletRequest request) { //화면에서 받아온 파라미터를 Vo에 저장
		logger.info("ArchieveGet Start");
		logger.info("@@@ReauestParam (Title): " + vo.getTtl());
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		String athrCd = ssnInfo.getAthrCd();
		
		//전체 ListCount확인(총 페이지수 계산)
		double listCnt = service.getList(vo).size();
		double listcntD1 = listCnt/10;
		double listcntD2 = Math.ceil(listcntD1);
		int listSize = (int) listcntD2;
		logger.info("-- listCnt line : "+listCnt);

		//1페이지 리스트 출력
		vo.setPageSet(0); //1페이지(0~10)
		List<ArchieveVo> list = service.getList(vo);
		logger.info("Service Retrn OK");
		
		//model을 통한 결과값 화면(notice.jsp)에 전달
		model.addAttribute("list", list);  		//리스트
		model.addAttribute("athrCd", athrCd);	//권한
		model.addAttribute("listSize",listSize);//페이지수
		
		logger.info("ArchieveGet End");
		
		return "/board/archieve";
	}

}
