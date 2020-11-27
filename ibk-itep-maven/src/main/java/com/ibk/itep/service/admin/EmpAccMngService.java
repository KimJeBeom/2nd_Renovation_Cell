package com.ibk.itep.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.common.excel.ExcelDownloadUtil;
import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EmpAccMngExcelVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;

@Service
public class EmpAccMngService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ExcelDownloadUtil excelDownloadUtil;
	
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
	
	
	/* 사용자 계정 변경 처리 */
	public void updateEmpAccMng(String userId, String athrCd){		
		
		// 입력받은값 Vo에 담기
		EmpAccMngVo vo = new EmpAccMngVo();
		vo.setUserId(userId);
		vo.setAthrCd(athrCd);
		
		adminDao.updateEmpAccMng(vo);
	}
	
	
	/* 엑셀 다운로드 */
	public void EmpAccMngExcelDown(HttpServletRequest req, HttpServletResponse res){	
		
        String brcd = req.getParameter("brcd");
        String userIdNm = req.getParameter("userIdNm");
        String athrCd = req.getParameter("athrCd");
        
		// 입력받은값 Vo에 담기
		EmpAccMngVo srchVo = new EmpAccMngVo();
		if(!brcd.equals("ALL"))
			srchVo.setBrcd(brcd);
		
		if(userIdNm != null && !userIdNm.equals("")) {
			if(userIdNm.matches(".*[0-9].*") || userIdNm.equals("admin"))
				srchVo.setUserId(userIdNm);
			else 
				srchVo.setUserNm(userIdNm);
		}
		if(!athrCd.equals("ALL")) 
			srchVo.setAthrCd(athrCd);
		
		// DB 결과 조회
		List<EmpAccMngExcelVo> list = adminDao.selectEmpAccMngExel(srchVo);
		
		// 엑셀관련 데이터 셋팅
		req.setAttribute("sheetName", "사용자 계정");
		req.setAttribute("excelName", "ITEP 사용자 계정");
		String[] colName = {"직원번호","직원명","직책","행내전화","부서명","권한"};
		req.setAttribute("colName", colName);
		req.setAttribute("list", list);
		
		// 엑셀 다운로드 실행
		excelDownloadUtil.excelDownload(req, res);
	}
}

