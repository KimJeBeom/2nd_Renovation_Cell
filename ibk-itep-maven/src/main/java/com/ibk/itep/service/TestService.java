package com.ibk.itep.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.TestDAO;
import com.ibk.itep.vo.TestVO;


@Service
public class TestService {
	@Autowired
	private TestDAO testDAO;
	
	public String getSysdate(){
		return testDAO.getSysdate();
	}
}

