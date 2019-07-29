package org.yht.dao.mypage;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.FoodVo;
import org.yht.domain.test01.MemberVo;

@Repository("MypageDao")
public class MypageDao {

	@Resource(name="sqlSession")
	SqlSession sqlSession;
	
	public MemberVo checkPwd(MemberVo vo) {
		return sqlSession.selectOne("Mypage.checkPwd", vo);
	}
	
	public MemberVo myPhone(MemberVo vo) {
		return sqlSession.selectOne("Mypage.myPhone", vo);
	}
	
	public String phoneCheck(MemberVo vo) {
		return sqlSession.selectOne("Mypage.phoneCheck", vo);
	}
	
	public MemberVo getUpdateInfo(String id) {
		return sqlSession.selectOne("Mypage.getUpdateInfo", id);
	}
	
	public boolean mypage_update(MemberVo vo) {
		
		int n = sqlSession.update("Mypage.mypage_update", vo);
		
		return n>0?true:false;
	}
	
	public boolean mypage_delete(String id) {
		int n = sqlSession.update("Mypage.mypage_delete", id);
		
		return n>0?true:false;
	}
	
	public List<FoodVo> mypage_like(String id) {
		return sqlSession.selectList("Mypage.mypage_like", id);	
	}
	
	public List<FoodVo> mypage_join(String id) {
		return sqlSession.selectList("Mypage.mypage_join", id);
	}
	
/*	public int getMyJoinCount(String id) {
		return sqlSession.selectOne("Mypage.getMyJoinCount", id);
	}
	*/
	public List<MemberVo> memberList(){
		return sqlSession.selectList("Mypage.memberList");
	}
	
	public boolean memberUpdate(MemberVo vo) {
	
		int n = sqlSession.update("Mypage.memberUpdate", vo);
		return n>0? true:false;
	}
}
