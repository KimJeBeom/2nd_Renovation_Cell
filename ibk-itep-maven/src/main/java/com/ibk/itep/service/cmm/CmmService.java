package com.ibk.itep.service.cmm;

import java.lang.reflect.Field;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.CmmDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.cmm.ClaVo;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;
import com.ibk.itep.vo.cmm.ClsVo;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.cmm.CmbVo;

@Service
public class CmmService {
	
	private static final Logger logger = LoggerFactory.getLogger(CmmService.class);
	
	@Autowired
	private CmmDao cmmDao;

	public List<ClaVo> selectCla(ClaVo vo){
		logger.debug("CmmDao selectCla 함수");
		return cmmDao.selectCla(vo);
	}
	public List<CldVo> selectCld(CldVo vo){
		logger.debug("CmmDao selectCld 함수");
		return cmmDao.selectCld(vo);
	}
	public List<CliVo> selectCli(CliVo vo){
		logger.debug("CmmDao selectCli 함수");
		return cmmDao.selectCli(vo);
	}
	public List<ClsVo> selectCls(ClsVo vo){
		logger.debug("CmmDao selectCls 함수");
		return cmmDao.selectCls(vo);
	}
	public List<CluVo> selectDpm(SessionVo ssnInfo){
		return cmmDao.selectDpm(ssnInfo);
	}
	public String selectDpm(String userId){
		return cmmDao.selectAuth(userId);
	}
	public List<CmbVo> selectCmb(){
		return cmmDao.selectCmb(); // 상위부점이 IT그룹인 부서 조회
	}
	
	public void objFieldTest(Object obj) {
	    try {
	        Object o = obj;
	        for (Field field : o.getClass().getDeclaredFields()) {
	            field.setAccessible(true);
				Object value = field.get(o); // 필드에 해당하는 값을 가져옵니다.
				logger.debug("field : {} / value : {}", field.getName(), value);
				//System.out.println("field : "+field.getName()+" | value : "+value);
	        }
	    }catch (Exception e) {
	        e.printStackTrace();
		}
	}
}
