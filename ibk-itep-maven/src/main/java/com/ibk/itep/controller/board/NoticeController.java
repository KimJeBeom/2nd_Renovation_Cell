package com.ibk.itep.controller.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibk.itep.service.board.NoticeService;
import com.ibk.itep.vo.board.NoticeVo;


@Controller
public class NoticeController{
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@RequestMapping(value = "/views/board/notice", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @ModelAttribute NoticeVo vo) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
				
		System.out.println("TTL : "+ vo.getTtl());
						
		NoticeService service = new NoticeService();
		List<NoticeVo> list = service.getList(vo);
		
		model.addAttribute("list", list);
		
		return "/board/notice";
	}

}
