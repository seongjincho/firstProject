package org.yht.service.mypage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.yht.dao.mypage.MypageDao;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.MemberVo;
import org.yht.service.mypage.MypageService;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {

	@Resource(name="MypageDao")
	MypageDao mypageDao;

	@Override
	public MemberVo checkPwd(MemberVo vo) {
		
		return mypageDao.checkPwd(vo);
	}

	@Override
	public MemberVo myPhone(MemberVo vo) {
		
		return mypageDao.myPhone(vo);
	}

	@Override
	public String phoneCheck(MemberVo vo) {
		
		return mypageDao.phoneCheck(vo);
	}
	
	

	@Override
	public MemberVo getUpdateInfo(String id) {
		
		return mypageDao.getUpdateInfo(id);
	}

	@Override
	public boolean mypage_update(MemberVo vo) {
		
		return mypageDao.mypage_update(vo);
	}

	@Override
	public boolean mypage_delete(String id) {
		
		return mypageDao.mypage_delete(id);
	}

	@Override
	public List<FoodVo> mypage_like(String id) {
		
		return mypageDao.mypage_like(id);
	}

	@Override
	public List<FoodVo> mypage_join(String id) {
		
		return mypageDao.mypage_join(id);
	}

	@Override
	public List<MemberVo> memberList() {
		
		return mypageDao.memberList();
	}

	@Override
	public boolean memberUpdate(MemberVo vo) {
		
		return mypageDao.memberUpdate(vo);
	}
	
	
	
	
	
	
	
	
	
	
}
