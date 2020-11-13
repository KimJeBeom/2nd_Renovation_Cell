package com.ibk.itep.service.board;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.board.NoticeVo;

@Service
public class NoticeService {
	
	@Autowired private NoticeDao noticeDAO;
	
	public List<NoticeVo> getList(NoticeVo vo){
		
		//NoticeDao dao = new NoticeDao();
		//System.out.println("selectNotice : "+ noticeDAO.selectNotice(vo));
		System.out.println("###service OK"+vo.getTtl());
	
		List<NoticeVo> list =  noticeDAO.selectNotice(vo);
		/*
		DateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		for (int i = 0; i <= list.size(); i++) {
			Date TsTemp = format.format(list.get(i,"rgsnTs"));  
			list.set(i,"rgsnTs") = TsTemp; 
		}
		*/
		return list;
	}
	
	public NoticeVo getDetail(NoticeVo vo){
		
		System.out.println("###service OK"+vo.getPbnsId());
	
		NoticeVo outVo =  noticeDAO.selectNoticeDetail(vo);

		return outVo;
	}
	
	public boolean modAction(NoticeVo vo,String modType){
		
		System.out.println("###service OK"+vo.getPbnsId()+"/ ActionType="+modType);
		boolean modRst = false;
		
		if(modType.equals("update")) {
			modRst =  noticeDAO.updateNotice(vo);
		}else if(modType.equals("delete")){
			modRst =  noticeDAO.deleteNotice(vo);
		}else if(modType.equals("insert")){
			vo.setUserId("40868");
			modRst =  noticeDAO.insertNotice(vo);
		}
		return modRst;
	}

}
