package com.ibk.itep.service.eduApply;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.eduApply.EduListDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.eduApply.EduListVo;

@Service
public class EduListService {
	
	@Autowired private EduListDao eduListDAO;
	private static final Logger logger = LoggerFactory.getLogger(EduListService.class);
	
	//교육목록을 List로 받가오기 위한 Service(praram : schType, schValue)
	public List<EduListVo> getList(String schType, String schValue){
		
		logger.info("EduGetList Start");
		//조회타입 + 조회값 을 Map으로 설정하여 List조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);  //조회타입
		map.put("schValue", schValue);//조회값
		List<EduListVo> list =  eduListDAO.selectEduList(map);
		
		logger.info("EduGetList End");

		return list;
	}
	
	//교육상세정보를 가져오기 위한 Service
	public EduListVo getDetail(EduListVo vo){
		
		logger.info("EduGetList Start");
		EduListVo outVo =  eduListDAO.selectEduDetail(vo);		
		logger.info("EduGetList End");

		return outVo;
	}
	
	//교육차수목록을 List로 받기 위한 Service
	public List<EduListVo> getCntList(EduListVo vo){
		
		logger.info("getCntList Start");
		List<EduListVo> list = eduListDAO.selectInfoCntPop(vo);
		logger.info("getCntList End");

		return list;
	}
	
	//교육신청(insert/update/delete)를 위한 Service
	public String modAction(EduListVo vo,SessionVo ssnInfo){
		
		logger.info("modAction Start");
		
		boolean modRst = false;
		String modMsg = null;
		vo.setUserId(ssnInfo.getUserId());
		vo.setTeamCd(ssnInfo.getTeamCd());
		vo.setDvcd(ssnInfo.getBrcd());
		
		//동일 차수에 기신청된 요청서정보가 있는지 확인하여 (update/insert/disable)로 반환 
		String modCode =  eduListDAO.selectEduApprAbleYn(vo);
		
		if(modCode.equals("update")) { //재신청
			//modRst =  eduListDAO.updateNotice(vo);
		}else if(modCode.equals("insert")){ //신규신청
			//결재 대상일경우 APRDPM 단계코드로 insert
			if(vo.getSnctTgtYn().equals("Y")){ 
				modRst =  eduListDAO.insertEduApplyPopApr(vo);
			//결재 대상이 아닐경우 APRFIN단계코드로 insert
			}else { 
				modRst =  eduListDAO.insertEduApplyPopNon(vo);
			}
		}
		//기신청된 신청이 있을경우 disable로 반환
		if(modCode.equals("disable"))
			modMsg = "disable";
		else if(modRst==true) 
			modMsg="success";
		else 
			modMsg="fail";
		
		logger.info("modAction End");
		return modMsg;
	}



}
