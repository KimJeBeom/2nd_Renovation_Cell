package com.ibk.itep.controller.admin.pop;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibk.itep.service.BatchService;
 
@Controller
public class BatchPageController {
	
	@Autowired private BatchService service;

	private static final Logger logger = LoggerFactory.getLogger(BatchPageController.class);
	
	//GET거래 : 최초접속시 / 조회시  거래
	@RequestMapping(value = "/views/admin/pop/batchPagePop", method = RequestMethod.GET)
	public String BacthPageGet(HttpServletRequest request) { 
		logger.info("BacthGet Page Start");
		return "/admin/pop/batchPagePop";
	}
	
	//POST거래 : 직원정보 UPDATE/INSERT
	@RequestMapping(value = "/views/admin/pop/addUserBat", method = RequestMethod.POST)
	public @ResponseBody String AddUserBat() {
		logger.info("BacthGet AddUserBat Start");
		
    	//keyValue(메서드명체크)
    	String mName = new Object() {}.getClass().getEnclosingMethod().getName();
		String regRst = service.upsertUser(mName);
		
		logger.info("BacthGet AddUserBat End");
        return regRst;
    }
	
	//POST거래 : 부서정보 UPDATE/INSERT
	@RequestMapping(value = "/views/admin/pop/addBranchBat", method = RequestMethod.POST)
	public @ResponseBody String AddBranchBat() {
		logger.info("BacthGet AddBranchBat Start");
		
    	//keyValue(메서드명체크)
    	String mName = new Object() {}.getClass().getEnclosingMethod().getName();
		String regRst = service.upsertBranch(mName);
		
		logger.info("BacthGet AddBranchBat End");
        return regRst;
	}
}