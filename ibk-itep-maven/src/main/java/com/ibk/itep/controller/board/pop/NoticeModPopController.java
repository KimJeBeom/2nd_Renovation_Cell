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

import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.board.NoticeService;
import com.ibk.itep.vo.board.NoticeVo;

@Controller
public class NoticeModPopController{
	
	@Autowired private NoticeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeModPopController.class);

	@RequestMapping(value = "/views/board/pop/noticeModPop", method = RequestMethod.GET)
	public String NoticeModPop(NoticeVo vo, Model model, @RequestParam(value="modType", required = false) String modType) {
		
		System.out.println("@ReauestParam : " + vo.getPbnsId());
		
		String rstMsg ="";
		if(modType!=null || !modType.equals("")) {
			boolean modRst = service.modAction(vo,modType);
			if(modRst==true){
				rstMsg = "변경되었습니다!";
			}else {
				rstMsg = "변경 실패!";
			}
		}
		
		NoticeVo outVo = service.getDetail(vo);
		System.out.println("Service 잘 받았어!!!! getTtl : "+outVo.getTtl());
		
		model.addAttribute("vo",outVo);
		model.addAttribute("rstMsg", rstMsg);
		
		/*
		 * model.addAttribute("pbnsId", outVo.getPbnsId());
		 * model.addAttribute("edctClsfCd", outVo.getEdctClsfCd());
		 * model.addAttribute("edctClsfNm", outVo.getEdctClsfNm());
		 * model.addAttribute("ttl", outVo.getTtl()); 
		 * model.addAttribute("con",outVo.getCon()); 
		 * model.addAttribute("rgsnTs", outVo.getRgsnTs());
		 * model.addAttribute("userId", outVo.getUserId()); 
		 * model.addAttribute("userNm",outVo.getUserNm());
		 * model.addAttribute("apndDat", outVo.getApndDat());
		 */
		
		return "/board/pop/noticeModPop";
	}

}