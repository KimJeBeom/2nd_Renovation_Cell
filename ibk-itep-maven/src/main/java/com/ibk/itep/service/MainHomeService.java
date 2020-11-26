package com.ibk.itep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.MainHomeDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.HomeNoticeVo;
import com.ibk.itep.vo.HomeEduNowVO;

@Service
public class MainHomeService {
	
	@Autowired
	private MainHomeDao mainHomeDAO;
	
	public SessionVo selectSessionInfo(String userId){
		return mainHomeDAO.selectSessionInfo(userId);
	}
	
	public List<HomeNoticeVo> selectHomeBdnList(){
		return mainHomeDAO.selectHomeBdnList();
	}
	
	public List<HomeEduNowVO> selectHomeEduNow(String userId){
		List<HomeEduNowVO> list = mainHomeDAO.selectHomeEduNow(userId);
		for(HomeEduNowVO vo : list) {
			// 날짜 포맷 변경
			vo.setEdctSttgYmd(vo.getEdctSttgYmd().replace("-","."));
			vo.setEdctFnshYmd(vo.getEdctFnshYmd().replace("-","."));
		}
		return list;
	}
}



