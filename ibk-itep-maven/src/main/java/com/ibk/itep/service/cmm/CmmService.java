package com.ibk.itep.service.cmm;

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
}
