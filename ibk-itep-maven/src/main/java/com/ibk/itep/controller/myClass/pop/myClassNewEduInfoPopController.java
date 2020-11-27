package com.ibk.itep.controller.myClass.pop;

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

import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.common.file.FileVo;
import com.ibk.itep.controller.HomeController;
import com.ibk.itep.service.MyClassService;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.NewEduInfoPopVO;

@Controller
public class myClassNewEduInfoPopController{
	
	@Autowired
	private MyClassService myClassService;
	@Autowired FileUtil fileUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//상세확인 팝업 신청내용 조회
	@RequestMapping(value = "/views/myClass/pop/newEduInfoPop", method = RequestMethod.GET)
	public  String NewEduInfo(@RequestParam(value = "aplcId") int aplcId, Model model) {
		NewEduInfoPopVO newEduInfoPop = myClassService.getNewEduInfoPop(aplcId);
		
		model.addAttribute("newEduInfoPop", newEduInfoPop);
	
	//첨부파일 리스트 조회
	List<FileVo> fileVoList = fileUtil.selectFileList("EDO", aplcId);
	if(!fileVoList.isEmpty()) {
		logger.debug(fileVoList.get(0).getOrg_file_name());
		logger.debug(fileVoList.get(0).getFile_size().toString());
		model.addAttribute("fileVoList",fileVoList);
	}
		
		return "/myClass/pop/newEduInfoPop";

	
} 

}
