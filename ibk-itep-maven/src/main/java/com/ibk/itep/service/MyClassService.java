package com.ibk.itep.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.MyClassDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprConfRejVo;
import com.ibk.itep.vo.myClass.EduCompleteVO;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.EduListSrchVO;
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
		
		List<EduReadyVO> list = myClassDao.selectEduReady(ssnVo);
		return list;
	}
	
	public List<EduCompleteVO> selectEduComplete(String sttgYmd, String fnshYmd){
		EduListSrchVO srchVo = new EduListSrchVO();
		srchVo.setUserId("42374");
		
		if(sttgYmd != null && !sttgYmd.equals("")) {
			srchVo.setSttgYmd(Date.valueOf(sttgYmd.replace("/", "-"))); // 검색 - 시작일자
		}if(fnshYmd != null && !fnshYmd.equals(""))
			srchVo.setFnshYmd(Date.valueOf(fnshYmd.replace("/", "-"))); // 검색 - 종료일자 
		
		List<EduCompleteVO> list = myClassDao.selectEduComplete(srchVo);
		return list;
	}
	
	public List<EduMyHistoryVO> selectHistoryList(String sttgYmd, String fnshYmd){
		EduListSrchVO srchVo = new EduListSrchVO();
		srchVo.setUserId("42374");
		
		if(sttgYmd != null && !sttgYmd.equals("")) {
			srchVo.setSttgYmd(Date.valueOf(sttgYmd.replace("/", "-"))); // 검색 - 시작일자
		}if(fnshYmd != null && !fnshYmd.equals(""))
			srchVo.setFnshYmd(Date.valueOf(fnshYmd.replace("/", "-"))); // 검색 - 종료일자 
		
		List<EduMyHistoryVO> list = myClassDao.selectEduMyHistory(srchVo);
		return list;
	}

	public EduInfoPopVO getEduInfoPop(int edctAplcId){
		
		return myClassDao.selectEduInfoPop(edctAplcId);
	}
	
	public NewEduInfoPopVO getNewEduInfoPop(int aplcId){
		
		return myClassDao.selectNewEduInfoPop(aplcId);
	}
	
	public int updateEduReady(int edctAplcId){

		return	myClassDao.updateEduReady(edctAplcId);
	}
	
	public int updateEduInfoPop(EduInfoPopVO infoVo){
		
		return myClassDao.updateEduInfoPop(infoVo);
	}
}

