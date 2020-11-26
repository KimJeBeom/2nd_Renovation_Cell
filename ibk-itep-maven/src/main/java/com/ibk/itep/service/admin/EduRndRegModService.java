package com.ibk.itep.service.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EduRndRegModVo;

@Service
public class EduRndRegModService {
	
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private CmmService cmmService;
	
	private static final Logger logger = LoggerFactory.getLogger(EduRndRegModService.class);
	
	public List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo vo){
		logger.debug("selectEduRndRegMod Service 진입 edct id : {} / edct Cnt Id : {}", vo.getEdctId(), vo.getEdctCntId());
		List<EduRndRegModVo> errmVoList = null; 		
		if(vo.getEdctId() != null || vo.getEdctCntId() != null) {
			logger.debug("selectEduRndRegMod Service 리턴1직전");
			errmVoList = adminDao.selectEduRndRegMod(vo);
			errmVoList = listSecondsParser(errmVoList);
			errmVoList = listReplaceToSlash(errmVoList);
			return errmVoList;
		
		}else {
			return null;
		}
	}
	public boolean insertEduRndRegMod(EduRndRegModVo vo) {
		logger.debug("서비스 Start : insertEduRndRegMod");
		cmmService.objFieldTest(vo);
		boolean result = adminDao.insertEduRndRegMod(vo);
		logger.debug("서비스 End : insertEduRndRegMod");
		return result;		
	}
	public boolean updateEduRndRegMod(EduRndRegModVo vo) {
		logger.debug("서비스 Start : updateEduRndRegMod");
		cmmService.objFieldTest(vo);
		boolean result = adminDao.updateEduRndRegMod(vo);
		logger.debug("서비스 End : updateEduRndRegMod");
		return result;		
	}
	
	public List<EduRndRegModVo> listSecondsParser(List<EduRndRegModVo> list){
		for(EduRndRegModVo vo: list) {
			vo.setEdctSttgTim(secondsParser(vo.getEdctSttgTim()));
			vo.setEdctFnshTim(secondsParser(vo.getEdctFnshTim()));
		}
		return list;
	}
	public List<EduRndRegModVo> listReplaceToSlash(List<EduRndRegModVo> list){
		for(EduRndRegModVo vo: list) {
			vo.setAplcSttgYmd(replaceToSlash(vo.getAplcSttgYmd()));
			vo.setAplcFnshYmd(replaceToSlash(vo.getAplcFnshYmd()));
			vo.setCnclSttgYmd(replaceToSlash(vo.getCnclSttgYmd()));
			vo.setCnclFnshYmd(replaceToSlash(vo.getCnclFnshYmd()));
			vo.setEdctSttgYmd(replaceToSlash(vo.getEdctSttgYmd()));
			vo.setEdctFnshYmd(replaceToSlash(vo.getEdctFnshYmd()));			
		}
		return list;
	}
	public String secondsParser(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Date date = null;
		try {
			date = sdf.parse(time);
			time = sdf.format(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return time;
	}
	public String replaceToSlash(String ymd) {
		SimpleDateFormat asIsSdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat toBeSdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = null;
		//logger.debug("1 함수 진입 직후 ymd {}, date {}", ymd, date);
		try {
			date = asIsSdf.parse(ymd);
			//logger.debug("2 date형 변경 이후 ymd {}, date {}", ymd, date);
			ymd = toBeSdf.format(date);
			//logger.debug("3 String형 변경 이후 ymd {}, date {}", ymd, date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ymd;
	}
}
