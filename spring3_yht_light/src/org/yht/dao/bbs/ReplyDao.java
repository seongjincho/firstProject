package org.yht.dao.bbs;



import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yht.domain.test01.ReplyVo;

@Repository("ReplyDao")
public class ReplyDao {
	
	@Resource(name="sqlSession")
	SqlSession sqlSession;
	
	public boolean replyInsert(ReplyVo vo) {	
		
		int n = sqlSession.insert("Reply.replyInsert", vo);
		
		return n>0?true:false;
	}
	
	public boolean replyDelete(ReplyVo vo) {
		
		int n = sqlSession.update("Reply.replyDelete", vo);
		
		return n>0?true:false;
		
	}
	
	public boolean replyUpdate(ReplyVo vo) {
		
		int n = sqlSession.update("Reply.replyUpdate", vo);
		
		return n>0?true:false;
	}
	
	public boolean replyStepUp(ReplyVo vo) {
		
		int n = sqlSession.update("Reply.replyStepUp", vo);
		
		return n>0?true:false;
	}
	
	public boolean reReply(ReplyVo vo) {
		
		int n = sqlSession.update("Reply.reReply", vo);
		
		return n>0?true:false;
		
	}
}
