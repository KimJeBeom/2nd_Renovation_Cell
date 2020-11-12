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
	
	//�������� ���� ��ȸ
	public List<EduNowVO> getList(String userId){
		
		return myClassDao.selectEduNow(userId);
	}
	
	//������û�� ���� > �������� ��û��� ��ȸ
	public List<EduNewReadyVO> getNewList(String userId){
		
		return myClassDao.selectNewEduReady(userId);
	}
	
	//������û�� ���� > ������û ��� ��ȸ
	public List<EduReadyVO> getReadyList(String userId){
		
		return myClassDao.selectEduReady(userId);
	}

}

