package com.ibk.itep.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibk.itep.controller.admin.EduCdMngController;
import com.ibk.itep.repository.CmmDao;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;

@Service
public class EduCdMngService {
	
	@Autowired
	private CmmDao cmmDao;
	
	private static final Logger logger = LoggerFactory.getLogger(EduCdMngService.class);

	
	/* 코드 내용 수정 */
	public void updateCmm(String[] cldData, String[] cliData){		
		
		// 교육분류 데이터 List<CldVo> 에 담기
		List<CldVo> cldList = new ArrayList<CldVo>();
		for(int i=1; i<cldData.length; i+=3) {
			CldVo cldVo = new CldVo();
			cldVo.setEdctClsfCd(cldData[i]);
			cldVo.setEdctClsfNm(cldData[i+1]);
			cldVo.setUseYn(cldData[i+2]);
			cldList.add(cldVo);
		}
		
		// 교육기관 데이터 List<CldVo> 에 담기
		List<CliVo> cliList = new ArrayList<CliVo>();
		for(int i=1; i<cliData.length; i+=3) {
			CliVo cliVo = new CliVo();
			cliVo.setEdinCd(cliData[i]);
			cliVo.setEdinNm(cliData[i+1]);
			cliVo.setUseYn(cliData[i+2]);
			cliList.add(cliVo);
		}
		
		// 교육분류, 교육기관 update
		cmmDao.updateCld(cldList);
		cmmDao.updateCli(cliList);
	}
	
	public int insertCmm(String eduCdType, String cd, String nm) {
		if(eduCdType.equals("CLD")) {
			CldVo cldVo = new CldVo();
			cldVo.setEdctClsfCd(cd);
			cldVo.setEdctClsfNm(nm);
			if(cmmDao.selectCld(cldVo).isEmpty()) {
				cmmDao.insertCld(cldVo);
				return 1;
			} else 
				return -1;
		} else if(eduCdType.equals("CLI")) {
			CliVo cliVo = new CliVo();
			cliVo.setEdinCd(cd);
			cliVo.setEdinNm(nm);
			if(cmmDao.selectCli(cliVo).isEmpty()) {
				cmmDao.insertCli(cliVo);
				return 1;
			} else
				return -1;
		}
		return 0;
	}
}

