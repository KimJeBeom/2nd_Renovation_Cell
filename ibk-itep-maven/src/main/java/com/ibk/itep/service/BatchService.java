package com.ibk.itep.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.batch.BatchDao;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.cmm.CmbVo;


@Service
public class BatchService {
	@Autowired private BatchDao batchDAO;
	
	public int upsertUser(CluVo vo) {
		String userAthr = batchDAO.userAthrChk(vo);
		vo.setAthrCd(userAthr);
		int regRst = batchDAO.upsertUser(vo);
		return regRst;
	}
	public int upsertBranch(CmbVo vo) {
		int regRst = batchDAO.upsertBranch(vo);
		return regRst;
	}
}

