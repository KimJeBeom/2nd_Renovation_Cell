package com.ibk.itep.common.excel;

import java.io.IOException;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ExcelUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(ExcelUtil.class);

	/* 엑셀 다운로드 함수 */
	public void excelDownload(HttpServletRequest request, HttpServletResponse response) {

		logger.debug("엑셀 다운로드 시작");
		
		XSSFWorkbook workbook = new XSSFWorkbook(); //xlsx
		XSSFSheet sheet = workbook.createSheet(request.getAttribute("sheetName").toString()); //시트명 설정
		String[] colName = (String[]) request.getAttribute("colName");
		List<?> list = (List<?>) request.getAttribute("list");
		
		Row row = null;
		Cell cell = null;
		int rowIdx = 0;
		
		// 컬럼명 입력
		row = sheet.createRow(rowIdx++);
		for(int i = 0; i < colName.length; i++) {
			cell = row.createCell(i);
	        cell.setCellValue(colName[i]);
	        cell.setCellStyle(cellStyle(workbook, "head")); // 셀 스타일 적용
			sheet.setColumnWidth(i, 3500);
		}
		
		try {
			// 데이터 입력
			for(int i = 0; i < list.size(); i++) {
				row = sheet.createRow(rowIdx++);
				int cellIdx = 0;
				for(Field field : list.get(i).getClass().getDeclaredFields()) {
					field.setAccessible(true);
					Object value = field.get(list.get(i));	
					
					cell = row.createCell(cellIdx++);				
					if(value != null) 
						cell.setCellValue(value.toString());
					cell.setCellStyle(cellStyle(workbook, "data")); // 셀 스타일 적용
				} 
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} 
		
		// 엑셀 다운로드 실행
		try {   
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(request.getAttribute("excelName").toString()+".xlsx", "UTF-8")+"\";");
    		response.setContentType("application/octet-stream");
    		
    		ServletOutputStream out = response.getOutputStream();
    		workbook.write(out);
    		
			response.getOutputStream().close();
			out.close();
			logger.debug("엑셀 다운로드 끝");
            
        } catch (Exception e) {
            logger.error("exception during downloading excel file : {}", e);
        } finally {
        	
        }
	}
	
	
	/* 셀 스타일 설정하는 함수 */
	public CellStyle cellStyle(XSSFWorkbook xlsWb, String kind) {
		CellStyle cellStyle = xlsWb.createCellStyle();
		cellStyle.setAlignment(HorizontalAlignment.CENTER); //가운데 정렬
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); //중앙 정렬
		
		if(kind.equals("head")) {
			cellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex()); //노란색
			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND); //색상 패턴처리
			cellStyle.setAlignment(HorizontalAlignment.CENTER);
			cellStyle.setBorderTop(BorderStyle.THIN);
			cellStyle.setBorderBottom(BorderStyle.THIN);
			cellStyle.setBorderLeft(BorderStyle.THIN);
			cellStyle.setBorderRight(BorderStyle.THIN);
		} else if(kind.equals("data")) {
			cellStyle.setFillForegroundColor(IndexedColors.WHITE.getIndex()); 
			cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND); //색상 패턴처리
			cellStyle.setAlignment(HorizontalAlignment.CENTER);
			cellStyle.setBorderTop(BorderStyle.THIN);
			cellStyle.setBorderBottom(BorderStyle.THIN);
			cellStyle.setBorderLeft(BorderStyle.THIN);
			cellStyle.setBorderRight(BorderStyle.THIN);
		}
		
		return cellStyle;
	}
	
	
	/* 엑셀 업로드 */
	public Sheet excelUpload(MultipartFile file, String[] colVoName) throws IOException {
		
		// 파일 확장자 체크
		String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // 3
	    if (!extension.equals("xlsx") && !extension.equals("xls")) {
	      throw new IOException("엑셀파일만 업로드 해주세요.");
	    }

	    // workbook 생성
	    Workbook workbook = null;
	    if (extension.equals("xlsx")) {
	      workbook = new XSSFWorkbook(file.getInputStream());
	    } else if (extension.equals("xls")) {
	      workbook = new HSSFWorkbook(file.getInputStream());
	    }

	    Sheet sheet = workbook.getSheetAt(0);
	    
	    return sheet;
	}
	
	
	/* 업로드한 엑셀에서 데이터 추출 */
    public static String getCellValue(Cell cell) {
 
        String value = null; // 데이터를 저장할 변수 
        
        if (cell == null)
            value = "";
        else {
        	CellType cellType = cell.getCellType();
            switch (cellType) { // cell 타입에 따른 데이타 저장
            	case FORMULA:
            		value = cell.getCellFormula();
            		break;
            	case NUMERIC:
            		if (DateUtil.isCellDateFormatted(cell)) {
            			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	                    value = ""+ sdf.format(cell.getDateCellValue());
	                } else {
	                    value = ""+ String.format("%.0f", new Double(cell.getNumericCellValue()));
	                }
	                break;
	            case STRING:
	                value = "" + cell.getStringCellValue();
	                break;
	            case BLANK:
	                value = "";
	                break;
	            case ERROR:
	                value = "" + cell.getErrorCellValue();
	                break;
	            default:
            }
        }
        return value.trim();
    }
}

