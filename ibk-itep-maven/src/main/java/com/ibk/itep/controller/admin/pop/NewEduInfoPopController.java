package com.ibk.itep.controller.admin.pop;

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

import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.common.file.FileVo;
import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.admin.EduReadyStatService;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.NewEduInfoVo;

@Controller
public class NewEduInfoPopController{
		
	@Autowired
	private EduReadyStatService eduReadyStatService;
	
	@Autowired 
	private FileUtil fileUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/* 과정개설신청현황 팝업 */
	@RequestMapping(value = "/views/admin/pop/newEduInfoPop", method = RequestMethod.GET)
	public String newEduInfoPop(Model model, @RequestParam(value="aplcId", required=false) String aplcId) {

		NewEduInfoVo edoVo = eduReadyStatService.selectNewEduInfoPop(Integer.parseInt(aplcId));
		List<FileVo> fileVoList = fileUtil.selectFileList("EDO", Integer.parseInt(aplcId));

		model.addAttribute("edoVo", edoVo );	
		model.addAttribute("fileVoList", fileVoList);	
		return "/admin/pop/newEduInfoPop";
	}
	
	/* 과정개설신청 확인처리 */
	@RequestMapping(value = "/views/admin/pop/newEduInfoPopUpdateCnfa", method = RequestMethod.POST)
	public @ResponseBody int newEduInfoPopDoCnfa(HttpServletRequest request, Model model
												, @RequestParam(value="aplcId", required=false) String aplcId) {

		/* 세션정보를 담은 SessionVo 가져옴 */
		HttpSession session = request.getSession();
		SessionVo ssnInfo = (SessionVo)session.getAttribute("ssnInfo");
		
		eduReadyStatService.updateNewEduInfoPop(Integer.parseInt(aplcId), ssnInfo);
		return 1;
	}

}
