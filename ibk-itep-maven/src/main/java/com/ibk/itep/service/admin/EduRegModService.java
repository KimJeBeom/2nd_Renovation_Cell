package com.ibk.itep.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EduRegModVo;

@Service
public class EduRegModService {
	
	@Autowired
	private AdminDao adminDao;
	
	public List<EduRegModVo> selectEduRegMod(EduRegModVo vo){
		return adminDao.selectEduRegMod(vo);
	}
}

