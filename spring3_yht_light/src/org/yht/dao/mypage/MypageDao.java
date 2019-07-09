package org.yht.dao.mypage;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
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
	
	public boolean mypage_update(MemberVo vo) {
		
		int n = sqlSession.update("Mypage.mypage_update", vo);
		
		return n>0?true:false;
	}
}
