package org.yht.service.bbs.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.yht.dao.bbs.NoticeDao;
import org.yht.domain.test01.NoticeParam;
import org.yht.domain.test01.NoticeVo;
import org.yht.service.bbs.NoticeService;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name="NoticeDao")
	NoticeDao noticeDao;

	@Override
	public List<NoticeVo> getNoticeList(NoticeParam param) {
		
		return noticeDao.getNoticeList(param);
	}

	@Override
	public int getNoticeCount(NoticeParam param) {
		
		return noticeDao.getNoticeCount(param);
	}

	@Override
	public boolean writeNotice(NoticeVo vo) {
		
		return noticeDao.writeNotice(vo);
	}

	
	@Override
	public NoticeVo getNotice(int notice_seq) {
		
		return noticeDao.getNotice(notice_seq);
	}

	@Override
	public boolean updateNotice(NoticeVo vo) {
		
		return noticeDao.updateNotice(vo);
	}

	@Override
	public boolean deleteNotice(int notice_seq) {
		
		return noticeDao.deleteNotice(notice_seq);
	}

	@Override
	public boolean noticeReadcount(int notice_seq) {
		
		return noticeDao.noticeReadcount(notice_seq);
	}

	@Override
	public int getNoticeReadcount(int notice_seq) {
		
		return noticeDao.getNoticeReadcount(notice_seq);
	}
	
	
	
}
