package com.ibk.itep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.MyClassDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduCompleteVO;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.EduMyHistoryVO;
import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduNowVO;
import com.ibk.itep.vo.myClass.EduReadyVO;
import com.ibk.itep.vo.myClass.NewEduInfoPopVO;


@Service
public class MyClassService {
	
	@Autowired
	private MyClassDao myClassDao;
	
	public List<EduNowVO> getList(SessionVo ssnVo){
		
		return myClassDao.selectEduNow(ssnVo);
	}
	
	public List<EduNewReadyVO> getNewList(SessionVo ssnVo){
		
		return myClassDao.selectNewEduReady(ssnVo);
	}
	
	public List<EduReadyVO> getReadyList(SessionVo ssnVo){
		
		return myClassDao.selectEduReady(ssnVo);
	}
	
	public List<EduCompleteVO> getCompleteList(SessionVo ssnVo){
		
		return myClassDao.selectEduComplete(ssnVo);
	}
	
	public List<EduMyHistoryVO> getHistoryList(SessionVo ssnVo){
		
		return myClassDao.selectEduMyHistory(ssnVo);
	}

	public EduInfoPopVO getEduInfoPop(int edctAplcId){
		
		return myClassDao.selectEduInfoPop(edctAplcId);
	}
	
	public NewEduInfoPopVO getNewEduInfoPop(int aplcId){
		
		return myClassDao.selectNewEduInfoPop(aplcId);
	}
	
	public EduReadyVO getUpdateEduReady(int edctAplcId){
		
		return myClassDao.updateEduReady(edctAplcId);
	}
}

