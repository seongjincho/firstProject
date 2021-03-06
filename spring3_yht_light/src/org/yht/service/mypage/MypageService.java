package org.yht.service.mypage;

import java.util.List;

import org.yht.domain.test01.DonationVo;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.MemberVo;

public interface MypageService {
	
	public MemberVo checkPwd(MemberVo vo);
	public MemberVo myPhone(MemberVo vo);
	public String phoneCheck(MemberVo vo);
	public boolean mypage_update(MemberVo vo);
	public MemberVo getUpdateInfo(String id);
	public boolean mypage_delete(String id);
	public List<FoodVo> mypage_like(String id);
	public List<FoodVo> mypage_join(String id);
	/*public int getMyJoinCount(String id);*/
	public List<MemberVo> memberList();
	public boolean memberUpdate(MemberVo vo);
	public int totalDonation();
	public boolean donating(DonationVo vo);
	public List<DonationVo> my_donation(String id);
	public int myTotalDonation(String id);
	public List<DonationVo> donationList();
}
