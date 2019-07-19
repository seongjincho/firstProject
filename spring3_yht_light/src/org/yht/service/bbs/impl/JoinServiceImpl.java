package org.yht.service.bbs.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.yht.dao.bbs.JoinDao;
import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.MemberVo;
import org.yht.service.bbs.JoinService;

@Repository("JoinService")
public class JoinServiceImpl implements JoinService {
	
	@Resource(name="JoinDao")
	JoinDao joinDao;
	

	@Override
	public boolean joinInsert(JoinVo vo) {
		
		return joinDao.joinInsert(vo);
	}


	@Override
	public JoinVo getJoin(JoinVo vo) {
		
		return joinDao.getJoin(vo);
	}


	@Override
	public boolean joinDel(JoinVo vo) {
		
		return joinDao.joinDel(vo);
	}


	@Override
	public boolean join_cnt(JoinVo vo) {
		
		return joinDao.join_cnt(vo);
	}


	@Override
	public List<JoinVo> food_joinlist(int food_seq) {
		
		return joinDao.food_joinlist(food_seq);
	}


	@Override
	public MemberVo showMemberInfo(String id) {
		
		return joinDao.showMemberInfo(id);
	}
	
	
	
}
