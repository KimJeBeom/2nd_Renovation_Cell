package com.ibk.itep.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;

@Service
public class EmpAccMngService {
	
	@Autowired
	private AdminDao adminDao;
	
	/* 사용자 계정관리 */
	public List<EmpAccMngVo> selectEmpAccMng(String brcd, String userIdNm, String athrCd){		
		
		// 입력받은값 Vo에 담기
		EmpAccMngVo vo = new EmpAccMngVo();
		if(!brcd.equals("ALL"))
			vo.setBrcd(brcd);
		
		if(userIdNm != null && !userIdNm.equals("")) {
			if(userIdNm.matches(".*[0-9].*") || userIdNm.equals("admin")) {
				vo.setUserId(userIdNm);
			} else {
				vo.setUserNm(userIdNm);
			}
		}
		
		if(!athrCd.equals("ALL")) 
			vo.setAthrCd(athrCd);
		
		return adminDao.selectEmpAccMng(vo);
	}
	
	public void updateEmpAccMng(String userId, String athrCd){		
		
		// 입력받은값 Vo에 담기
		EmpAccMngVo vo = new EmpAccMngVo();
		vo.setUserId(userId);
		vo.setAthrCd(athrCd);
		
		adminDao.updateEmpAccMng(vo);
	}
}

