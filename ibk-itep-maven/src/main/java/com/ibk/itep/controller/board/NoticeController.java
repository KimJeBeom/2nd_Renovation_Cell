package com.ibk.itep.controller.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.service.board.NoticeService;
import com.ibk.itep.vo.board.NoticeVo;

@Controller
public class NoticeController{
	
	@Autowired private NoticeService service;

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@RequestMapping(value = "/views/board/notice", method = RequestMethod.GET)
//	public String Notice(@RequestParam(value="ttl",required=false) String ttl, Model model) {
	public String Notice(NoticeVo vo, Model model) {
			
//		System.out.println("TTL : "+ vo.getTtl());
//		System.out.println("@ReauestParam : " + ttl);
		System.out.println("@ReauestParam : " + vo.getTtl());
						
		List<NoticeVo> list = service.getList(vo);
		System.out.println("Service 잘 받았어!!!!"+list.size());
		
		
		model.addAttribute("list", list);
		
		return "/board/notice";
	}

}
