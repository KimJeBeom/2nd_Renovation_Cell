package com.ibk.itep.service.eduApply;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.eduApply.EduListDao;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.eduApply.EduListVo;

@Service
public class EduListService {
	
	@Autowired private EduListDao eduListDAO;
	private static final Logger logger = LoggerFactory.getLogger(EduListService.class);
	
	//공지사항 목록을 List로 받가오기 위한 Service(praram : ttl(제목))
	public List<EduListVo> getList(EduListVo vo){
		
		logger.info("EduGetList Start");
	
		List<EduListVo> list =  eduListDAO.selectEduList(vo);
		
		logger.info("EduGetList End");

		return list;
	}
	
	
	public EduListVo getDetail(EduListVo vo){
		
		logger.info("EduGetList Start");
		
		EduListVo outVo =  eduListDAO.selectEduDetail(vo);
		
		logger.info("EduGetList End");

		return outVo;
	}
	
	public List<EduListVo> getCntList(EduListVo vo){
		
		logger.info("getCntList Start");
	
		List<EduListVo> list = eduListDAO.selectInfoCntPop(vo);
		
		logger.info("getCntList End");

		return list;
	}
	
	public String modAction(EduListVo vo,String modType){
		
		logger.info("modAction Start");
		logger.info(" -- modType   : "+modType);
		
		boolean modRst = false;
		String modMsg;
		
		//ModAction에 따른 DAO제어
		vo.setUserId("40868");
		vo.setTeamCd("8597");
		vo.setDvcd("0710");
		vo.setDpmAthzId("40868"); 
		
		String modCode =  eduListDAO.selectEduApprAbleYn(vo);
		
		if(modCode.equals("update")) {
			//modRst =  eduListDAO.updateNotice(vo);
		}else if(modType.equals("delete")){
			//modRst =  eduListDAO.deleteNotice(vo);
		}else if(modCode.equals("insert")){
			if(vo.getEginAplyYn().equals("Y")){
				modRst =  eduListDAO.insertEduApplyPopApr(vo);
			}else {
				modRst =  eduListDAO.insertEduApplyPopNon(vo);
			}
		}else if(modCode.equals("disable")){
			modMsg = "disable";
		}

		if(modRst==true) {
			modMsg="success";
		}else {
			modMsg="fail";
		}
		logger.info("modAction End");
		return modMsg;
	}



}
