package com.ibk.itep.service.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.board.ArchieveDao;
import com.ibk.itep.vo.board.ArchieveVo;

@Service
public class ArchieveService {
	
	@Autowired private ArchieveDao ArchieveDao;
	private static final Logger logger = LoggerFactory.getLogger(ArchieveService.class);
	
	//자료실 목록을 List로 받가오기 위한 Service(praram : ttl(제목))
	public List<ArchieveVo> getList(ArchieveVo vo){
		
		logger.info("ArchieveGetList Start");
		logger.info(" -- getTtl : "+vo.getTtl());
	
		List<ArchieveVo> list =  ArchieveDao.selectArchieve(vo);
		logger.info("ArchieveGetList End");

		return list;
	}

	//자료실 상세정보를 Vo로 받가오기 위한 Service(praram : getRflbId(자료실번호))
	public ArchieveVo getDetail(ArchieveVo vo){
		
		logger.info("ArchieveGetDetail Start");
		logger.info(" -- getRflbId : "+vo.getRflbId());
	
		ArchieveVo outVo =  ArchieveDao.selectArchieveDetail(vo);
		
		logger.info("ArchieveGetDetail End");

		return outVo;
	}
	
	//자료실 변경 작업처리를 위한 Service(praram : 변경대상 Vo(ArchieveVo) 및 ModAction 값))
	public boolean modAction(ArchieveVo vo,String modType){
		
		logger.info("ArchieveModAction Start");
		logger.info(" -- getRflbId : "+vo.getRflbId());
		logger.info(" -- modType   : "+modType);
		
		boolean modRst = false;
		
		//ModAction에 따른 DAO제어
		if(modType.equals("update")) {
			modRst =  ArchieveDao.updateArchieve(vo);
		}else if(modType.equals("delete")){
			modRst =  ArchieveDao.deleteArchieve(vo);
		}else if(modType.equals("insert")){
			vo.setUserId("40868"); //등록자 정보 매핑(SSO연동기능 완료시 수정)
			modRst =  ArchieveDao.insertArchieve(vo);
		}
		
		logger.info("ArchieveModAction End");
		return modRst;
	}

}
