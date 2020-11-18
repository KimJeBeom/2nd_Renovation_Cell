package com.ibk.itep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.MainHomeDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.HomeBdnVo;
import com.ibk.itep.vo.HomeEduNowVo;

@Service
public class MainHomeService {
	
	@Autowired
	private MainHomeDao mainHomeDAO;
	
	public SessionVo selectSessionInfo(String userId){
		return mainHomeDAO.selectSessionInfo(userId);
	}
	
	public List<HomeBdnVo> selectHomeBdnList(){
		return mainHomeDAO.selectHomeBdnList();
	}
	
	public List<HomeEduNowVo> selectHomeEduNow(String userId){
		return mainHomeDAO.selectHomeEduNow(userId);
	}
}



