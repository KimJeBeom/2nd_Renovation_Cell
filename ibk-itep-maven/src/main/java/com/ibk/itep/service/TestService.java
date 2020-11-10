package com.ibk.itep.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.TestDAO;
import com.ibk.itep.vo.ApprListVO;
import com.ibk.itep.vo.TestVO;


@Service
public class TestService {
	@Autowired
	private TestDAO testDAO;
	
	public String getSysdate(){
		return testDAO.getSysdate();
	}
	
	public List<TestVO> getList(){
		return testDAO.getList();
	}
	
	public boolean insert(TestVO vo ) {
		return testDAO.insert(vo);
	}
	
	public boolean delete(TestVO vo) {
		String originPwd = testDAO.getPwd(vo.getNo());
		String inputPwd = "pwd";
		
		if(!originPwd.equals(inputPwd) ) {
			return false;
		}
		
		return testDAO.delete(vo.getNo());
	}
}

