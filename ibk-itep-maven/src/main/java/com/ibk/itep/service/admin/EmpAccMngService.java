package com.ibk.itep.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.common.excel.ExcelUtil;
import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EmpAccMngExcelVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;

@Service
public class EmpAccMngService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ExcelUtil excelUtil;
	
	/* 사용자 계정관리 */
	public List<EmpAccMngVo> selectEmpAccMng(String brcd, String userIdNm, String athrCd, int pageNum){		
		
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
		vo.setPageSet(pageNum);
		
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
		List<EmpAccMngExcelVo> list = adminDao.selectEmpAccMngExcel(srchVo);
		
		// 엑셀관련 데이터 셋팅
		req.setAttribute("sheetName", "사용자 계정");
		req.setAttribute("excelName", "ITEP_사용자계정");
		String[] colName = {"직원번호","직원명","직책","행내전화","부서명","권한"};
		req.setAttribute("colName", colName);
		req.setAttribute("list", list);
		
		// 엑셀 다운로드 실행
		excelUtil.excelDownload(req, res);
	}
	
	/* 엑셀 업로드 - 현재 미사용 */
	/*  
	 * public List<EmpAccMngExcelVo> EmpAccMngExcelUp(MultipartFile file) throws
	 * IOException{
	 * 
	 * String[] colName = {"userId","userNm","userJtm","userTpn","brnm","athrNm"};
	 * 
	 * // 파일에서 시트 꺼냄 Sheet sheet = excelUtil.excelUpload(file, colName);
	 * 
	 * List<EmpAccMngExcelVo> dataList = new ArrayList<>();
	 * 
	 * for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) { // 4 Row row =
	 * sheet.getRow(i); EmpAccMngExcelVo data = new EmpAccMngExcelVo();
	 * 
	 * data.setUserId(row.getCell(0).getStringCellValue());
	 * data.setUserNm(row.getCell(1).getStringCellValue());
	 * data.setUserJtm(row.getCell(2).getStringCellValue());
	 * data.setUserTpn(row.getCell(2).getStringCellValue());
	 * data.setBrnm(row.getCell(2).getStringCellValue());
	 * data.setAthrNm(row.getCell(2).getStringCellValue());
	 * 
	 * dataList.add(data); }
	 * 
	 * return dataList; }
	 */
}

