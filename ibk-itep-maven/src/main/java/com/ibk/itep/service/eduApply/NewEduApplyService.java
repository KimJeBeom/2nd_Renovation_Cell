package com.ibk.itep.service.eduApply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.eduApply.NewEduApplyDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.eduApply.NewEduApplyVo;

@Service
public class NewEduApplyService {
	
	@Autowired private NewEduApplyDao newEduApplyDAO;
	private static final Logger logger = LoggerFactory.getLogger(NewEduApplyService.class);
	
	public String addNewEdu(NewEduApplyVo vo,SessionVo ssnInfo){
		
		logger.info("addNewEdu Start");
		vo.setUserId(ssnInfo.getUserId()); //사용자ID세팅
		
		boolean addYn = newEduApplyDAO.InsertNewEdu(vo);
		
		String addRst = "fail";
		if(addYn==true) {
			addRst = "success";
		}	
		logger.info("addNewEdu End");

		return addRst;
	}

}
