package org.yht.dao.bbs;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.LikeVo;

@Repository("LikeDao")
public class LikeDao {

	@Resource(name="sqlSession")
	SqlSession sqlSession;
	
	public boolean likeInsert(LikeVo vo) {
		
		int n = sqlSession.insert("Like.likeInsert", vo);
		
		return n>0?true:false;
	}
	
	public LikeVo getLike(LikeVo vo) {
		
		return sqlSession.selectOne("Like.getLike", vo);
		
	}
	
	public boolean likeDel(LikeVo vo) {
		
		int n = sqlSession.delete("Like.likeDel", vo);
		
		return n>0?true:false;
	}
	
	public boolean like_cnt(LikeVo vo) {
		
		int n = sqlSession.update("Like.like_cnt", vo);
		
		return n>0?true:false;
	}
}
