package org.yht.service.bbs.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.yht.dao.bbs.ReplyDao;
import org.yht.domain.test01.ReplyVo;
import org.yht.service.bbs.ReplyService;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService {

	@Resource(name="ReplyDao")
	ReplyDao replyDao;

	@Override
	public boolean replyInsert(ReplyVo vo) {
		
		return replyDao.replyInsert(vo);
	}

	@Override
	public boolean replyDelete(ReplyVo vo) {
		
		return replyDao.replyDelete(vo);
	}

	@Override
	public boolean replyUpdate(ReplyVo vo) {
		
		return replyDao.replyUpdate(vo);
	}

	@Override
	public void reReply(ReplyVo vo) {
		
		boolean isStep = replyDao.replyStepUp(vo);
		
		if(isStep) {
			System.out.println("스텝 성공 ");
		}else {
			System.out.println("스텝 실패 ");
		}
		
		boolean isReply = replyDao.reReply(vo);
		
		if(isReply) {
			System.out.println("답글 추가 성공 ");
		}else {
			System.out.println("답글 추가 실패 ");
		}
		
		
	} 
	
	
	
	
}
