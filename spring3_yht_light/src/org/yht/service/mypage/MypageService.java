package org.yht.service.mypage;

import java.util.List;

import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.MemberVo;

public interface MypageService {
	
	public MemberVo checkPwd(MemberVo vo);
	public MemberVo myPhone(MemberVo vo);
	public String phoneCheck(MemberVo vo);
	public boolean mypage_update(MemberVo vo);
	public boolean mypage_delete(String id);
	public List<FoodVo> mypage_like(String id);
	public List<FoodVo> mypage_join(String id);
}
