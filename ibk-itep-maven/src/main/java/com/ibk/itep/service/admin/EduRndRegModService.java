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
import com.ibk.itep.vo.admin.EduRndRegModVo;

@Service
public class EduRndRegModService {
	
	@Autowired
	private AdminDao adminDao;
	
	private static final Logger logger = LoggerFactory.getLogger(EduRndRegModService.class);
	
	public List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo vo){
		logger.debug("selectEduRndRegMod Service 진입 edct id : {} / edct Cnt Id : {}", vo.getEdctId(), vo.getEdctCntId());
		List<EduRndRegModVo> errmVoList = null; 		
		if(vo.getEdctId() != null || vo.getEdctCntId() != null) {
			logger.debug("selectEduRndRegMod Service 리턴1직전");
			errmVoList = listSecondsParser(adminDao.selectEduRndRegMod(vo)); 
			return errmVoList;
		
		}else {
			return null;
		}
	}
	public List<EduRndRegModVo> listSecondsParser(List<EduRndRegModVo> list){
		for(EduRndRegModVo vo: list) {
			vo.setEdctSttgTim(secondsParser(vo.getEdctSttgTim()));
			vo.setEdctFnshTim(secondsParser(vo.getEdctFnshTim()));
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
	/*
	public String dateToStringYmd(Date date) {
		//date 형식 -> String으로 변경 = 1989.12.10(yyyy.MM.dd 형식)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(date != null)
		    return sdf.format(date);
		else 
			return "";
	}
	
	public Date stringToDateYmd(String ymd) {
		//String 형식 -> date 형식으로
		ymd = ymd+" 00:00:00";
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date date = null;
	      try {
	    	 date = sdf.parse(ymd);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return date;
	}
	
	public Date stringToDateTime(String time) {
		//String 형식 -> date 형식으로
	    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
	    Date date = null;
	      try {
	    	 date = sdf.parse(time);
	 		logger.debug("string to Date Time 함수에서 date : {}" ,date);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return date;
	}
	*/
	/*
public List<EduRegModVo> selectEduRegMod(EduRegModVo vo){
		
		if(vo.getEdctClsfCd().equalsIgnoreCase("ALL"))
		{
			vo.setEdctClsfCd(null);
		}
		return adminDao.selectEduRegMod(vo);
	}
	
	public boolean deleteEduRegMod(EduRegModVo vo) {
		if(vo.getEdctId() != null) {
			return adminDao.deleteEduRegMod(vo);
		}
		return false;		
	}
	
	public boolean insertEduRegMod(EduRegModVo vo) {
			return adminDao.insertEduRegMod(vo);
	}
*/
}
