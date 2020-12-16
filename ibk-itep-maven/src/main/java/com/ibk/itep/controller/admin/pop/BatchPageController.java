package com.ibk.itep.controller.admin.pop;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.BatchService;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.cmm.CmbVo;
 
@Controller
public class BatchPageController {
	
	@Autowired private BatchService service;
	@Value("${file.path}")	private String FILE_PATH;
	private String read_path = null;
	
	private static final Logger logger = LoggerFactory.getLogger(BatchPageController.class);
	
	//GET거래 : 최초접속시 / 조회시  거래
	@RequestMapping(value = "/views/admin/pop/batchPagePop", method = RequestMethod.GET)
	public String BacthPageGet(HttpServletRequest request) { 
		logger.info("BacthGet Page Start");
		logger.info("BacthGet Page End");
		
		return "/admin/pop/batchPagePop";
	}
	
	//POST거래 : 직원정보 UPDATE/INSERT
	@RequestMapping(value = "/views/admin/pop/addUserBat", method = RequestMethod.POST)
	public @ResponseBody String AddUserBat() {
        try{
        	logger.info("[BATCH] Cmu001m START ======================");
        	//keyValue(메서드명체크)
        	String mName = new Object() {}.getClass().getEnclosingMethod().getName();
            //파일 객체 생성
        	//read_path = File.separator + FILE_PATH + File.separator + mName + File.separator +"EDW_D_CMU001M.dat";
        	read_path = "C:\\dat\\AddUserBat\\EDW_D_CMU001M.dat";
        	logger.info("FILE path : "+read_path);
            File file = new File(read_path);
            
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            //입력 버퍼 생성
            BufferedReader bufReader = new BufferedReader(filereader);
            
            String line = "";
            String[] sArray;
            int sCnt = 0; 
            CluVo vo = new CluVo();
            int rCnt = 0;
            while((line = bufReader.readLine()) != null){
            	rCnt++;
            	sArray = line.split("[|]");
            	sCnt = sArray.length;
            	logger.info("[BATCH] line : "+line+" / count :"+sCnt);
            	if(sCnt>0) {
            		vo.setUserId(sArray[0]);
            		vo.setUserNm(sArray[1].trim());
            		vo.setUserJtm(sArray[2]);
            		vo.setUserTpn(sArray[3]);
            		vo.setTeamCd(sArray[4]);
            		vo.setDvcd(sArray[5]);
            		vo.setUseYn(sArray[6]);
            		int regRst = service.upsertUser(vo);
            		logger.info("[BATCH] RESULT : "+ regRst);
            	}
            	
            }
            //.readLine()은 끝에 개행문자를 읽지 않는다.            
            bufReader.close();
            logger.info("[BATCH] Cmu001m END ======================");
            return "success"+"@@"+rCnt;
        }catch (FileNotFoundException e) {
            // TODO: handle exception
        	logger.info("[BATCH] Cmu001m Failed : NoFile ==========");
        	return "nofile"+"@@"+e;
        }catch(IOException e){
            logger.info("RESULT : "+e);
            logger.info("[BATCH] Cmu001m Failed : Job Failed ======");
            return "failed"+"@@"+e;
        }
    }
	
	//POST거래 : 부서정보 UPDATE/INSERT
	@RequestMapping(value = "/views/admin/pop/addBranchBat", method = RequestMethod.POST)
	public @ResponseBody String AddBranchBat() {
        try{
        	logger.info("[BATCH] Cmb001m START ======================");
        	//keyValue(메서드명체크)
        	String mName = new Object() {}.getClass().getEnclosingMethod().getName();
            //파일 객체 생성
        	//read_path = FILE_PATH + File.separator + mName + File.separator +"EDW_D_CMB001M.dat";
        	read_path = "C:\\dat\\AddBranchBat\\EDW_D_CMB001M.dat";
            File file = new File(read_path);
            
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            //입력 버퍼 생성
            BufferedReader bufReader = new BufferedReader(filereader);
            
            String line = "";
            String[] sArray;
            int sCnt = 0; 
            CmbVo vo = new CmbVo();
            int rCnt = 0;
            while((line = bufReader.readLine()) != null){
            	rCnt++;
            	sArray = line.split("[|]");
            	sCnt = sArray.length;
            	logger.info("[BATCH] line : "+ line);
            	if(sCnt>0) {
            		vo.setBrcd(sArray[0]);
            		vo.setBrnm(sArray[1].trim());
            		vo.setHgrn_brcd(sArray[2]);
            		vo.setUseYn(sArray[3]);
            		int regRst = service.upsertBranch(vo);
            		logger.info("[BATCH] RESULT : "+ regRst);
            	}
            }
            //.readLine()은 끝에 개행문자를 읽지 않는다.            
            bufReader.close();
            logger.info("[BATCH] Cmb001m END ======================");
            return "success"+"@@"+rCnt;
        }catch (FileNotFoundException e) {
            // TODO: handle exception
        	logger.info("[BATCH] Cmb001m Failed : NoFile ==========");
        	return "nofile"+"@@"+e;
        }catch(IOException e){
            logger.info("RESULT : "+e);
            logger.info("[BATCH] Cmb001m Failed : Job Failed ======");
            return "failed"+"@@"+e;
        }
	}
}