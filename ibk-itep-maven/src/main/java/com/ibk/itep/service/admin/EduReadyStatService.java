package com.ibk.itep.service.admin;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EduEmpListVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;

@Service
public class EduReadyStatService {
	
	@Autowired
	private AdminDao adminDao;
	
	/* 교육신청현황 > 수강신청현황 */	
	public List<EduReadyStatVo> selectEduReadyStat(String sttgYmd, String fnshYmd, String edctClsfCd, String edctNm){		
		EduReadyStatVo vo = new EduReadyStatVo();
		
		if(sttgYmd != null && !sttgYmd.equals("")) 
			vo.setSttgYmd(Date.valueOf(sttgYmd.replace("/", "-"))); // 검색 - 시작일자
		
		if(fnshYmd != null && !fnshYmd.equals("")) 
			vo.setFnshYmd(Date.valueOf(fnshYmd.replace("/", "-"))); // 검색 - 종료일자 
		
		if(edctClsfCd != null && !edctClsfCd.equals("")) { // 검색 - 교육구분
			if(!edctClsfCd.equals("ALL"))
				vo.setEdctClsfCd(edctClsfCd);
		}
		if(edctNm != null && !edctNm.equals("")) // 검색 - 교육명
			vo.setEdctNm(edctNm);
		
		return adminDao.selectEduReadyStat(vo);
	}
	
	/* 교육신청현황 > 수강신청현황 > 교육신청직원목록 팝업 */	
	public List<EduEmpListVo> selectEduEmpListPop(String edctCntId){	
		return adminDao.selectEduEmpListPop(edctCntId);
	}
	
	/* 교육신청현황 > 과정개설신청현황 */	
	public List<EduOpenReadyStatVo> selectEduOpenReadyStat(String cnfaYn, String userIdNm, String edctNm){		
		EduOpenReadyStatVo vo = new EduOpenReadyStatVo();
		if(cnfaYn != null && !cnfaYn.equals("")) { // 검색 - 확인여부
			if(!cnfaYn.equals("ALL"))
				vo.setCnfaYn(cnfaYn);
		}
		if(userIdNm != null && !userIdNm.equals("")) { // 검색 - 사용자ID, 이름
			if(userIdNm.matches(".*[0-9].*") || userIdNm.equals("admin")) {
				vo.setUserId(userIdNm);
			} else {
				vo.setUserNm(userIdNm);
			}
		}
		if(edctNm != null && !edctNm.equals("")) // 검색 - 교육명
			vo.setEdctNm(edctNm);
		
		return adminDao.selectEduOpenReadyStat(vo);
	}
	
	/* 교육신청현황 > 과정개설신청현황 > 상세팝업*/	
	public EduOpenReadyStatVo selectNewEduInfoPop(int aplcId){	
		return adminDao.selectNewEduInfoPop(aplcId);
	}
}

