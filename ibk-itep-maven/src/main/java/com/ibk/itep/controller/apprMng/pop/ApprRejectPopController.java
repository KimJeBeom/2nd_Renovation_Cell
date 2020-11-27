package com.ibk.itep.controller.apprMng.pop;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.ApprMngService;
import com.ibk.itep.vo.SessionVo;

@Controller
public class ApprRejectPopController{
	
	@Autowired
	private ApprMngService apprMngService;
	
	@RequestMapping(value = "/views/apprMng/pop/apprRejectPop", method = RequestMethod.GET)
	public String apprRejectPop(Locale locale, Model model) {
		
		return "/apprMng/pop/apprRejectPop";
	}

	/* 결재 반려처리 */
	@RequestMapping(value = "/views/apprMng/apprRej", method = RequestMethod.POST)
	public @ResponseBody int apprRej(@RequestParam(value="aplcIdArr[]") List<Integer> aplcIdArr
										, @RequestParam("rtreCon") String rtreCon
										, HttpServletRequest request) {
		
		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		return apprMngService.updateApprRej(aplcIdArr, rtreCon, ssnInfo);
	}
}
