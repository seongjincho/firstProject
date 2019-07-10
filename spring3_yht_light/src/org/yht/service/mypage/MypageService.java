package org.yht.service.mypage;

import org.yht.domain.test01.MemberVo;

public interface MypageService {
	
	public MemberVo checkPwd(MemberVo vo);
	public MemberVo myPhone(MemberVo vo);
	public String phoneCheck(MemberVo vo);
	public boolean mypage_update(MemberVo vo);
	public boolean mypage_delete(String id);

}
