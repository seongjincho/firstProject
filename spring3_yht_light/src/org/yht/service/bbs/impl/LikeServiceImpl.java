package org.yht.service.bbs.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.yht.dao.bbs.LikeDao;
import org.yht.domain.test01.LikeVo;
import org.yht.service.bbs.LikeService;

@Repository("LikeService")
public class LikeServiceImpl implements LikeService {

	@Resource(name="LikeDao")
	LikeDao likeDao;
	
	@Override
	public boolean likeInsert(LikeVo vo) {
		
		return likeDao.likeInsert(vo);
	}

	@Override
	public LikeVo getLike(LikeVo vo) {
		
		return likeDao.getLike(vo);
	}

	@Override
	public boolean likeDel(LikeVo vo) {
		
		return likeDao.likeDel(vo);
	}

	@Override
	public boolean like_cnt(LikeVo vo) {
		
		return likeDao.like_cnt(vo);
	}
	
	

}
