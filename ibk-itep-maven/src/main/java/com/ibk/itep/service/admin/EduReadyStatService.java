package com.ibk.itep.service.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.admin.EduEmpListVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;
import com.ibk.itep.vo.admin.NewEduInfoVo;

@Service
public class EduReadyStatService {
	
	@Autowired
	private AdminDao adminDao;

	
	/* 수강신청현황 */	
	public List<EduReadyStatVo> selectEduReadyStat(String sttgYmd, String fnshYmd, String edctClsfCd, String edctNm){		
		EduReadyStatVo srchVo = new EduReadyStatVo();
		
		// 검색 데이터 vo에 담아 넘겨줌
		if(sttgYmd != null && !sttgYmd.equals("")) 
			srchVo.setSttgYmd(sttgYmd);
		else
			srchVo.setSttgYmd("");		
		if(fnshYmd != null && !fnshYmd.equals("")) 
			srchVo.setFnshYmd(fnshYmd); 
		else 
			srchVo.setFnshYmd("");		
		if(edctClsfCd != null && !edctClsfCd.equals("")) { 
			if(!edctClsfCd.equals("ALL"))
				srchVo.setEdctClsfCd(edctClsfCd);
		}
		if(edctNm != null && !edctNm.equals("")) 
			srchVo.setEdctNm(edctNm);
		
		List<EduReadyStatVo> list = adminDao.selectEduReadyStat(srchVo);
		
		// 날짜 포맷 변경
		for(EduReadyStatVo vo : list) {
			if(vo.getEdctSttgYmd() == null)
				vo.setEdctSttgYmd("");
			else
				vo.setEdctSttgYmd(changeDateFormat(vo.getEdctSttgYmd()));
			if(vo.getEdctFnshYmd() == null)
				vo.setEdctFnshYmd("");
			else
				vo.setEdctFnshYmd(changeDateFormat(vo.getEdctFnshYmd()));
			if(vo.getSttgYmd() == null)
				vo.setSttgYmd("");
			else
				vo.setSttgYmd(changeDateFormat(vo.getSttgYmd()));
			if(vo.getFnshYmd() == null)
				vo.setFnshYmd("");
			else
				vo.setFnshYmd(changeDateFormat(vo.getFnshYmd()));
		}
		
		return list;
	}
	
	
	/* 수강신청현황 > 교육신청직원목록 팝업  */	
	public List<EduEmpListVo> selectEduEmpListPop(int edctCntId){	
		List<EduEmpListVo> list = adminDao.selectEduEmpListPop(edctCntId);
		
		// 날짜 포맷 변경
		for(EduEmpListVo vo : list) {
			if(vo.getEdctSttgYmd() == null)
				vo.setEdctSttgYmd("");
			else
				vo.setEdctSttgYmd(changeDateFormat(vo.getEdctSttgYmd()));
			if(vo.getEdctFnshYmd() == null)
				vo.setEdctFnshYmd("");
			else
				vo.setEdctFnshYmd(changeDateFormat(vo.getEdctFnshYmd()));
		}
		
		return list;
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
		
		// 검색 데이터 vo에 담아 넘겨줌
		if(cnfaYn != null && !cnfaYn.equals("")) { 
			if(!cnfaYn.equals("ALL"))
				srchVo.setCnfaYn(cnfaYn);
		}
		if(userIdNm != null && !userIdNm.equals("")) { 
			if(userIdNm.matches(".*[0-9].*") || userIdNm.equals("admin")) {
				srchVo.setUserId(userIdNm);
			} else {
				srchVo.setUserNm(userIdNm);
			}
		}
		if(edctNm != null && !edctNm.equals("")) 
			srchVo.setEdctNm(edctNm);
		
		List<EduOpenReadyStatVo> list = adminDao.selectEduOpenReadyStat(srchVo);

		// 날짜 포맷 변경
		for(EduOpenReadyStatVo vo : list) {
			if(vo.getEdctSttgYmd() == null)
				vo.setEdctSttgYmd("");
			else
				vo.setEdctSttgYmd(changeDateFormat(vo.getEdctSttgYmd()));
			if(vo.getEdctFnshYmd() == null)
				vo.setEdctFnshYmd("");
			else
				vo.setEdctFnshYmd(changeDateFormat(vo.getEdctFnshYmd()));
		}
		
		return list;
	}
	
	
	/* 과정개설신청현황 > 상세팝업 */	
	public NewEduInfoVo selectNewEduInfoPop(int aplcId){	
		NewEduInfoVo vo = adminDao.selectNewEduInfoPop(aplcId);
		
		// 교육비용 천단위 , 표시
		vo.setEdex(String.format("%,d", Integer.parseInt(vo.getEdex())));
		
		// 날짜 포맷 변경
		if(vo.getAplcTs() == null)
			vo.setAplcTs("");
		else
			vo.setAplcTs(changeDateFormat(vo.getAplcTs()));
		if(vo.getEdctSttgYmd() == null)
			vo.setEdctSttgYmd("");
		else
			vo.setEdctSttgYmd(changeDateFormat(vo.getEdctSttgYmd()));
		if(vo.getEdctFnshYmd() == null)
			vo.setEdctFnshYmd("");
		else
			vo.setEdctFnshYmd(changeDateFormat(vo.getEdctFnshYmd()));
		if(vo.getAplcSttgYmd() == null)
			vo.setAplcSttgYmd("");
		else
			vo.setAplcSttgYmd(changeDateFormat(vo.getAplcSttgYmd()));
		if(vo.getAplcFnshYmd() == null)
			vo.setAplcFnshYmd("");
		else
			vo.setAplcFnshYmd(changeDateFormat(vo.getAplcFnshYmd()));
		if(vo.getEdctSttgTim() == null)
			vo.setEdctSttgTim("");
		else
			vo.setEdctSttgTim(changeTimeFormat(vo.getEdctSttgTim()));
		if(vo.getEdctFnshTim() == null)
			vo.setEdctFnshTim("");
		else
			vo.setEdctFnshTim(changeTimeFormat(vo.getEdctFnshTim()));
		
		return vo;
	}
	
	
	/* 과정개설신청 확인처리 */	
	public void updateNewEduInfoPop(int aplcId, SessionVo ssnInfo){	
		NewEduInfoVo vo = new NewEduInfoVo();
		
		vo.setAplcId(aplcId);
		vo.setCnfmId(ssnInfo.getUserId());
		
		adminDao.updateNewEduInfoPop(vo);
	}
	
	
	/* 날짜포맷변경 함수 */
	public String changeDateFormat(String ymd) {
		SimpleDateFormat asIsSdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat toBeSdf = new SimpleDateFormat("yyyy.MM.dd");
		Date date = null;
		try {
			date = asIsSdf.parse(ymd);
			ymd = toBeSdf.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ymd;
	}
	
	/* 시간포맷변경 함수 */
	public String changeTimeFormat(String time) {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Date date = null;
		try {
			date = sdf.parse(time);
			time = sdf.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return time;
	}
}

