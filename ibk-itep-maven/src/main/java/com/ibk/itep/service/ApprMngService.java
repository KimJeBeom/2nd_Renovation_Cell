package com.ibk.itep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.ApprMngDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprListDetailVo;
import com.ibk.itep.vo.apprMng.ApprListVo;


@Service
public class ApprMngService {
	
	@Autowired
	private ApprMngDao apprMngDAO;
	
	public List<ApprListVo> selectApprList(SessionVo ssnVo){
		return apprMngDAO.selectApprList(ssnVo);
	}
	
	public ApprListDetailVo selectApprListDetail(int edctAplcId){
		return apprMngDAO.selectApprListDetail(edctAplcId);
	}
	
	public void updateApprConfirm(List<Integer> edctAplcId, SessionVo ssnVo){
		apprMngDAO.updateApprConfirm(edctAplcId, ssnVo);
	}
}

