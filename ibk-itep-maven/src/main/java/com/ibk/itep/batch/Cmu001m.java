package com.ibk.itep.batch;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibk.itep.repository.batch.BatchDao;
import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.cmm.CluVo;
 
public class Cmu001m {
	
	@Autowired private static BatchDao batchDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	
    public static void main(String[] args){
        try{
        	logger.info("[BATCH] Cmu001m START ======================");
            //파일 객체 생성
            File file = new File("C:\\dat\\sam\\cmu001m\\EDW_D_DU210_TIA.dat");
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            //입력 버퍼 생성
            BufferedReader bufReader = new BufferedReader(filereader);
            
            String line = "";
            String[] sArray;
            int sCnt = 0; 
            CluVo vo = new CluVo();
            while((line = bufReader.readLine()) != null){
            	sArray = line.split("[|]");
            	sCnt = sArray.length;
            	logger.info("[BATCH] line : "+line);
            	if(sCnt>0) {
            		vo.setUserId(sArray[0]);
            		vo.setUserNm(sArray[2].trim());
            		vo.setUserJtm(sArray[6]);
            		vo.setUsertpn(sArray[9]);
            		vo.setTeamCd(sArray[3]);
            		vo.setDvcd(sArray[3]);
            		vo.setAthrCd(sArray[13]);
            		int regRst = batchDAO.upsertUser(vo);
            		logger.info("[BATCH] RESULT : "+ regRst);
            	}
            	
            }
            //.readLine()은 끝에 개행문자를 읽지 않는다.            
            bufReader.close();
            logger.info("[BATCH] Cmu001m END ======================");
            
        }catch (FileNotFoundException e) {
            // TODO: handle exception
        }catch(IOException e){
            System.out.println(e);
        }
    }
}