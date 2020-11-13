package com.ibk.itep.controller.board.pop;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

@Controller
public class NoticeModPopController{
	
	@Autowired private NoticeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeModPopController.class);

	@RequestMapping(value = "/views/board/pop/noticeModPop", method = RequestMethod.GET)
	public String NoticeModPop(NoticeVo vo, Model model, @RequestParam(value="modType", required = false) String modType) {
		
		System.out.println("@RequestParam : " + vo.getPbnsId());
		System.out.println("@RequestParam : " + modType);
		
		if(modType!=null) {
			boolean modRst = service.modAction(vo,modType);
			System.out.println("modRst : "+modRst);
		}
		
		NoticeVo outVo = service.getDetail(vo);
		System.out.println("Service OK : "+outVo.getTtl());
		
		model.addAttribute("vo",outVo);
		model.addAttribute("modType", modType);
		
		return "/board/pop/noticeModPop";
	}

}