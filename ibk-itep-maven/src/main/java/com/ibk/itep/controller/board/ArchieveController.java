package com.ibk.itep.controller.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.service.board.ArchieveService;
import com.ibk.itep.vo.board.ArchieveVo;

/*게시판>자료실*/
@Controller
public class ArchieveController{
	
	@Autowired private ArchieveService service;

	private static final Logger logger = LoggerFactory.getLogger(ArchieveController.class);
	
	@RequestMapping(value = "/views/board/archieve", method = RequestMethod.GET)
	
	public String Archieve(ArchieveVo vo, Model model) { //화면에서 받아온 파라미터를 Vo에 저장
		logger.info("ArchieveControll Start");
		logger.info("@@@ReauestParam (Title): " + vo.getTtl());
		
		//List형태로 Vo값을 Return받아옴(Input Vo -> OutPut List)
		List<ArchieveVo> list = service.getList(vo);
		
		logger.info("Service Retrn OK");
		logger.info("-- List line : "+list.size());
		
		//model을 통한 결과값 화면(archieve.jsp)에 전달
		model.addAttribute("list", list);
		
		logger.info("ArchieveControll End");
		
		return "/board/archieve";
	}

}
