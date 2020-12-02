package com.ibk.itep.service.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.common.excel.ExcelUtil;
import com.ibk.itep.controller.admin.EduHistoryController;
import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.admin.EduEmpListExcelVo;
import com.ibk.itep.vo.admin.EduEmpListVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;
import com.ibk.itep.vo.admin.NewEduInfoVo;

@Service
public class EduReadyStatService {
	
	@Autowired
	private AdminDao adminDao;

	@Autowired
	private ExcelUtil excelUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(EduReadyStatService.class);
		
	/* 수강신청현황 페이징처리 */	
	public List<EduReadyStatVo> selectEduReadyStat(EduReadyStatVo srchVo){		
		
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
		
		for(EduEmpListVo vo : list) {
			// 날짜 포맷 변경
			if(vo.getEdctSttgYmd() == null)
				vo.setEdctSttgYmd("");
			else
				vo.setEdctSttgYmd(changeDateFormat(vo.getEdctSttgYmd()));
			if(vo.getEdctFnshYmd() == null)
				vo.setEdctFnshYmd("");
			else
				vo.setEdctFnshYmd(changeDateFormat(vo.getEdctFnshYmd()));
			
			// 교육내용 개행처리
			vo.setEdctCon(vo.getEdctCon().replace("\n", "<br>"));
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
		
		// 수료처리
		List<EduEmpListVo> list = new ArrayList<EduEmpListVo>();
		for(String key : map.keySet()) {
			EduEmpListVo vo = new EduEmpListVo();
			vo.setEdctAplcId(Integer.parseInt(key));
			vo.setCtcrYn(map.get(key));
			list.add(vo);
		}
		adminDao.updateEduEmpListPopCtcrYn(list); // 수료처리
	}
	
	/* 수강신청현황 > 교육신청직원목록 팝업 > 엑셀 다운로드 */
	public void selectEduEmpListExcel(HttpServletRequest req, HttpServletResponse res){	
		
		int edctCntId = Integer.parseInt(req.getParameter("edctCntId"));
		
		// DB 결과 조회
		List<EduEmpListExcelVo> list = adminDao.selectEduEmpListExcel(edctCntId);
		
		// 엑셀관련 데이터 셋팅
		req.setAttribute("sheetName", "교육신청 직원목록");
		req.setAttribute("excelName", "ITEP_교육신청 직원목록");
		String[] colName = {"부서","직원번호","직원명","수료여부"};
		req.setAttribute("colName", colName);
		req.setAttribute("list", list);
		
		// 엑셀 다운로드 실행
		excelUtil.excelDownload(req, res);
	}
	
	
	/* 과정개설신청현황 */	
	public List<EduOpenReadyStatVo> selectEduOpenReadyStat(String cnfaYn, String userIdNm, String edctNm, int pageNum){		
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
		srchVo.setPageSet(pageNum);
		
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
		vo.setEdex(String.format("%,d", Integer.parseInt(vo.getEdex().replace(",", ""))));
		
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
		
		// 교육내용 개행처리
		vo.setEdctCon(vo.getEdctCon().replace("\n", "<br>"));
		
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

