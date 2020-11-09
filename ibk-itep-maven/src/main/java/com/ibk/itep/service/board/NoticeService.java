package com.ibk.itep.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.board.NoticeVo;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDAO;
	
	public List<NoticeVo> getList(NoticeVo vo){
		
		String ttl = "°øÁö";
		vo.setTtl(ttl);
		
		//System.out.println("selectNotice : "+ noticeDAO.selectNotice(vo));
		System.out.println("###service OK"+ttl);
		return noticeDAO.selectNotice(vo);
	}

}
