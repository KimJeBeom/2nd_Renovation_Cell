package com.ibk.itep.service.cmm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.CmmDao;
import com.ibk.itep.vo.cmm.ClaVo;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;
import com.ibk.itep.vo.cmm.ClsVo;

@Service
public class CmmService {
	
	private static final Logger logger = LoggerFactory.getLogger(CmmService.class);
	
	@Autowired
	private CmmDao cmmDao;

	public List<ClaVo> selectCla(ClaVo vo){
		return cmmDao.selectCla(vo);
	}
	public List<CldVo> selectCld(CldVo vo){
		return cmmDao.selectCld(vo);
	}
	public List<CliVo> selectCli(CliVo vo){
		return cmmDao.selectCli(vo);
	}
	public List<ClsVo> selectCls(ClsVo vo){
		return cmmDao.selectCls(vo);
	}
	
	public String dateToStringYmd(Date date) {
		//date 형식 -> String으로 변경 = 1989.12.10(yyyy.MM.dd 형식)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		if(date != null)
		    return sdf.format(date);
		else 
			return "";
	}
	
	public Date stringToDateYmd(String string) {
		//String 형식 -> date 형식으로
		logger.debug("stringToDate Ymd 입력 파라미터 {}", string);
	      string = string+" 00:00:00";
	      logger.debug("stringToDate Ymd 변경후 파라미터 {}", string);
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	      Date date = null;
	      try {
	    	 date = sdf.parse(string);
	      } catch (ParseException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return date;
	}
}
