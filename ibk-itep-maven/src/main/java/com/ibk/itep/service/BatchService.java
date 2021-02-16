package com.ibk.itep.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ibk.itep.controller.admin.pop.BatchPageController;
import com.ibk.itep.repository.batch.BatchDao;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.cmm.CmbVo;


@Service
public class BatchService {
	
	@Value("${file.path1}") private String FILE_PATH;
	@Autowired private BatchDao batchDAO;
	private String read_path = null;

	private static final Logger logger = LoggerFactory.getLogger(BatchPageController.class);
	
	//직원등록서비스
	public String upsertUser(String mName) {
        try {
        	logger.info("[BATCH] Cmu001m START ======================");
        	
	        //파일 객체 생성(root/dat/컨트롤러명/EDW_D_CMU001M.dat)
	    	read_path = File.separator + FILE_PATH + File.separator + mName + File.separator +"EDW_D_CMU001M.dat";
	        //입력 스트림 생성(UTF-8변환)
	        FileInputStream input = new FileInputStream(read_path);
	        InputStreamReader filereader = new InputStreamReader(input,"UTF-8");
	        //입력 버퍼 생성
	        BufferedReader bufReader = new BufferedReader(filereader);
	        
	        String line = "";
	        String[] sArray;
	        int sCnt = 0; 
	        int rCnt = 0;
	        CluVo vo = new CluVo();

	        //파일의 LINE수로 1열씩 update/insert진행
			while((line = bufReader.readLine()) != null){
				rCnt++;
				sArray = line.split("[^|]");
				sCnt = sArray.length;
				logger.info("[BATCH] line : "+line+" / count :"+sCnt);
				if(sCnt>0) {
					vo.setUserId(sArray[1]);
					vo.setUserNm(sArray[0].trim());
				  if(sArray[16] != null) {//직원대외호칭명
					   vo.setUserJtm(sArray[16]);
			 	  }else{
					   vo.setUserJtm(sArray[15]); //직급명	
				  }
					vo.setUserTpn(sArray[3]); //행내전화
					vo.setTeamCd(sArray[10]); //팀코드
				  if(sArray[12] == "0004" || sArray[9] == "0002") {
					  vo.setDvcd(sArray[10]); //부서급팀인경우 부서코드 팀코드으로 지정
				  }else {
					  vo.setDvcd(sArray[7]); //부서코드
				  }
					vo.setUseYn("Y"); //사용여부
					vo.setAthrCd(batchDAO.userAthrChk(vo)); //유저권한획득
					int regRst = batchDAO.upsertUser(vo);
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
	
	//부서등록 서비스
	public String upsertBranch(String mName) {
		
        try{
        	logger.info("[BATCH] Cmb001m START ======================");

	        //파일 객체 생성(root/dat/컨트롤러명/EDW_D_CMB001M.dat)
        	read_path = File.separator + FILE_PATH + File.separator + mName + File.separator +"EDW_D_CMB001M.dat";
	        //입력 스트림 생성(UTF-8변환)
	        FileInputStream input = new FileInputStream(read_path);
	        InputStreamReader filereader = new InputStreamReader(input,"UTF-8");
	        //입력 버퍼 생성
	        BufferedReader bufReader = new BufferedReader(filereader);
            
            String line = "";
            String[] sArray;
            int sCnt = 0; 
            int rCnt = 0;
            CmbVo vo = new CmbVo();
            
            //파일의 LINE수로 1열씩 update/insert진행
            while((line = bufReader.readLine()) != null){
            	rCnt++;
            	sArray = line.split("[^|]");
            	sCnt = sArray.length;
            	logger.info("[BATCH] line : "+ line);
            	if(sCnt>0) {
            		vo.setBrcd(sArray[7]);
            		vo.setBrnm(sArray[8].trim());
            		vo.setHgrn_brcd(sArray[13]); //상위부점코드
            		vo.setUseYn("Y");
            		int regRst = batchDAO.upsertBranch(vo);
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

