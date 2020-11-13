package com.ibk.itep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.MyClassDao;
import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduNowVO;
import com.ibk.itep.vo.myClass.EduReadyVO;


@Service
public class MyClassService {
	
	@Autowired
	private MyClassDao myClassDao;
	
	//수강중인 교육 조회
	public List<EduNowVO> getList(String userId){
		
		return myClassDao.selectEduNow(userId);
	}
	
	//수강신청한 교육 > 과정개설 신청목록 조회
	public List<EduNewReadyVO> getNewList(String userId){
		
		return myClassDao.selectNewEduReady(userId);
	}
	
	//수강신청한 교육 > 수강신청 목록 조회
	public List<EduReadyVO> getReadyList(String userId){
		
		return myClassDao.selectEduReady(userId);
	}

}

