package com.ibk.itep.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EduRndRegModVo;

@Service
public class EduRndRegModService {
	
	@Autowired
	private AdminDao adminDao;
	
	public List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo vo){
		if(vo.getEdctId() == null) {
			return null;
		}
		return o;
	}
	/*
public List<EduRegModVo> selectEduRegMod(EduRegModVo vo){
		
		if(vo.getEdctClsfCd().equalsIgnoreCase("ALL"))
		{
			vo.setEdctClsfCd(null);
		}
		return adminDao.selectEduRegMod(vo);
	}
	
	public boolean deleteEduRegMod(EduRegModVo vo) {
		if(vo.getEdctId() != null) {
			return adminDao.deleteEduRegMod(vo);
		}
		return false;		
	}
	
	public boolean insertEduRegMod(EduRegModVo vo) {
			return adminDao.insertEduRegMod(vo);
	}
*/
}
