package com.ibk.itep.service.admin;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.controller.MainHomeContoller;
import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.admin.EduEmpListVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;

@Service
public class EduReadyStatService {
	
	@Autowired
	private AdminDao adminDao;
	
	/* 수강신청현황 */	
	public List<EduReadyStatVo> selectEduReadyStat(String sttgYmd, String fnshYmd, String edctClsfCd, String edctNm){		
		EduReadyStatVo vo = new EduReadyStatVo();
		
		// 검색 - 시작일자, 종료일자, 교육구분
		if(sttgYmd != null && !sttgYmd.equals("")) 
			vo.setSttgYmd(Date.valueOf(sttgYmd.replace("/", "-"))); 
		
		// 검색 - 종료일자 
		if(fnshYmd != null && !fnshYmd.equals("")) 
			vo.setFnshYmd(Date.valueOf(fnshYmd.replace("/", "-"))); 
		
		// 검색 - 교육구분
		if(edctClsfCd != null && !edctClsfCd.equals("")) { 
			if(!edctClsfCd.equals("ALL"))
				vo.setEdctClsfCd(edctClsfCd);
		}
		// 검색 - 교육명
		if(edctNm != null && !edctNm.equals("")) 
			vo.setEdctNm(edctNm);
		
		return adminDao.selectEduReadyStat(vo);
	}
	
	/* 수강신청현황 > 교육신청직원목록 팝업  */	
	public List<EduEmpListVo> selectEduEmpListPop(int edctCntId){	
		return adminDao.selectEduEmpListPop(edctCntId);
	}
	
	/* 수강신청현황 > 교육신청직원목록 팝업 > 차수완료, 수료처리  */	
	public void updateEduEmpListPop(Map<String, String> map){	
		
		// {edctCntId : 차수번호, 신청서번호 : 수료여부, 신청서번호 : 수료여부 ,...} 
		// 형태로 데이터가 저장되어있음
		
		int edctCntId = Integer.parseInt(map.get("edctCntId"));
		adminDao.updateEduEmpListPopFnshY(edctCntId); // 차수완료 처리
		map.remove("edctCntId"); // Map에서 차수ID값 제거
		
		// DAO에게 신청서ID, 수료여부 한쌍씩 넘기기 위한 map
		Map<String, String> paramMap = new HashMap<String,String>();
		for(String key : map.keySet()) {
			paramMap.put("edctAplcId", key);
			paramMap.put("ctcrYn", map.get(key));
			adminDao.updateEduEmpListPopCtcrYn(paramMap); // 수료처리
		}
	}
	
	/* 과정개설신청현황 */	
	public List<EduOpenReadyStatVo> selectEduOpenReadyStat(String cnfaYn, String userIdNm, String edctNm){		
		EduOpenReadyStatVo srchVo = new EduOpenReadyStatVo();
		
		// 검색 - 확인여부
		if(cnfaYn != null && !cnfaYn.equals("")) { 
			if(!cnfaYn.equals("ALL"))
				srchVo.setCnfaYn(cnfaYn);
		}
		
		// 검색 - 사용자ID, 이름
		if(userIdNm != null && !userIdNm.equals("")) { 
			if(userIdNm.matches(".*[0-9].*") || userIdNm.equals("admin")) {
				srchVo.setUserId(userIdNm);
			} else {
				srchVo.setUserNm(userIdNm);
			}
		}
		
		// 검색 - 교육명
		if(edctNm != null && !edctNm.equals("")) 
			srchVo.setEdctNm(edctNm);
		
		return adminDao.selectEduOpenReadyStat(srchVo);
	}
	
	/* 과정개설신청현황 > 상세팝업 */	
	public EduOpenReadyStatVo selectNewEduInfoPop(int aplcId){	
		EduOpenReadyStatVo vo = adminDao.selectNewEduInfoPop(aplcId);
		
		// 교육비용 천단위 , 표시
		vo.setEdex(String.format("%,d", Integer.parseInt(vo.getEdex())));
		
		return vo;
	}
	
	/* 과정개설신청 확인처리 */	
	public void updateNewEduInfoPop(int aplcId, SessionVo ssnInfo){	
		EduOpenReadyStatVo vo = new EduOpenReadyStatVo();
		
		vo.setAplcId(aplcId);
		vo.setCnfmId(ssnInfo.getUserId());
		
		adminDao.updateNewEduInfoPop(vo);
	}
}

