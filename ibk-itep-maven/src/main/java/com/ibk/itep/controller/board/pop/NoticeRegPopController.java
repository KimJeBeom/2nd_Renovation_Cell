package com.ibk.itep.controller.board.pop;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class NoticeRegPopController{
	
	@Autowired private NoticeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeRegPopController.class);

	@RequestMapping(value = "/views/board/pop/noticeRegPop", method = RequestMethod.GET)
	public String NoticeRegPop(NoticeVo vo, Model model, @RequestParam(value="modType", required = false) String modType) {
		
		if(modType!=null) {
			boolean modRst = service.modAction(vo,modType);
			model.addAttribute("modRst",modRst);
		}
		/*
		 * String nowTs = ""; Date time = new Date(); SimpleDateFormat ymd = new
		 * SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); nowTs = ymd.format(time);
		 * model.addAttribute("nowTs",nowTs);
		 */
		return "/board/pop/noticeRegPop";
	}

}
