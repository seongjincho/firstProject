package org.yht.dao.bbs;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.LikeVo;

@Repository("JoinDao")
public class JoinDao {

	@Resource(name="sqlSession")
	SqlSession sqlSession;
	
	public boolean joinInsert(JoinVo vo) {
		
		int n = sqlSession.update("Join.joinInsert", vo);
		
		return n>0?true:false;
	}
	
	public JoinVo getJoin(JoinVo vo) {
		
		return sqlSession.selectOne("Join.getJoin", vo);
		
	}
	
	public boolean joinDel(JoinVo vo) {
		
		int n = sqlSession.delete("Join.joinDel", vo);
		
		return n>0?true:false;
	}
	
	public boolean join_cnt(JoinVo vo) {
		
		int n = sqlSession.update("Join.join_cnt", vo);
		
		return n>0?true:false;
	}
	
}
